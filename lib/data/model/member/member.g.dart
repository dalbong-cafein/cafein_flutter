// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      memberId: json['memberId'] as int,
      nickname: json['nickname'] as String?,
      imageIdPair: json['imageDto'] == null
          ? null
          : ImageIdPair.fromJson(json['imageDto'] as Map<String, dynamic>),
      phoneNumber: json['phone'] as String?,
      email: json['email'] as String,
      birthDay: json['birth'] as String?,
      joinDateTime: json['joinDateTime'] as String,
      isAgreeLocation: json['isAgreeLocation'] as bool?,
      isAgreeMarketingPush: json['isAgreeMarketingPush'] as bool?,
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'imageDto': instance.imageIdPair,
      'phone': instance.phoneNumber,
      'email': instance.email,
      'birth': instance.birthDay,
      'joinDateTime': instance.joinDateTime,
      'isAgreeLocation': instance.isAgreeLocation,
      'isAgreeMarketingPush': instance.isAgreeMarketingPush,
    };
