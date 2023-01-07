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

part './app_markers.dart';

abstract class CafeinConfig {
  //TODO 배포때 test -> api로 바꾸기
  static const baseUrl = 'https://test.cafeinofficial.com';

  static const kakaoRestApiKey = '8898a6b3df99b2f5e57b1c3ac85e6777';

  static late PackageInfo packageInfo;

  static Future<void> initializeApp() async {
    await initializeDateFormatting();

    await AppMarkers.initMarkers();

    Intl.defaultLocale = 'ko_KR';

    KakaoSdk.init(
      nativeAppKey: 'a3f337698f260e21e527e06bf3e5d9a4',
      javaScriptAppKey: '8f4ae1ec78d727384ba00d429fc8a59e',
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await AppDatabase().initDatabase();

    packageInfo = await PackageInfo.fromPlatform();
  }
}
