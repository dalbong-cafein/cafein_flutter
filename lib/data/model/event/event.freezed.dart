// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int get eventId => throw _privateConstructorUsedError;
  int get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {int eventId,
      int boardId,
      @JsonKey(name: 'eventImageDto') ImageIdPair imageIdPair});

  $ImageIdPairCopyWith<$Res> get imageIdPair;
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? boardId = freezed,
    Object? imageIdPair = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
    ));
  }

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair {
    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair, (value) {
      return _then(_value.copyWith(imageIdPair: value));
    });
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {int eventId,
      int boardId,
      @JsonKey(name: 'eventImageDto') ImageIdPair imageIdPair});

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, (v) => _then(v as _$_Event));

  @override
  _$_Event get _value => super._value as _$_Event;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? boardId = freezed,
    Object? imageIdPair = freezed,
  }) {
    return _then(_$_Event(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {required this.eventId,
      required this.boardId,
      @JsonKey(name: 'eventImageDto') required this.imageIdPair});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final int eventId;
  @override
  final int boardId;
  @override
  @JsonKey(name: 'eventImageDto')
  final ImageIdPair imageIdPair;

  @override
  String toString() {
    return 'Event(eventId: $eventId, boardId: $boardId, imageIdPair: $imageIdPair)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            const DeepCollectionEquality().equals(other.eventId, eventId) &&
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality()
                .equals(other.imageIdPair, imageIdPair));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eventId),
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(imageIdPair));

  @JsonKey(ignore: true)
  @override
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {required final int eventId,
      required final int boardId,
      @JsonKey(name: 'eventImageDto')
          required final ImageIdPair imageIdPair}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  int get eventId;
  @override
  int get boardId;
  @override
  @JsonKey(name: 'eventImageDto')
  ImageIdPair get imageIdPair;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
