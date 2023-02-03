import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CircleStepIndicator extends StatelessWidget {
  const CircleStepIndicator({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 0 ? AppColor.orange400 : AppColor.grey300,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 1 ? AppColor.orange400 : AppColor.grey300,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 2 ? AppColor.orange400 : AppColor.grey300,
          ),
        ),
      ],
    );
  }
}
