import 'package:json_annotation/json_annotation.dart';

part 'store_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class StoreResponse<T> {
  final int storeCnt;

  @JsonKey(name: 'resDtoList')
  final T storeData;

  const StoreResponse({
    required this.storeCnt,
    required this.storeData,
  });

  factory StoreResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$StoreResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$StoreResponseToJson(this, toJsonT);
}
