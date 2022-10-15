// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  int get memberId => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageDto')
  ImageIdPair? get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth')
  String? get birthDay => throw _privateConstructorUsedError;
  String get joinDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {int memberId,
      String? nickname,
      @JsonKey(name: 'imageDto') ImageIdPair? imageIdPair,
      @JsonKey(name: 'phone') String? phoneNumber,
      String email,
      @JsonKey(name: 'birth') String? birthDay,
      String joinDateTime});

  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? nickname = freezed,
    Object? imageIdPair = freezed,
    Object? phoneNumber = freezed,
    Object? email = null,
    Object? birthDay = freezed,
    Object? joinDateTime = null,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDateTime: null == joinDateTime
          ? _value.joinDateTime
          : joinDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageIdPairCopyWith<$Res>? get imageIdPair {
    if (_value.imageIdPair == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair!, (value) {
      return _then(_value.copyWith(imageIdPair: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$_MemberCopyWith(_$_Member value, $Res Function(_$_Member) then) =
      __$$_MemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int memberId,
      String? nickname,
      @JsonKey(name: 'imageDto') ImageIdPair? imageIdPair,
      @JsonKey(name: 'phone') String? phoneNumber,
      String email,
      @JsonKey(name: 'birth') String? birthDay,
      String joinDateTime});

  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class __$$_MemberCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$_Member>
    implements _$$_MemberCopyWith<$Res> {
  __$$_MemberCopyWithImpl(_$_Member _value, $Res Function(_$_Member) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? nickname = freezed,
    Object? imageIdPair = freezed,
    Object? phoneNumber = freezed,
    Object? email = null,
    Object? birthDay = freezed,
    Object? joinDateTime = null,
  }) {
    return _then(_$_Member(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      imageIdPair: freezed == imageIdPair
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDateTime: null == joinDateTime
          ? _value.joinDateTime
          : joinDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Member implements _Member {
  _$_Member(
      {required this.memberId,
      this.nickname,
      @JsonKey(name: 'imageDto') this.imageIdPair,
      @JsonKey(name: 'phone') this.phoneNumber,
      required this.email,
      @JsonKey(name: 'birth') this.birthDay,
      required this.joinDateTime});

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$$_MemberFromJson(json);

  @override
  final int memberId;
  @override
  final String? nickname;
  @override
  @JsonKey(name: 'imageDto')
  final ImageIdPair? imageIdPair;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  final String email;
  @override
  @JsonKey(name: 'birth')
  final String? birthDay;
  @override
  final String joinDateTime;

  @override
  String toString() {
    return 'Member(memberId: $memberId, nickname: $nickname, imageIdPair: $imageIdPair, phoneNumber: $phoneNumber, email: $email, birthDay: $birthDay, joinDateTime: $joinDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Member &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.imageIdPair, imageIdPair) ||
                other.imageIdPair == imageIdPair) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.joinDateTime, joinDateTime) ||
                other.joinDateTime == joinDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memberId, nickname, imageIdPair,
      phoneNumber, email, birthDay, joinDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      __$$_MemberCopyWithImpl<_$_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(
      this,
    );
  }
}

abstract class _Member implements Member {
  factory _Member(
      {required final int memberId,
      final String? nickname,
      @JsonKey(name: 'imageDto') final ImageIdPair? imageIdPair,
      @JsonKey(name: 'phone') final String? phoneNumber,
      required final String email,
      @JsonKey(name: 'birth') final String? birthDay,
      required final String joinDateTime}) = _$_Member;

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  int get memberId;
  @override
  String? get nickname;
  @override
  @JsonKey(name: 'imageDto')
  ImageIdPair? get imageIdPair;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber;
  @override
  String get email;
  @override
  @JsonKey(name: 'birth')
  String? get birthDay;
  @override
  String get joinDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      throw _privateConstructorUsedError;
}
