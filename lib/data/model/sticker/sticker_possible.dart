import 'package:freezed_annotation/freezed_annotation.dart';

part 'sticker_possible.g.dart';
part 'sticker_possible.freezed.dart';

@freezed
class StickerPossible with _$StickerPossible {
  factory StickerPossible({
    required bool isPossibleIssue,
    String? reason,
  }) = _StickerPossible;

  factory StickerPossible.fromJson(Map<String, dynamic> json) =>
      _$StickerPossibleFromJson(json);
}
