import 'dart:math';

import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreViewMenuCard extends StatelessWidget {
  const MoreViewMenuCard({
    Key? key,
    required this.title,
    required this.onTab,
    this.authProvider = false,
  }) : super(key: key);

  final String title;
  final void Function() onTab;
  final bool authProvider;

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
                child: Text(
                  '${context.watch<UserRepository>().getAuthProvider}',
                  style: AppStyle.body14Regular.copyWith(
                    color: AppColor.grey400,
                  ),
                ),
              ),
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
