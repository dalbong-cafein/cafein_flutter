// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_id_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreImagePair _$$_StoreImagePairFromJson(Map<String, dynamic> json) =>
    _$_StoreImagePair(
      imageId: json['imageId'] as int,
      isGoogle: json['isGoogle'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String,
      isCafein: json['isCafein'] as bool? ?? false,
    );

Map<String, dynamic> _$$_StoreImagePairToJson(_$_StoreImagePair instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'isGoogle': instance.isGoogle,
      'imageUrl': instance.imageUrl,
      'isCafein': instance.isCafein,
    };
