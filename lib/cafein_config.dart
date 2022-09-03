import 'dart:ui';

import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class CafeinConfig {
  static const baseUrl = 'https://api.cafeinofficial.com';

  static const kakaoRestApiKey = '8898a6b3df99b2f5e57b1c3ac85e6777';

  static late final OverlayImage markerBadIcon;
  static late final OverlayImage markerNormalIcon;
  static late final OverlayImage markerGoodIcon;
  static late final OverlayImage markerLikeBadIcon;
  static late final OverlayImage markerLikeNormalIcon;
  static late final OverlayImage markerLikeGoodIcon;
  static late final OverlayImage markerNoneIcon;
  static late final OverlayImage markerLikeNoneIcon;

  static late PackageInfo packageInfo;

  static Future<void> initializeApp() async {
    KakaoSdk.init(
      nativeAppKey: 'a3f337698f260e21e527e06bf3e5d9a4',
      javaScriptAppKey: '8f4ae1ec78d727384ba00d429fc8a59e',
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await AppDatabase().initDatabase();
    markerBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerBad,
      devicePixelRatio: window.devicePixelRatio,
    );
    markerGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerGood,
      devicePixelRatio: window.devicePixelRatio,
    );
    markerNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerNormal,
      devicePixelRatio: window.devicePixelRatio,
    );
    markerLikeBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeBad,
      devicePixelRatio: window.devicePixelRatio,
    );
    markerLikeNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeNormal,
      devicePixelRatio: window.devicePixelRatio,
    );
    markerLikeGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeGood,
      devicePixelRatio: window.devicePixelRatio,
    );
    markerNoneIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerNone,
      devicePixelRatio: window.devicePixelRatio,
    );

    markerLikeNoneIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeNone,
      devicePixelRatio: window.devicePixelRatio,
    );

    packageInfo = await PackageInfo.fromPlatform();
  }
}
