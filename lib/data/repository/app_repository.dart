import 'package:cafein_flutter/data/datasource/local/preference/app_preference.dart';
import 'package:cafein_flutter/data/model/common/search_data.dart';

abstract class AppRepository {
  bool isOnboardSkip();

  Future<void> setOnboardSkip();

  List<SearchData> getSearchKeyword();

  Future<void> putSearchKeyword(
    List<SearchData> searchKeywords,
  );

  String? getAuthProvider();

  Future<void> setAuthProvider(String authProvider);
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

  @override
  List<SearchData> getSearchKeyword() => appPreference.getSearchKeyword();

  @override
  Future<void> putSearchKeyword(List<SearchData> searchKeywords) =>
      appPreference.putSearchKeyword(
        searchKeywords,
      );

  @override
  String? getAuthProvider() => appPreference.getAuthProvider();

  @override
  Future<void> setAuthProvider(String authProvider) =>
      appPreference.setAuthProvider(authProvider);
}
