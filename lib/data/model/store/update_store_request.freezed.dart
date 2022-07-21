// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_store_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateStoreRequest _$UpdateStoreRequestFromJson(Map<String, dynamic> json) {
  return _UpdateStoreRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateStoreRequest {
  int get storeId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get wifiPassword => throw _privateConstructorUsedError;
  String get webSite => throw _privateConstructorUsedError;
  List<String>? get updateImageFiles => throw _privateConstructorUsedError;
  List<int>? get deleteImageIds => throw _privateConstructorUsedError;
  TotalBusinessInfo get totalBusinessInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateStoreRequestCopyWith<UpdateStoreRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStoreRequestCopyWith<$Res> {
  factory $UpdateStoreRequestCopyWith(
          UpdateStoreRequest value, $Res Function(UpdateStoreRequest) then) =
      _$UpdateStoreRequestCopyWithImpl<$Res>;
  $Res call(
      {int storeId,
      String phoneNumber,
      String wifiPassword,
      String webSite,
      List<String>? updateImageFiles,
      List<int>? deleteImageIds,
      TotalBusinessInfo totalBusinessInfo});

  $TotalBusinessInfoCopyWith<$Res> get totalBusinessInfo;
}

/// @nodoc
class _$UpdateStoreRequestCopyWithImpl<$Res>
    implements $UpdateStoreRequestCopyWith<$Res> {
  _$UpdateStoreRequestCopyWithImpl(this._value, this._then);

  final UpdateStoreRequest _value;
  // ignore: unused_field
  final $Res Function(UpdateStoreRequest) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? phoneNumber = freezed,
    Object? wifiPassword = freezed,
    Object? webSite = freezed,
    Object? updateImageFiles = freezed,
    Object? deleteImageIds = freezed,
    Object? totalBusinessInfo = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      wifiPassword: wifiPassword == freezed
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
      webSite: webSite == freezed
          ? _value.webSite
          : webSite // ignore: cast_nullable_to_non_nullable
              as String,
      updateImageFiles: updateImageFiles == freezed
          ? _value.updateImageFiles
          : updateImageFiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      deleteImageIds: deleteImageIds == freezed
          ? _value.deleteImageIds
          : deleteImageIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      totalBusinessInfo: totalBusinessInfo == freezed
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo,
    ));
  }

  @override
  $TotalBusinessInfoCopyWith<$Res> get totalBusinessInfo {
    return $TotalBusinessInfoCopyWith<$Res>(_value.totalBusinessInfo, (value) {
      return _then(_value.copyWith(totalBusinessInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_UpdateStoreRequestCopyWith<$Res>
    implements $UpdateStoreRequestCopyWith<$Res> {
  factory _$$_UpdateStoreRequestCopyWith(_$_UpdateStoreRequest value,
          $Res Function(_$_UpdateStoreRequest) then) =
      __$$_UpdateStoreRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int storeId,
      String phoneNumber,
      String wifiPassword,
      String webSite,
      List<String>? updateImageFiles,
      List<int>? deleteImageIds,
      TotalBusinessInfo totalBusinessInfo});

  @override
  $TotalBusinessInfoCopyWith<$Res> get totalBusinessInfo;
}

/// @nodoc
class __$$_UpdateStoreRequestCopyWithImpl<$Res>
    extends _$UpdateStoreRequestCopyWithImpl<$Res>
    implements _$$_UpdateStoreRequestCopyWith<$Res> {
  __$$_UpdateStoreRequestCopyWithImpl(
      _$_UpdateStoreRequest _value, $Res Function(_$_UpdateStoreRequest) _then)
      : super(_value, (v) => _then(v as _$_UpdateStoreRequest));

  @override
  _$_UpdateStoreRequest get _value => super._value as _$_UpdateStoreRequest;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? phoneNumber = freezed,
    Object? wifiPassword = freezed,
    Object? webSite = freezed,
    Object? updateImageFiles = freezed,
    Object? deleteImageIds = freezed,
    Object? totalBusinessInfo = freezed,
  }) {
    return _then(_$_UpdateStoreRequest(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      wifiPassword: wifiPassword == freezed
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
      webSite: webSite == freezed
          ? _value.webSite
          : webSite // ignore: cast_nullable_to_non_nullable
              as String,
      updateImageFiles: updateImageFiles == freezed
          ? _value._updateImageFiles
          : updateImageFiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      deleteImageIds: deleteImageIds == freezed
          ? _value._deleteImageIds
          : deleteImageIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      totalBusinessInfo: totalBusinessInfo == freezed
          ? _value.totalBusinessInfo
          : totalBusinessInfo // ignore: cast_nullable_to_non_nullable
              as TotalBusinessInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateStoreRequest implements _UpdateStoreRequest {
  _$_UpdateStoreRequest(
      {required this.storeId,
      required this.phoneNumber,
      required this.wifiPassword,
      required this.webSite,
      required final List<String>? updateImageFiles,
      required final List<int>? deleteImageIds,
      required this.totalBusinessInfo})
      : _updateImageFiles = updateImageFiles,
        _deleteImageIds = deleteImageIds;

  factory _$_UpdateStoreRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateStoreRequestFromJson(json);

  @override
  final int storeId;
  @override
  final String phoneNumber;
  @override
  final String wifiPassword;
  @override
  final String webSite;
  final List<String>? _updateImageFiles;
  @override
  List<String>? get updateImageFiles {
    final value = _updateImageFiles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _deleteImageIds;
  @override
  List<int>? get deleteImageIds {
    final value = _deleteImageIds;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TotalBusinessInfo totalBusinessInfo;

  @override
  String toString() {
    return 'UpdateStoreRequest(storeId: $storeId, phoneNumber: $phoneNumber, wifiPassword: $wifiPassword, webSite: $webSite, updateImageFiles: $updateImageFiles, deleteImageIds: $deleteImageIds, totalBusinessInfo: $totalBusinessInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateStoreRequest &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.wifiPassword, wifiPassword) &&
            const DeepCollectionEquality().equals(other.webSite, webSite) &&
            const DeepCollectionEquality()
                .equals(other._updateImageFiles, _updateImageFiles) &&
            const DeepCollectionEquality()
                .equals(other._deleteImageIds, _deleteImageIds) &&
            const DeepCollectionEquality()
                .equals(other.totalBusinessInfo, totalBusinessInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(wifiPassword),
      const DeepCollectionEquality().hash(webSite),
      const DeepCollectionEquality().hash(_updateImageFiles),
      const DeepCollectionEquality().hash(_deleteImageIds),
      const DeepCollectionEquality().hash(totalBusinessInfo));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateStoreRequestCopyWith<_$_UpdateStoreRequest> get copyWith =>
      __$$_UpdateStoreRequestCopyWithImpl<_$_UpdateStoreRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateStoreRequestToJson(this);
  }
}

abstract class _UpdateStoreRequest implements UpdateStoreRequest {
  factory _UpdateStoreRequest(
          {required final int storeId,
          required final String phoneNumber,
          required final String wifiPassword,
          required final String webSite,
          required final List<String>? updateImageFiles,
          required final List<int>? deleteImageIds,
          required final TotalBusinessInfo totalBusinessInfo}) =
      _$_UpdateStoreRequest;

  factory _UpdateStoreRequest.fromJson(Map<String, dynamic> json) =
      _$_UpdateStoreRequest.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get wifiPassword => throw _privateConstructorUsedError;
  @override
  String get webSite => throw _privateConstructorUsedError;
  @override
  List<String>? get updateImageFiles => throw _privateConstructorUsedError;
  @override
  List<int>? get deleteImageIds => throw _privateConstructorUsedError;
  @override
  TotalBusinessInfo get totalBusinessInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateStoreRequestCopyWith<_$_UpdateStoreRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
