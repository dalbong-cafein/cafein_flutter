import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.g.dart';
part 'board.freezed.dart';

@freezed
class Board with _$Board {
  factory Board({
    required int boardId,
    required String title,
    required String content,
    List<ImageIdPair>? imageIdPairs,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}
