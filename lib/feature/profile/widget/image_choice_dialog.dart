import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

enum ImageChoiceType {
  defalut('카페인 랜덤 이미지 사용'),
  photo('사진'),
  camera('카메라'),
  none('');

  final String title;

  const ImageChoiceType(this.title);
}

extension ImageChoiceTypeConfirm on ImageChoiceType {
  bool get isCamera => this == ImageChoiceType.camera;

  bool get isPhoto => this == ImageChoiceType.photo;

  bool get isDefault => this == ImageChoiceType.defalut;
}

class ImageChoiceDialog extends StatelessWidget {
  const ImageChoiceDialog({Key? key}) : super(key: key);

  static Future<ImageChoiceType> show(BuildContext context) async {
    final result = await showDialog<ImageChoiceType?>(
      context: context,
      builder: (context) => const ImageChoiceDialog(),
    );

    return result ?? ImageChoiceType.none;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 156,
        width: 300,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).pop(ImageChoiceType.values[index]),
            child: SizedBox(
              height: 52,
              child: Center(
                child: Text(
                  ImageChoiceType.values[index].title,
                  style: AppStyle.subTitle2Medium,
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            color: AppColor.grey100,
            height: 1,
            thickness: 1,
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
