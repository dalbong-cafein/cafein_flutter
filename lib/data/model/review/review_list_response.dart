import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ReviewListResponse<T> {
  final int reviewCnt;

  @JsonKey(
    name: 'dtoList',
    fromJson: _$ReviewListResponseFromJson,
  )
  final List<T> reviewData;

  const ReviewListResponse({
    required this.reviewCnt,
    required this.reviewData,
  });

  factory ReviewListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ReviewListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$ReviewListResponseToJson(this, toJsonT);
}
