import 'dart:math';

import 'package:cafein_flutter/data/model/enum/auth_provider.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreViewMenuCard extends StatelessWidget {
  const MoreViewMenuCard({
    Key? key,
    required this.title,
    this.onTab,
    this.isAuthProvider = false,
    this.trailingWidget,
  }) : super(key: key);

  final String title;
  final void Function()? onTab;
  final bool isAuthProvider;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<UserRepository>().getAuthProvider;

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
            if (isAuthProvider)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: loadAsset(
                  authProvider == AuthProvider.kakao.name
                      ? AppIcon.kakaoCircle
                      : AppIcon.appleCircle,
                ),
              ),
            trailingWidget ??
                Transform.rotate(
                  angle: pi,
                  child: loadAsset(
                    AppIcon.leftS,
                    color: AppColor.grey400,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
