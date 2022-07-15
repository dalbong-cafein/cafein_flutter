// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sticker _$$_StickerFromJson(Map<String, dynamic> json) => _$_Sticker(
      stickerType: json['stickerType'] as String,
      storeName: json['storeName'] as String,
      registeredDateTime: json['regDateTime'] as String,
      expiredDateTime: json['expDateTime'] as String,
    );

Map<String, dynamic> _$$_StickerToJson(_$_Sticker instance) =>
    <String, dynamic>{
      'stickerType': instance.stickerType,
      'storeName': instance.storeName,
      'regDateTime': instance.registeredDateTime,
      'expDateTime': instance.expiredDateTime,
    };
