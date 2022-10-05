// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  @JsonKey(name: 'noticeId')
  int get notificationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'noticeType')
  String get notificationType => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  int? get stickerId => throw _privateConstructorUsedError;
  int? get couponId => throw _privateConstructorUsedError;
  int? get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'noticeId') int notificationId,
      @JsonKey(name: 'noticeType') String notificationType,
      String content,
      bool isRead,
      int? stickerId,
      int? couponId,
      int? boardId,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? content = freezed,
    Object? isRead = freezed,
    Object? stickerId = freezed,
    Object? couponId = freezed,
    Object? boardId = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'noticeId') int notificationId,
      @JsonKey(name: 'noticeType') String notificationType,
      String content,
      bool isRead,
      int? stickerId,
      int? couponId,
      int? boardId,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, (v) => _then(v as _$_Notification));

  @override
  _$_Notification get _value => super._value as _$_Notification;

  @override
  $Res call({
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? content = freezed,
    Object? isRead = freezed,
    Object? stickerId = freezed,
    Object? couponId = freezed,
    Object? boardId = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_Notification(
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
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
class _$_Notification implements _Notification {
  _$_Notification(
      {@JsonKey(name: 'noticeId') required this.notificationId,
      @JsonKey(name: 'noticeType') required this.notificationType,
      required this.content,
      required this.isRead,
      this.stickerId,
      this.couponId,
      this.boardId,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime});

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @override
  @JsonKey(name: 'noticeId')
  final int notificationId;
  @override
  @JsonKey(name: 'noticeType')
  final String notificationType;
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
    return 'Notification(notificationId: $notificationId, notificationType: $notificationType, content: $content, isRead: $isRead, stickerId: $stickerId, couponId: $couponId, boardId: $boardId, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            const DeepCollectionEquality()
                .equals(other.notificationId, notificationId) &&
            const DeepCollectionEquality()
                .equals(other.notificationType, notificationType) &&
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
      const DeepCollectionEquality().hash(notificationId),
      const DeepCollectionEquality().hash(notificationType),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(stickerId),
      const DeepCollectionEquality().hash(couponId),
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  factory _Notification(
      {@JsonKey(name: 'noticeId')
          required final int notificationId,
      @JsonKey(name: 'noticeType')
          required final String notificationType,
      required final String content,
      required final bool isRead,
      final int? stickerId,
      final int? couponId,
      final int? boardId,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  @JsonKey(name: 'noticeId')
  int get notificationId;
  @override
  @JsonKey(name: 'noticeType')
  String get notificationType;
  @override
  String get content;
  @override
  bool get isRead;
  @override
  int? get stickerId;
  @override
  int? get couponId;
  @override
  int? get boardId;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
