import 'package:hive_flutter/hive_flutter.dart';

class AppPreference {
  final Box<dynamic> box;

  static const searchKeywordKey = 'searchKeyword';
  static const onboardKey = 'onboardKey';

  AppPreference({
    required this.box,
  });

  List<String>? getSearchKeyword() => box.get(searchKeywordKey) ?? [];

  Future<void> putSearchKeyword(List<String> searchKeywords) => box.put(
        searchKeywordKey,
        searchKeywords,
      );

  bool isOnboardSkip() => box.get(onboardKey) ?? false;

  Future<void> setOnboardSkip() => box.put(onboardKey, true);
}
