import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class ScoreCharacterButton extends StatelessWidget {
  const ScoreCharacterButton({
    super.key,
    required this.message,
    required this.onIcon,
    required this.offIcon,
    required this.isChecked,
  });

  final String message;
  final String onIcon;
  final String offIcon;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loadAsset(
          isChecked ? onIcon : offIcon,
          height: 56,
          width: 56,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          message,
          style: AppStyle.caption13Medium.copyWith(
            color: isChecked ? AppColor.grey800 : AppColor.grey400,
          ),
        )
      ],
    );
  }
}
