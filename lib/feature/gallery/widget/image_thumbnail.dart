import 'dart:typed_data';

import 'package:cafein_flutter/feature/gallery/bloc/gallery_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageThumbnail extends StatefulWidget {
  const ImageThumbnail({
    Key? key,
    required this.assetEntity,
    required this.imageData,
    required this.index,
  }) : super(key: key);

  final AssetEntity assetEntity;
  final Uint8List imageData;
  final int index;

  @override
  State<ImageThumbnail> createState() => _ImageThumbnailState();
}

class _ImageThumbnailState extends State<ImageThumbnail>
    with AutomaticKeepAliveClientMixin {
  bool check = false;
  int currentNumber = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<GalleryBloc, GalleryState>(
      buildWhen: (pre, next) => next is GalleryPhotoChecked && !next.isLimited,
      builder: (context, state) {
        if (state is GalleryPhotoChecked) {
          final currentIndex = state.selectedDataList.indexWhere(
            (element) => element == widget.assetEntity,
          );

          currentNumber = currentIndex != -1 ? currentIndex + 1 : 0;
          check = state.selectedDataList.contains(widget.assetEntity);
        }

        return InkWell(
          onTap: () => context.read<GalleryBloc>().add(
                GalleryPhotoStateChanged(
                  index: widget.index,
                  isChecked: !check,
                ),
              ),
          child: Stack(
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
                child: check && currentNumber != 0
                    ? CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColor.orange500,
                        foregroundColor: AppColor.white,
                        child: Center(
                          child: Text(
                            '$currentNumber',
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
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
