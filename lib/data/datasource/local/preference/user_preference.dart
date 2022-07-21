import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserPreference {
  final Box<List<String>> box;

  UserPreference({
    required this.box,
  });

  List<String>? getSearchKeyword() => box.get(
        AppDatabase.searchKeywordKey,
      );

  Future<void> putSearchKeyword(List<String> searchKeywords) => box.put(
        AppDatabase.searchKeywordKey,
        searchKeywords,
      );
}
