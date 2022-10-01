import 'package:cafein_flutter/feature/gallery/bloc/gallery_bloc.dart';
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
        } else if (state is GalleryPhotoChecked && state.isLimited) {}
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
              child: Text(
                '1',
                style: AppStyle.subTitle14Medium.copyWith(
                  color: AppColor.orange500,
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Padding(
              padding: EdgeInsets.only(
                right: 16,
                top: 16,
              ),
              child: Text(
                '완료',
                style: AppStyle.subTitle14Medium,
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
                      return InkWell(
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          final imageFile = await state.recentAssets[index].originFile;
                          navigator.pop(imageFile!.path);
                        },
                        child: ImageThumbnail(
                          imageData: bytes,
                          check: false,
                          index: index,
                        ),
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

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    Key? key,
    required this.imageData,
    required this.check,
    required this.index,
  }) : super(key: key);

  final Uint8List imageData;
  final bool check;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.memory(
            imageData,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        check
            ? const Opacity(
                opacity: 0.4,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ),
              )
            : const SizedBox.shrink(),
        check
            ? const Center(
                child: Icon(
                Icons.check,
              ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
