import 'package:cafein_flutter/feature/gallery/bloc/gallery_bloc.dart';
import 'package:cafein_flutter/feature/gallery/widget/gallery_limited_dialog.dart';
import 'package:cafein_flutter/feature/gallery/widget/image_thumbnail.dart';
import 'package:cafein_flutter/feature/main/bloc/camera_permission_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  static const routeName = 'GalleryPage';

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final pagingController = PagingController<int, AssetEntity>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener(
      (_) => context.read<GalleryBloc>().add(
            const GalleryPhotoRequested(),
          ),
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GalleryBloc, GalleryState>(
          listener: (context, state) {
            if (state is GalleryError) {
              ErrorDialog.show(
                context,
                error: state.error,
                refresh: state.event,
              );
            } else if (state is GalleryPhotoChecked && state.isLimited) {
              GalleryLimitedDialog.show(context);
            } else if (state is GalleryLoaded) {
              pagingController.value = PagingState(
                itemList: state.recentAssets,
                nextPageKey: state.nextPage,
              );
            } else if (state is GalleryCameraPhotoLoaded) {
              Navigator.of(context).pop([state.imageUrl]);
            }
          },
        ),
        BlocListener<CameraPermissionBloc, CameraPermissionState>(
          listener: (context, state) async {
            final bloc = context.read<GalleryBloc>();

            if (state is CameraPermissionChecked &&
                state.processType == CameraProcessType.gallery) {
              if (!state.permissionStatus.isGranted) {
                final result = await PermissionDialog.show(context);

                if (!result) {
                  return;
                }

                openAppSettings();

                return;
              }

              bloc.add(const GalleryCameraRequested());
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: loadAsset(
              AppIcon.clear24S,
              fit: BoxFit.scaleDown,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: BlocBuilder<GalleryBloc, GalleryState>(
                buildWhen: (pre, next) => next is GalleryPhotoChecked,
                builder: (context, state) {
                  if (state is GalleryPhotoChecked) {
                    return Text(
                      '${state.selectedCount}',
                      style: AppStyle.subTitle14Medium.copyWith(
                        color: AppColor.orange500,
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                top: 16,
              ),
              child: InkWell(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  final assets = context.read<GalleryBloc>().selectedAsset;

                  final imagePathList = <String>[];
                  for (final asset in assets) {
                    final file = await asset.originFile;
                    imagePathList.add(file!.path);
                  }

                  navigator.pop(imagePathList);
                },
                child: const Text(
                  '완료',
                  style: AppStyle.subTitle14Medium,
                ),
              ),
            ),
          ],
          title: const Text('사진첩'),
        ),
        body: PagedGridView<int, AssetEntity>(
          pagingController: pagingController,
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 100 / 150,
            mainAxisExtent: 120,
          ),
          builderDelegate: PagedChildBuilderDelegate<AssetEntity>(
            itemBuilder: (context, item, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () => context.read<CameraPermissionBloc>().add(
                        const CameraPermissionRequested(
                          processType: CameraProcessType.gallery,
                        ),
                      ),
                  child: Container(
                    color: AppColor.grey100,
                    child: Center(
                      child: loadAsset(
                        AppIcon.camera,
                        color: AppColor.grey400,
                      ),
                    ),
                  ),
                );
              }
              return FutureBuilder<Uint8List?>(
                future: item.thumbnailData,
                builder: (_, snapshot) {
                  final bytes = snapshot.data;
                  if (bytes == null) {
                    return const CustomCircleLoadingIndicator();
                  }
                  return ImageThumbnail(
                    assetEntity: item,
                    imageData: bytes,
                    index: index,
                  );
                },
              );
            },
            firstPageProgressIndicatorBuilder: (_) =>
                const CustomCircleLoadingIndicator(),
            newPageProgressIndicatorBuilder: (_) => const SizedBox(
              height: 120,
              child: Center(
                child: CustomCircleLoadingIndicator(),
              ),
            ),
            firstPageErrorIndicatorBuilder: (_) => const SizedBox.shrink(),
            newPageErrorIndicatorBuilder: (_) => const SizedBox.shrink(),
            noMoreItemsIndicatorBuilder: (_) => const SizedBox.shrink(),
            noItemsFoundIndicatorBuilder: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
