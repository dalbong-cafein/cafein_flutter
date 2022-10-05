// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_review_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateReivewRequest {
  int get storeId => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get socket => throw _privateConstructorUsedError;
  String get wifi => throw _privateConstructorUsedError;
  String get restroom => throw _privateConstructorUsedError;
  String get tableSize => throw _privateConstructorUsedError;
  List<String>? get imageFiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateReivewRequestCopyWith<CreateReivewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReivewRequestCopyWith<$Res> {
  factory $CreateReivewRequestCopyWith(
          CreateReivewRequest value, $Res Function(CreateReivewRequest) then) =
      _$CreateReivewRequestCopyWithImpl<$Res>;
  $Res call(
      {int storeId,
      String recommendation,
      String content,
      String socket,
      String wifi,
      String restroom,
      String tableSize,
      List<String>? imageFiles});
}

/// @nodoc
class _$CreateReivewRequestCopyWithImpl<$Res>
    implements $CreateReivewRequestCopyWith<$Res> {
  _$CreateReivewRequestCopyWithImpl(this._value, this._then);

  final CreateReivewRequest _value;
  // ignore: unused_field
  final $Res Function(CreateReivewRequest) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? recommendation = freezed,
    Object? content = freezed,
    Object? socket = freezed,
    Object? wifi = freezed,
    Object? restroom = freezed,
    Object? tableSize = freezed,
    Object? imageFiles = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      socket: socket == freezed
          ? _value.socket
          : socket // ignore: cast_nullable_to_non_nullable
              as String,
      wifi: wifi == freezed
          ? _value.wifi
          : wifi // ignore: cast_nullable_to_non_nullable
              as String,
      restroom: restroom == freezed
          ? _value.restroom
          : restroom // ignore: cast_nullable_to_non_nullable
              as String,
      tableSize: tableSize == freezed
          ? _value.tableSize
          : tableSize // ignore: cast_nullable_to_non_nullable
              as String,
      imageFiles: imageFiles == freezed
          ? _value.imageFiles
          : imageFiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateReivewRequestCopyWith<$Res>
    implements $CreateReivewRequestCopyWith<$Res> {
  factory _$$_CreateReivewRequestCopyWith(_$_CreateReivewRequest value,
          $Res Function(_$_CreateReivewRequest) then) =
      __$$_CreateReivewRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int storeId,
      String recommendation,
      String content,
      String socket,
      String wifi,
      String restroom,
      String tableSize,
      List<String>? imageFiles});
}

/// @nodoc
class __$$_CreateReivewRequestCopyWithImpl<$Res>
    extends _$CreateReivewRequestCopyWithImpl<$Res>
    implements _$$_CreateReivewRequestCopyWith<$Res> {
  __$$_CreateReivewRequestCopyWithImpl(_$_CreateReivewRequest _value,
      $Res Function(_$_CreateReivewRequest) _then)
      : super(_value, (v) => _then(v as _$_CreateReivewRequest));

  @override
  _$_CreateReivewRequest get _value => super._value as _$_CreateReivewRequest;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? recommendation = freezed,
    Object? content = freezed,
    Object? socket = freezed,
    Object? wifi = freezed,
    Object? restroom = freezed,
    Object? tableSize = freezed,
    Object? imageFiles = freezed,
  }) {
    return _then(_$_CreateReivewRequest(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      socket: socket == freezed
          ? _value.socket
          : socket // ignore: cast_nullable_to_non_nullable
              as String,
      wifi: wifi == freezed
          ? _value.wifi
          : wifi // ignore: cast_nullable_to_non_nullable
              as String,
      restroom: restroom == freezed
          ? _value.restroom
          : restroom // ignore: cast_nullable_to_non_nullable
              as String,
      tableSize: tableSize == freezed
          ? _value.tableSize
          : tableSize // ignore: cast_nullable_to_non_nullable
              as String,
      imageFiles: imageFiles == freezed
          ? _value._imageFiles
          : imageFiles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_CreateReivewRequest implements _CreateReivewRequest {
  _$_CreateReivewRequest(
      {required this.storeId,
      required this.recommendation,
      required this.content,
      required this.socket,
      required this.wifi,
      required this.restroom,
      required this.tableSize,
      final List<String>? imageFiles})
      : _imageFiles = imageFiles;

  @override
  final int storeId;
  @override
  final String recommendation;
  @override
  final String content;
  @override
  final String socket;
  @override
  final String wifi;
  @override
  final String restroom;
  @override
  final String tableSize;
  final List<String>? _imageFiles;
  @override
  List<String>? get imageFiles {
    final value = _imageFiles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateReivewRequest(storeId: $storeId, recommendation: $recommendation, content: $content, socket: $socket, wifi: $wifi, restroom: $restroom, tableSize: $tableSize, imageFiles: $imageFiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateReivewRequest &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality()
                .equals(other.recommendation, recommendation) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.socket, socket) &&
            const DeepCollectionEquality().equals(other.wifi, wifi) &&
            const DeepCollectionEquality().equals(other.restroom, restroom) &&
            const DeepCollectionEquality().equals(other.tableSize, tableSize) &&
            const DeepCollectionEquality()
                .equals(other._imageFiles, _imageFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(recommendation),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(socket),
      const DeepCollectionEquality().hash(wifi),
      const DeepCollectionEquality().hash(restroom),
      const DeepCollectionEquality().hash(tableSize),
      const DeepCollectionEquality().hash(_imageFiles));

  @JsonKey(ignore: true)
  @override
  _$$_CreateReivewRequestCopyWith<_$_CreateReivewRequest> get copyWith =>
      __$$_CreateReivewRequestCopyWithImpl<_$_CreateReivewRequest>(
          this, _$identity);
}

abstract class _CreateReivewRequest implements CreateReivewRequest {
  factory _CreateReivewRequest(
      {required final int storeId,
      required final String recommendation,
      required final String content,
      required final String socket,
      required final String wifi,
      required final String restroom,
      required final String tableSize,
      final List<String>? imageFiles}) = _$_CreateReivewRequest;

  @override
  int get storeId;
  @override
  String get recommendation;
  @override
  String get content;
  @override
  String get socket;
  @override
  String get wifi;
  @override
  String get restroom;
  @override
  String get tableSize;
  @override
  List<String>? get imageFiles;
  @override
  @JsonKey(ignore: true)
  _$$_CreateReivewRequestCopyWith<_$_CreateReivewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
