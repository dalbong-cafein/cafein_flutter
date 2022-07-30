import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class DotsLoadingIndicator extends StatelessWidget {
  const DotsLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadAsset(
      AppLottie.dotsLoading,
      width: 36,
    );
  }
}
