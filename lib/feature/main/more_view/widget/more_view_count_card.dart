import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class MoreViewCountCard extends StatelessWidget {
  const MoreViewCountCard({
    Key? key,
    required this.value,
    required this.title,
    this.isExpanded = false,
  }) : super(key: key);

  final String title;
  final int value;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: isExpanded
          ? double.infinity
          : (MediaQuery.of(context).size.width - 56) / 2,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColor.grey50,
      ),
      child: Row(
        children: [
          loadAsset(
            AppIcon.textBlank,
            fit: BoxFit.scaleDown,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: AppStyle.caption13Medium.copyWith(
              color: AppColor.grey600,
            ),
          ),
          const Spacer(),
          Text(
            '$value',
            style: AppStyle.title19SemiBold,
          ),
        ],
      ),
    );
  }
}
