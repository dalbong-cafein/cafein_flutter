import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.g.dart';
part 'event.freezed.dart';

@freezed
class Event with _$Event {
  factory Event({
    required int eventId,
    required int boardId,
    @JsonKey(name: 'eventImageDto') required ImageIdPair imageIdPair,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
