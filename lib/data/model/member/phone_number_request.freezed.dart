// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_number_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneNumberRequest _$PhoneNumberRequestFromJson(Map<String, dynamic> json) {
  return _PhoneNumberRequest.fromJson(json);
}

/// @nodoc
mixin _$PhoneNumberRequest {
  @JsonKey(name: 'phone')
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneNumberRequestCopyWith<PhoneNumberRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberRequestCopyWith<$Res> {
  factory $PhoneNumberRequestCopyWith(
          PhoneNumberRequest value, $Res Function(PhoneNumberRequest) then) =
      _$PhoneNumberRequestCopyWithImpl<$Res, PhoneNumberRequest>;
  @useResult
  $Res call({@JsonKey(name: 'phone') String phoneNumber});
}

/// @nodoc
class _$PhoneNumberRequestCopyWithImpl<$Res, $Val extends PhoneNumberRequest>
    implements $PhoneNumberRequestCopyWith<$Res> {
  _$PhoneNumberRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhoneNumberRequestCopyWith<$Res>
    implements $PhoneNumberRequestCopyWith<$Res> {
  factory _$$_PhoneNumberRequestCopyWith(_$_PhoneNumberRequest value,
          $Res Function(_$_PhoneNumberRequest) then) =
      __$$_PhoneNumberRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'phone') String phoneNumber});
}

/// @nodoc
class __$$_PhoneNumberRequestCopyWithImpl<$Res>
    extends _$PhoneNumberRequestCopyWithImpl<$Res, _$_PhoneNumberRequest>
    implements _$$_PhoneNumberRequestCopyWith<$Res> {
  __$$_PhoneNumberRequestCopyWithImpl(
      _$_PhoneNumberRequest _value, $Res Function(_$_PhoneNumberRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$_PhoneNumberRequest(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneNumberRequest implements _PhoneNumberRequest {
  _$_PhoneNumberRequest({@JsonKey(name: 'phone') required this.phoneNumber});

  factory _$_PhoneNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneNumberRequestFromJson(json);

  @override
  @JsonKey(name: 'phone')
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneNumberRequest(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneNumberRequest &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneNumberRequestCopyWith<_$_PhoneNumberRequest> get copyWith =>
      __$$_PhoneNumberRequestCopyWithImpl<_$_PhoneNumberRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneNumberRequestToJson(
      this,
    );
  }
}

abstract class _PhoneNumberRequest implements PhoneNumberRequest {
  factory _PhoneNumberRequest(
          {@JsonKey(name: 'phone') required final String phoneNumber}) =
      _$_PhoneNumberRequest;

  factory _PhoneNumberRequest.fromJson(Map<String, dynamic> json) =
      _$_PhoneNumberRequest.fromJson;

  @override
  @JsonKey(name: 'phone')
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneNumberRequestCopyWith<_$_PhoneNumberRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
