import 'dart:io';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class EditProfileImageCard extends StatelessWidget {
  const EditProfileImageCard({
    Key? key,
    this.imageUrl,
    this.filePath,
  }) : super(key: key);

  final String? imageUrl;
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    if (filePath == null) {
      if (imageUrl == null) {
        return CircleAvatar(
          radius: 44,
          backgroundColor: AppColor.white,
          child: loadAsset(
            CafeinConst.defaultProfile,
            width: 88,
            height: 88,
          ),
        );
      }

      return CircleAvatar(
        radius: 44,
        backgroundColor: AppColor.white,
        backgroundImage: NetworkImage(
          imageUrl!,
        ),
      );
    }

    if (filePath == CafeinConst.defaultProfileFlag) {
      return CircleAvatar(
        radius: 44,
        backgroundColor: AppColor.white,
        child: loadAsset(
          CafeinConst.defaultProfile,
          width: 88,
          height: 88,
        ),
      );
    }

    return CircleAvatar(
      radius: 44,
      backgroundColor: AppColor.white,
      backgroundImage: FileImage(
        File(filePath!),
      ),
    );
  }
}
