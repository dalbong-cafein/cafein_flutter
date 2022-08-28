import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CircleProfileImage extends StatelessWidget {
  const CircleProfileImage({
    Key? key,
    required this.imageUrl,
    required this.radius,
  }) : super(key: key);

  final String? imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      CircleAvatar(
        radius: radius,
        backgroundColor: AppColor.white,
        backgroundImage: AssetImage(
          CafeinConst.defaultProfile,
        ),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColor.white,
      backgroundImage: NetworkImage(
        imageUrl!,
      ),
    );
  }
}
