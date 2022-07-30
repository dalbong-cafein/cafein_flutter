import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class CircleLoadingIndicator extends StatelessWidget {
  const CircleLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loadAsset(AppLottie.circleLoading),
    );
  }
}
