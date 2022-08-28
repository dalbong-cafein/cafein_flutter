import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class CustomCircleLoadingIndicator extends StatelessWidget {
  const CustomCircleLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loadAsset(
        AppLottie.circleLoading,
        width: 100,
        height: 100,
      ),
    );
  }
}
