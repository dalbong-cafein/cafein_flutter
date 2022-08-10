import 'dart:ui';

import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

abstract class CafeinConfig {
  static const baseUrl = 'https://api.cafeinofficial.com';

  static const kakaoRestApiKey = '8898a6b3df99b2f5e57b1c3ac85e6777';

  static late OverlayImage confuseBadIcon;
  static late OverlayImage confuseNormalIcon;
  static late OverlayImage confuseGoodIcon;
  static late OverlayImage confuseHeartIcon;

  static Future<void> initializeApp() async {
    KakaoSdk.init(
      nativeAppKey: 'a3f337698f260e21e527e06bf3e5d9a4',
      javaScriptAppKey: '8f4ae1ec78d727384ba00d429fc8a59e',
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await AppDatabase().initDatabase();
    confuseBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.storeBad,
      devicePixelRatio: window.devicePixelRatio,
    );
    confuseNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.storeNormal,
      devicePixelRatio: window.devicePixelRatio,
    );
    confuseGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.storeGood,
      devicePixelRatio: window.devicePixelRatio,
    );
    confuseHeartIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.storeGood,
      devicePixelRatio: window.devicePixelRatio,
    );
  }
}
