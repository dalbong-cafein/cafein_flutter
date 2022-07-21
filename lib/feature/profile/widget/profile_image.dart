import 'dart:io';
import 'dart:math';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.fileImagePath,
  });

  final String fileImagePath;

  @override
  Widget build(BuildContext context) {
    if (fileImagePath.isNotEmpty) {
      return CircleAvatar(
        radius: 44,
        backgroundColor: AppColor.white,
        foregroundImage: FileImage(
          File(fileImagePath),
        ),
      );
    }
    final randomIndex = Random().nextInt(2);
    return CircleAvatar(
      radius: 44,
      backgroundColor: AppColor.white,
      child: loadAsset(
        CafeinConst.defaultProfiles[randomIndex],
        width: 88,
        height: 88,
      ),
    );
  }
}
