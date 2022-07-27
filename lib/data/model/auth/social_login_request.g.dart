// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SocialLoginRequest _$$_SocialLoginRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SocialLoginRequest(
      authProvider: $enumDecode(_$AuthProviderEnumMap, json['authProvider']),
      authToken: json['authToken'] as String,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_SocialLoginRequestToJson(
        _$_SocialLoginRequest instance) =>
    <String, dynamic>{
      'authProvider': _$AuthProviderEnumMap[instance.authProvider],
      'authToken': instance.authToken,
      'username': instance.username,
    };

const _$AuthProviderEnumMap = {
  AuthProvider.apple: 'APPLE',
  AuthProvider.kakao: 'KAKAO',
};
