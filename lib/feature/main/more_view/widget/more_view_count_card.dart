import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class MoreViewCountCard extends StatelessWidget {
  const MoreViewCountCard({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: (MediaQuery.of(context).size.width - 56) / 2,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColor.grey50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyle.caption13Medium.copyWith(
              color: AppColor.grey600,
            ),
          ),
          Text(
            '$value',
            style: AppStyle.title19SemiBold,
          ),
        ],
      ),
    );
  }
}
