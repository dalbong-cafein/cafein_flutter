import 'package:freezed_annotation/freezed_annotation.dart';

enum AuthProvider {
  @JsonValue('APPLE')
  apple('애플'),
  @JsonValue('KAKAO')
  kakao('카카오');

  final String name;

  const AuthProvider(this.name);
}
