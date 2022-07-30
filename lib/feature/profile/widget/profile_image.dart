import 'dart:io';
import 'dart:math';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imagePath,
    required this.filePath,
  });

  final String imagePath;
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    if (filePath != null) {
      return CircleAvatar(
        radius: 44,
        backgroundColor: AppColor.white,
        foregroundImage: FileImage(
          File(filePath!),
        ),
      );
    }

    return CircleAvatar(
      radius: 44,
      backgroundColor: AppColor.white,
      child: loadAsset(
        imagePath,
        width: 88,
        height: 88,
      ),
    );
  }
}
