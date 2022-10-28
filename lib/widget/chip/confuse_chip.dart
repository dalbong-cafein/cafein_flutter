import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class ConfuseChip extends StatelessWidget {
  const ConfuseChip({
    Key? key,
    this.confuseScore,
    required this.width,
    required this.height,
    required this.textStyle,
    this.borderRadius = 4.0,
  }) : super(key: key);

  final double? confuseScore;
  final double width;
  final double height;
  final TextStyle textStyle;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    if (confuseScore == null) {
      return const SizedBox.shrink();
    }
    if (confuseScore! <= 1.5) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.green50,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Center(
          child: Text(
            "여유",
            style: textStyle.copyWith(
              color: AppColor.green500,
            ),
          ),
        ),
      );
    }
    if (confuseScore! <= 2.5) {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: AppColor.amber50,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Center(
          child: Text(
            "보통",
            style: textStyle.copyWith(
              color: AppColor.amber500,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: AppColor.scarlet50,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Center(
          child: Text(
            "혼잡",
            style: textStyle.copyWith(
              color: AppColor.scarlet500,
            ),
          ),
        ),
      );
    }
  }
}
