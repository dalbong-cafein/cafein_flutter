import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ReviewResponse<T> {
  final int reviewCnt;

  @JsonKey(name: 'dtoList')
  final T reviewData;

  const ReviewResponse({
    required this.reviewCnt,
    required this.reviewData,
  });

  factory ReviewResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ReviewResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$ReviewResponseToJson(this, toJsonT);
}
