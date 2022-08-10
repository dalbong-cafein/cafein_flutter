import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_id_pair.g.dart';
part 'image_id_pair.freezed.dart';

@freezed
class ImageIdPair with _$ImageIdPair {
  factory ImageIdPair({
    required int imageId,
    required String imageUrl,
  }) = _StoreImagePair;

  factory ImageIdPair.fromJson(Map<String, dynamic> json) => _$ImageIdPairFromJson(json);
}
