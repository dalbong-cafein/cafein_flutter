import 'package:cafein_flutter/resource/resource.dart';
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
        Icon(
          Icons.near_me_rounded,
          color: AppColor.grey500,
          size: iconSize,
        ),
        const SizedBox(width: 2),
        Text(
          '${distance}m',
          style: textStyle,
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.thumb_up_alt_rounded,
          color: AppColor.orange400,
          size: iconSize,
        ),
        const SizedBox(width: 2),
        Text(
          '$recommendScore%',
          style: textStyle,
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.favorite_rounded,
          color: AppColor.orange400,
          size: iconSize,
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
