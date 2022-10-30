import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';

class HomeEventBanner extends StatelessWidget {
  const HomeEventBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadAsset(AppImage.eventBanner);
  }
}
