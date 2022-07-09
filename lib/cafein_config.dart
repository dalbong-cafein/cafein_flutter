import 'package:flutter/services.dart';

abstract class CafeinConfig {
  static const baseUrl = 'https://api.cafeinofficial.com';

  static Future<void> initializeApp() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
