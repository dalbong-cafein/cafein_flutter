// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_member_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateMemberRequest {
  int get memberId => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  int? get deleteImageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateMemberRequestCopyWith<UpdateMemberRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMemberRequestCopyWith<$Res> {
  factory $UpdateMemberRequestCopyWith(
          UpdateMemberRequest value, $Res Function(UpdateMemberRequest) then) =
      _$UpdateMemberRequestCopyWithImpl<$Res, UpdateMemberRequest>;
  @useResult
  $Res call(
      {int memberId, String nickName, String? imageFile, int? deleteImageId});
}

/// @nodoc
class _$UpdateMemberRequestCopyWithImpl<$Res, $Val extends UpdateMemberRequest>
    implements $UpdateMemberRequestCopyWith<$Res> {
  _$UpdateMemberRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? nickName = null,
    Object? imageFile = freezed,
    Object? deleteImageId = freezed,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteImageId: freezed == deleteImageId
          ? _value.deleteImageId
          : deleteImageId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateMemberRequestCopyWith<$Res>
    implements $UpdateMemberRequestCopyWith<$Res> {
  factory _$$_UpdateMemberRequestCopyWith(_$_UpdateMemberRequest value,
          $Res Function(_$_UpdateMemberRequest) then) =
      __$$_UpdateMemberRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int memberId, String nickName, String? imageFile, int? deleteImageId});
}

/// @nodoc
class __$$_UpdateMemberRequestCopyWithImpl<$Res>
    extends _$UpdateMemberRequestCopyWithImpl<$Res, _$_UpdateMemberRequest>
    implements _$$_UpdateMemberRequestCopyWith<$Res> {
  __$$_UpdateMemberRequestCopyWithImpl(_$_UpdateMemberRequest _value,
      $Res Function(_$_UpdateMemberRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? nickName = null,
    Object? imageFile = freezed,
    Object? deleteImageId = freezed,
  }) {
    return _then(_$_UpdateMemberRequest(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteImageId: freezed == deleteImageId
          ? _value.deleteImageId
          : deleteImageId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_UpdateMemberRequest implements _UpdateMemberRequest {
  _$_UpdateMemberRequest(
      {required this.memberId,
      required this.nickName,
      this.imageFile,
      this.deleteImageId});

  @override
  final int memberId;
  @override
  final String nickName;
  @override
  final String? imageFile;
  @override
  final int? deleteImageId;

  @override
  String toString() {
    return 'UpdateMemberRequest(memberId: $memberId, nickName: $nickName, imageFile: $imageFile, deleteImageId: $deleteImageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMemberRequest &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.deleteImageId, deleteImageId) ||
                other.deleteImageId == deleteImageId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, memberId, nickName, imageFile, deleteImageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateMemberRequestCopyWith<_$_UpdateMemberRequest> get copyWith =>
      __$$_UpdateMemberRequestCopyWithImpl<_$_UpdateMemberRequest>(
          this, _$identity);
}

abstract class _UpdateMemberRequest implements UpdateMemberRequest {
  factory _UpdateMemberRequest(
      {required final int memberId,
      required final String nickName,
      final String? imageFile,
      final int? deleteImageId}) = _$_UpdateMemberRequest;

  @override
  int get memberId;
  @override
  String get nickName;
  @override
  String? get imageFile;
  @override
  int? get deleteImageId;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateMemberRequestCopyWith<_$_UpdateMemberRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
