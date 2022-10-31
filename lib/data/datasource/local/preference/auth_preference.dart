import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/data/model/auth/token_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthPreference {
  final Box<TokenData> box;

  AuthPreference({
    required this.box,
  });

  TokenData? getTokenData() => box.get(
        AppDatabase.tokenDataKey,
      );

  Future<void> setTokenData(TokenData tokenData) async => await box.put(
        AppDatabase.tokenDataKey,
        tokenData,
      );

  Future<void> clearTokenData() async => await box.clear();
}
