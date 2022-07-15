// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Board _$$_BoardFromJson(Map<String, dynamic> json) => _$_Board(
      boardId: json['boardId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageIdPairs: (json['boardImageDtoList'] as List<dynamic>?)
          ?.map((e) => ImageIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      registeredDateTime: json['regDateTime'] as String,
    );

Map<String, dynamic> _$$_BoardToJson(_$_Board instance) => <String, dynamic>{
      'boardId': instance.boardId,
      'title': instance.title,
      'content': instance.content,
      'boardImageDtoList': instance.imageIdPairs,
      'regDateTime': instance.registeredDateTime,
    };
