import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_image_id_pair.g.dart';
part 'store_image_id_pair.freezed.dart';

@freezed
class StoreImageIdPair with _$StoreImageIdPair {
  factory StoreImageIdPair({
    required int imageId,
    String? imageUrl,
  }) = _StoreImagePair;

  factory StoreImageIdPair.fromJson(Map<String, dynamic> json) => _$StoreImageIdPairFromJson(json);
}
