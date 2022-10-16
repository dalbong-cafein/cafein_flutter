import 'package:cafein_flutter/data/model/common/search_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppPreference {
  final Box<dynamic> box;

  static const searchKeywordKey = 'searchKeyword';
  static const onboardKey = 'onboardKey';

  AppPreference({
    required this.box,
  });

  List<SearchData> getSearchKeyword() => List.from(box.get(searchKeywordKey));

  Future<void> putSearchKeyword(
    List<String> searchKeywords,
  ) =>
      box.put(
        searchKeywordKey,
        searchKeywords
            .map(
              (e) => SearchData(
                keyword: e,
                dateTime: DateTime.now().toString(),
              ),
            )
            .toList(),
      );

  bool isOnboardSkip() => box.get(onboardKey) ?? false;

  Future<void> setOnboardSkip() => box.put(onboardKey, true);
}
