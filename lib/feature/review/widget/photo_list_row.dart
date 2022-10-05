import 'dart:io';

import 'package:cafein_flutter/data/model/common/image_type_pair.dart';
import 'package:cafein_flutter/data/model/enum/image_type.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoListRow extends StatelessWidget {
  const PhotoListRow({
    super.key,
    required this.itemCount,
    required this.photos,
    required this.onTapPhoto,
    required this.deleteImage,
  });

  final int itemCount;
  final List<ImageTypePair> photos;
  final void Function() onTapPhoto;
  final void Function(
    String imageUrl,
    ImageType imageType,
  ) deleteImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: onTapPhoto,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 64,
                  height: 64,
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColor.grey300,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: Column(
                      children: [
                        loadAsset(
                          AppIcon.cameraL,
                          color: AppColor.grey400,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${itemCount - 1}',
                              style: AppStyle.subTitle14Medium.copyWith(
                                color: AppColor.orange500,
                              ),
                            ),
                            Text(
                              "/5",
                              style: AppStyle.subTitle14Medium.copyWith(
                                color: AppColor.grey400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                photos[index - 1].imageType == ImageType.network
                    ? CustomCachedNetworkImage(
                        imageUrl: photos[index - 1].imageUrl,
                        height: 64,
                        width: 64,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(photos[index - 1].imageUrl),
                        height: 64,
                        width: 64,
                        fit: BoxFit.cover,
                      ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () => deleteImage(
                      photos[index - 1].imageUrl,
                      photos[index - 1].imageType,
                    ),
                    child: loadAsset(
                      AppIcon.closeGrey800,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemCount: itemCount,
      ),
    );
  }
}
