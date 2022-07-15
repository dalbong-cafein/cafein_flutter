// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return _Notice.fromJson(json);
}

/// @nodoc
mixin _$Notice {
  int get noticeId => throw _privateConstructorUsedError;
  String get noticeType => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  int? get stickerId => throw _privateConstructorUsedError;
  int? get couponId => throw _privateConstructorUsedError;
  int? get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeCopyWith<Notice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeCopyWith<$Res> {
  factory $NoticeCopyWith(Notice value, $Res Function(Notice) then) =
      _$NoticeCopyWithImpl<$Res>;
  $Res call(
      {int noticeId,
      String noticeType,
      String content,
      bool isRead,
      int? stickerId,
      int? couponId,
      int? boardId,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class _$NoticeCopyWithImpl<$Res> implements $NoticeCopyWith<$Res> {
  _$NoticeCopyWithImpl(this._value, this._then);

  final Notice _value;
  // ignore: unused_field
  final $Res Function(Notice) _then;

  @override
  $Res call({
    Object? noticeId = freezed,
    Object? noticeType = freezed,
    Object? content = freezed,
    Object? isRead = freezed,
    Object? stickerId = freezed,
    Object? couponId = freezed,
    Object? boardId = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      noticeId: noticeId == freezed
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      noticeType: noticeType == freezed
          ? _value.noticeType
          : noticeType // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      stickerId: stickerId == freezed
          ? _value.stickerId
          : stickerId // ignore: cast_nullable_to_non_nullable
              as int?,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int?,
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int?,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NoticeCopyWith<$Res> implements $NoticeCopyWith<$Res> {
  factory _$$_NoticeCopyWith(_$_Notice value, $Res Function(_$_Notice) then) =
      __$$_NoticeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int noticeId,
      String noticeType,
      String content,
      bool isRead,
      int? stickerId,
      int? couponId,
      int? boardId,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class __$$_NoticeCopyWithImpl<$Res> extends _$NoticeCopyWithImpl<$Res>
    implements _$$_NoticeCopyWith<$Res> {
  __$$_NoticeCopyWithImpl(_$_Notice _value, $Res Function(_$_Notice) _then)
      : super(_value, (v) => _then(v as _$_Notice));

  @override
  _$_Notice get _value => super._value as _$_Notice;

  @override
  $Res call({
    Object? noticeId = freezed,
    Object? noticeType = freezed,
    Object? content = freezed,
    Object? isRead = freezed,
    Object? stickerId = freezed,
    Object? couponId = freezed,
    Object? boardId = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_Notice(
      noticeId: noticeId == freezed
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      noticeType: noticeType == freezed
          ? _value.noticeType
          : noticeType // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      stickerId: stickerId == freezed
          ? _value.stickerId
          : stickerId // ignore: cast_nullable_to_non_nullable
              as int?,
      couponId: couponId == freezed
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as int?,
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int?,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notice implements _Notice {
  _$_Notice(
      {required this.noticeId,
      required this.noticeType,
      required this.content,
      required this.isRead,
      this.stickerId,
      this.couponId,
      this.boardId,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime});

  factory _$_Notice.fromJson(Map<String, dynamic> json) =>
      _$$_NoticeFromJson(json);

  @override
  final int noticeId;
  @override
  final String noticeType;
  @override
  final String content;
  @override
  final bool isRead;
  @override
  final int? stickerId;
  @override
  final int? couponId;
  @override
  final int? boardId;
  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'Notice(noticeId: $noticeId, noticeType: $noticeType, content: $content, isRead: $isRead, stickerId: $stickerId, couponId: $couponId, boardId: $boardId, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notice &&
            const DeepCollectionEquality().equals(other.noticeId, noticeId) &&
            const DeepCollectionEquality()
                .equals(other.noticeType, noticeType) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.stickerId, stickerId) &&
            const DeepCollectionEquality().equals(other.couponId, couponId) &&
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality()
                .equals(other.registeredDateTime, registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(noticeId),
      const DeepCollectionEquality().hash(noticeType),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(stickerId),
      const DeepCollectionEquality().hash(couponId),
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_NoticeCopyWith<_$_Notice> get copyWith =>
      __$$_NoticeCopyWithImpl<_$_Notice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoticeToJson(this);
  }
}

abstract class _Notice implements Notice {
  factory _Notice(
      {required final int noticeId,
      required final String noticeType,
      required final String content,
      required final bool isRead,
      final int? stickerId,
      final int? couponId,
      final int? boardId,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_Notice;

  factory _Notice.fromJson(Map<String, dynamic> json) = _$_Notice.fromJson;

  @override
  int get noticeId => throw _privateConstructorUsedError;
  @override
  String get noticeType => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  bool get isRead => throw _privateConstructorUsedError;
  @override
  int? get stickerId => throw _privateConstructorUsedError;
  @override
  int? get couponId => throw _privateConstructorUsedError;
  @override
  int? get boardId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NoticeCopyWith<_$_Notice> get copyWith =>
      throw _privateConstructorUsedError;
}
