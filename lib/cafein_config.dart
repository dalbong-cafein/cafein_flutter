import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:flutter/services.dart';

abstract class CafeinConfig {
  static const baseUrl = 'https://api.cafeinofficial.com';

  static Future<void> initializeApp() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await AppDatabase().initDatabase();
  }
}
