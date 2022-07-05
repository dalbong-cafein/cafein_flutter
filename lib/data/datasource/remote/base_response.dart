import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final String message;
  final T data;
  final int code;

  BaseResponse({
    required this.message,
    required this.data,
    required this.code,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$BaseResponseToJson(this, toJsonT);
}
