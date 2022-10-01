import 'package:cafein_flutter/feature/gallery/bloc/gallery_bloc.dart';
import 'package:cafein_flutter/feature/gallery/widget/gallery_limited_dialog.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  static const routeName = 'GalleryPage';

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<GalleryBloc>().add(
          const GalleryPhotoRequested(),
        );

    controller.addListener(
      () {
        if (controller.offset == controller.position.maxScrollExtent) {
          context.read<GalleryBloc>().add(
                const GalleryPhotoRequested(),
              );
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryBloc, GalleryState>(
      listener: (context, state) {
        if (state is GalleryErorr) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is GalleryPhotoChecked && state.isLimited) {
          GalleryLimitedDialog.show(context);
        }
      },
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
        body: BlocBuilder<GalleryBloc, GalleryState>(
          buildWhen: (pre, next) => next is GalleryLoaded,
          builder: (context, state) {
            if (state is GalleryLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 120,
                ),
                controller: controller,
                itemCount: state.recentAssets.length,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return InkWell(
                      onTap: () {},
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
                    future: state.recentAssets[index].thumbnailData,
                    builder: (_, snapshot) {
                      final bytes = snapshot.data;
                      if (bytes == null) {
                        return const CustomCircleLoadingIndicator();
                      }
                      return BlocBuilder<GalleryBloc, GalleryState>(
                        buildWhen: (pre, next) =>
                            next is GalleryPhotoChecked && !next.isLimited && next.index == index,
                        builder: (context, state) {
                          bool check = false;
                          int currentNumber = 0;
                          if (state is GalleryPhotoChecked) {
                            check = state.isChecked;
                            currentNumber = state.currentCount;
                          }
                          return InkWell(
                            onTap: () async {
                              context.read<GalleryBloc>().add(
                                    GalleryPhotoStateChanged(
                                      index: index,
                                      isChecked: !check,
                                    ),
                                  );
                            },
                            child: ImageThumbnail(
                              imageData: bytes,
                              check: check,
                              index: index,
                              currentNumber: currentNumber,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            }

            return const CustomCircleLoadingIndicator();
          },
        ),
      ),
    );
  }
}

class ImageThumbnail extends StatefulWidget {
  const ImageThumbnail({
    Key? key,
    required this.imageData,
    required this.check,
    required this.index,
    required this.currentNumber,
  }) : super(key: key);

  final Uint8List imageData;
  final bool check;
  final int index;
  final int currentNumber;

  @override
  State<ImageThumbnail> createState() => _ImageThumbnailState();
}

class _ImageThumbnailState extends State<ImageThumbnail> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.memory(
            widget.imageData,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: widget.check
              ? CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColor.orange500,
                  foregroundColor: AppColor.white,
                  child: Center(
                    child: Text(
                      '${widget.currentNumber}',
                      style: AppStyle.caption13SemiBold,
                    ),
                  ),
                )
              : Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      color: AppColor.white,
                    ),
                    color: Colors.transparent,
                  ),
                ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
