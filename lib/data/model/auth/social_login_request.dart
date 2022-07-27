import 'package:cafein_flutter/data/model/enum/auth_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_request.g.dart';
part 'social_login_request.freezed.dart';

@freezed
class SocialLoginRequest with _$SocialLoginRequest {
  factory SocialLoginRequest({
    required AuthProvider authProvider,
    required String authToken,
    String? username,
  }) = _SocialLoginRequest;

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestFromJson(json);
}
