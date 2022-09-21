// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Board _$BoardFromJson(Map<String, dynamic> json) {
  return _Board.fromJson(json);
}

/// @nodoc
mixin _$Board {
  int get boardId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'boardImageDtoList')
  List<ImageIdPair>? get imageIdPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res>;
  $Res call(
      {int boardId,
      String title,
      String content,
      @JsonKey(name: 'boardImageDtoList') List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class _$BoardCopyWithImpl<$Res> implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  final Board _value;
  // ignore: unused_field
  final $Res Function(Board) _then;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? imageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageIdPairs: imageIdPairs == freezed
          ? _value.imageIdPairs
          : imageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$_BoardCopyWith(_$_Board value, $Res Function(_$_Board) then) =
      __$$_BoardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int boardId,
      String title,
      String content,
      @JsonKey(name: 'boardImageDtoList') List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class __$$_BoardCopyWithImpl<$Res> extends _$BoardCopyWithImpl<$Res>
    implements _$$_BoardCopyWith<$Res> {
  __$$_BoardCopyWithImpl(_$_Board _value, $Res Function(_$_Board) _then)
      : super(_value, (v) => _then(v as _$_Board));

  @override
  _$_Board get _value => super._value as _$_Board;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? imageIdPairs = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_Board(
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageIdPairs: imageIdPairs == freezed
          ? _value._imageIdPairs
          : imageIdPairs // ignore: cast_nullable_to_non_nullable
              as List<ImageIdPair>?,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Board implements _Board {
  _$_Board(
      {required this.boardId,
      required this.title,
      required this.content,
      @JsonKey(name: 'boardImageDtoList') final List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime})
      : _imageIdPairs = imageIdPairs;

  factory _$_Board.fromJson(Map<String, dynamic> json) =>
      _$$_BoardFromJson(json);

  @override
  final int boardId;
  @override
  final String title;
  @override
  final String content;
  final List<ImageIdPair>? _imageIdPairs;
  @override
  @JsonKey(name: 'boardImageDtoList')
  List<ImageIdPair>? get imageIdPairs {
    final value = _imageIdPairs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'Board(boardId: $boardId, title: $title, content: $content, imageIdPairs: $imageIdPairs, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Board &&
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other._imageIdPairs, _imageIdPairs) &&
            const DeepCollectionEquality()
                .equals(other.registeredDateTime, registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(_imageIdPairs),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      __$$_BoardCopyWithImpl<_$_Board>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardToJson(
      this,
    );
  }
}

abstract class _Board implements Board {
  factory _Board(
      {required final int boardId,
      required final String title,
      required final String content,
      @JsonKey(name: 'boardImageDtoList')
          final List<ImageIdPair>? imageIdPairs,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_Board;

  factory _Board.fromJson(Map<String, dynamic> json) = _$_Board.fromJson;

  @override
  int get boardId;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(name: 'boardImageDtoList')
  List<ImageIdPair>? get imageIdPairs;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      throw _privateConstructorUsedError;
}
