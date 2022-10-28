import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class StoreAdditionalInformationRow extends StatelessWidget {
  const StoreAdditionalInformationRow({
    Key? key,
    required this.textStyle,
    required this.distance,
    required this.recommendScore,
    required this.likeCount,
    required this.iconSize,
  }) : super(key: key);

  final TextStyle textStyle;
  final int distance;
  final int recommendScore;
  final int likeCount;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        loadAsset(
          AppIcon.nearMeS,
          color: AppColor.grey500,
          width: iconSize,
          height: iconSize,
        ),
        const SizedBox(width: 2),
        Text(
          '${distance}m',
          style: textStyle,
        ),
        const SizedBox(width: 4),
        loadAsset(
          AppIcon.like,
          color: AppColor.orange400,
          width: iconSize,
          height: iconSize,
        ),
        const SizedBox(width: 2),
        Text(
          '$recommendScore%',
          style: textStyle,
        ),
        const SizedBox(width: 4),
        loadAsset(
          AppIcon.heartS,
          color: AppColor.orange400,
          width: iconSize,
          height: iconSize,
        ),
        const SizedBox(width: 2),
        Text(
          '$likeCount',
          style: textStyle,
        ),
      ],
    );
  }
}
