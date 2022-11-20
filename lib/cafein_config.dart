import 'dart:io';
import 'dart:ui';

import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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

  static late final OverlayImage markerSingleNone;
  static late final OverlayImage markerSingleBad;
  static late final OverlayImage markerSingleNormal;
  static late final OverlayImage markerSingleGood;

  static late final OverlayImage orangeMarker;

  static late PackageInfo packageInfo;

  static Future<void> initializeApp() async {
    await initializeDateFormatting();
    Intl.defaultLocale = 'ko_KR';
    KakaoSdk.init(
      nativeAppKey: 'a3f337698f260e21e527e06bf3e5d9a4',
      javaScriptAppKey: '8f4ae1ec78d727384ba00d429fc8a59e',
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await AppDatabase().initDatabase();

    final devicePixelRatio = Platform.isAndroid
        ? window.devicePixelRatio * 2
        : window.devicePixelRatio;

    markerBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerBad,
      devicePixelRatio: devicePixelRatio,
    );
    markerGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerGood,
      devicePixelRatio: devicePixelRatio,
    );
    markerNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerNormal,
      devicePixelRatio: devicePixelRatio,
    );
    markerLikeBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeBad,
      devicePixelRatio: devicePixelRatio,
    );
    markerLikeNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeNormal,
      devicePixelRatio: devicePixelRatio,
    );
    markerLikeGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeGood,
      devicePixelRatio: devicePixelRatio,
    );
    markerNoneIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerNone,
      devicePixelRatio: devicePixelRatio,
    );
    markerLikeNoneIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleNone = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleBad = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleNormal = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleGood = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleGood,
      devicePixelRatio: devicePixelRatio,
    );

    orangeMarker = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerOrange,
      devicePixelRatio: devicePixelRatio,
    );

    packageInfo = await PackageInfo.fromPlatform();
  }
}
