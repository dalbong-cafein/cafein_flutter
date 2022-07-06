import 'package:freezed_annotation/freezed_annotation.dart';

part 'sticker.g.dart';
part 'sticker.freezed.dart';

@freezed
class Sticker with _$Sticker {
  factory Sticker({
    required String stickerType,
    required String storeName,
    @JsonKey(name: 'regDateTime') required String registeredDateTime,
    @JsonKey(name: 'expDateTime') required String expiredDateTime,
  }) = _Sticker;

  factory Sticker.fromJson(Map<String, dynamic> json) => _$StickerFromJson(json);
}
