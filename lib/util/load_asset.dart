import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

Widget loadAsset(
  String asset, {
  double? height,
  double? width,
  Color? color,
  BoxFit fit = BoxFit.cover,
}) {
  if (asset.contains('.svg')) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      color: color,
      fit: fit,
    );
  } else if (asset.contains('.png')) {
    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
    );
  } else {
    return Lottie.asset(
      asset,
      width: width,
      height: height,
      frameRate: FrameRate.max,
    );
  }
}
