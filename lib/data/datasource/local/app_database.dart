import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._();

  factory AppDatabase() => _instance;

  AppDatabase._();

  static Future<void> initDatabase() async {
    await Hive.initFlutter();
    Hive.openBox('auth');
  }
}
