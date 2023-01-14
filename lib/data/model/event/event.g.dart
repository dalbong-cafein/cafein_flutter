// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      eventId: json['eventId'] as int,
      boardId: json['boardId'] as int?,
      imageIdPair:
          ImageIdPair.fromJson(json['eventImageDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'boardId': instance.boardId,
      'eventImageDto': instance.imageIdPair,
    };
