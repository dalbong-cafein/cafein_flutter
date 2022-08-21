import 'dart:io';

import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imagePath,
    required this.filePath,
    required this.radius,
  });

  final String imagePath;
  final String? filePath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (filePath != null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: AppColor.white,
        foregroundImage: FileImage(
          File(filePath!),
        ),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColor.white,
      child: loadAsset(
        imagePath,
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }
}
