import 'package:freezed_annotation/freezed_annotation.dart';

enum AuthProvider {
  @JsonValue('APPLE')
  apple,
  @JsonValue('KAKAO')
  kakao,
}
