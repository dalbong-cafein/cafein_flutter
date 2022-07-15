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
  String? get nickName => throw _privateConstructorUsedError;
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
      _$MemberCopyWithImpl<$Res>;
  $Res call(
      {int memberId,
      String? nickName,
      @JsonKey(name: 'imageDto') ImageIdPair? imageIdPair,
      @JsonKey(name: 'phone') String? phoneNumber,
      String email,
      @JsonKey(name: 'birth') String? birthDay,
      String joinDateTime});

  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  final Member _value;
  // ignore: unused_field
  final $Res Function(Member) _then;

  @override
  $Res call({
    Object? memberId = freezed,
    Object? nickName = freezed,
    Object? imageIdPair = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? birthDay = freezed,
    Object? joinDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      memberId: memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDateTime: joinDateTime == freezed
          ? _value.joinDateTime
          : joinDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair {
    if (_value.imageIdPair == null) {
      return null;
    }

    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair!, (value) {
      return _then(_value.copyWith(imageIdPair: value));
    });
  }
}

/// @nodoc
abstract class _$$_MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$_MemberCopyWith(_$_Member value, $Res Function(_$_Member) then) =
      __$$_MemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {int memberId,
      String? nickName,
      @JsonKey(name: 'imageDto') ImageIdPair? imageIdPair,
      @JsonKey(name: 'phone') String? phoneNumber,
      String email,
      @JsonKey(name: 'birth') String? birthDay,
      String joinDateTime});

  @override
  $ImageIdPairCopyWith<$Res>? get imageIdPair;
}

/// @nodoc
class __$$_MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res>
    implements _$$_MemberCopyWith<$Res> {
  __$$_MemberCopyWithImpl(_$_Member _value, $Res Function(_$_Member) _then)
      : super(_value, (v) => _then(v as _$_Member));

  @override
  _$_Member get _value => super._value as _$_Member;

  @override
  $Res call({
    Object? memberId = freezed,
    Object? nickName = freezed,
    Object? imageIdPair = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? birthDay = freezed,
    Object? joinDateTime = freezed,
  }) {
    return _then(_$_Member(
      memberId: memberId == freezed
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDateTime: joinDateTime == freezed
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
      this.nickName,
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
  final String? nickName;
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
    return 'Member(memberId: $memberId, nickName: $nickName, imageIdPair: $imageIdPair, phoneNumber: $phoneNumber, email: $email, birthDay: $birthDay, joinDateTime: $joinDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Member &&
            const DeepCollectionEquality().equals(other.memberId, memberId) &&
            const DeepCollectionEquality().equals(other.nickName, nickName) &&
            const DeepCollectionEquality()
                .equals(other.imageIdPair, imageIdPair) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.birthDay, birthDay) &&
            const DeepCollectionEquality()
                .equals(other.joinDateTime, joinDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memberId),
      const DeepCollectionEquality().hash(nickName),
      const DeepCollectionEquality().hash(imageIdPair),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(birthDay),
      const DeepCollectionEquality().hash(joinDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      __$$_MemberCopyWithImpl<_$_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(this);
  }
}

abstract class _Member implements Member {
  factory _Member(
      {required final int memberId,
      final String? nickName,
      @JsonKey(name: 'imageDto') final ImageIdPair? imageIdPair,
      @JsonKey(name: 'phone') final String? phoneNumber,
      required final String email,
      @JsonKey(name: 'birth') final String? birthDay,
      required final String joinDateTime}) = _$_Member;

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  int get memberId => throw _privateConstructorUsedError;
  @override
  String? get nickName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'imageDto')
  ImageIdPair? get imageIdPair => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'birth')
  String? get birthDay => throw _privateConstructorUsedError;
  @override
  String get joinDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      throw _privateConstructorUsedError;
}
