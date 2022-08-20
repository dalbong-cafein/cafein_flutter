import 'dart:math';

import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreViewMenuCard extends StatelessWidget {
  const MoreViewMenuCard({
    Key? key,
    required this.title,
    this.onTab,
    this.authProvider = false,
    this.trailingWidget,
  }) : super(key: key);

  final String title;
  final void Function()? onTab;
  final bool authProvider;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width - 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyle.subTitle15Medium,
            ),
            const Spacer(),
            if (authProvider)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: loadAsset(AppIcon.kakaoCircle),
              ),
            trailingWidget ??
                Transform.rotate(
                  angle: pi,
                  child: const Icon(
                    CupertinoIcons.back,
                    color: AppColor.grey400,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
