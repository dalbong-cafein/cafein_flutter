import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'search_data.g.dart';
part 'search_data.freezed.dart';

@freezed
class SearchData with _$SearchData {
  @HiveType(
    typeId: 2,
    adapterName: 'SearchDataAdapter',
  )
  factory SearchData({
    @HiveField(0) required String keyword,
    @HiveField(1) required String dateTime,
  }) = _SearchData;
}
