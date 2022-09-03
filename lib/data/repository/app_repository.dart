import 'package:cafein_flutter/data/datasource/local/preference/app_preference.dart';

abstract class AppRepository {
  bool isOnboardSkip();

  Future<void> setOnboardSkip();
}

class AppRepositoryImpl implements AppRepository {
  final AppPreference appPreference;

  const AppRepositoryImpl({
    required this.appPreference,
  });

  @override
  bool isOnboardSkip() => appPreference.isOnboardSkip();

  @override
  Future<void> setOnboardSkip() => appPreference.setOnboardSkip();
}
