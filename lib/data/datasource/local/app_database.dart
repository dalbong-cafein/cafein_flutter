import 'package:cafein_flutter/data/datasource/local/preference/app_preference.dart';
import 'package:cafein_flutter/data/datasource/local/preference/auth_preference.dart';
import 'package:cafein_flutter/data/model/auth/token_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._();

  factory AppDatabase() => _instance;

  AppDatabase._();

  late final AuthPreference _authPreference;
  late final AppPreference _appPreference;

  static const authBoxKey = 'auth';
  static const tokenDataKey = 'tokenData';

  static const appBoxKey = 'app';
  static const searchKeywordKey = 'searchKeyword';

  Future<void> initDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TokenDataAdapter());
    await Hive.openBox<TokenData>(authBoxKey).then(
      (value) => _authPreference = AuthPreference(box: value),
    );
    await Hive.openBox<List<String>>(appBoxKey).then(
      (value) => _appPreference = AppPreference(box: value),
    );
  }

  AuthPreference get authPreference => _authPreference;
  AppPreference get appPreference => _appPreference;
}
