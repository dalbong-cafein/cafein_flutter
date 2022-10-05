import 'package:cafein_flutter/data/model/enum/image_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_type_pair.freezed.dart';

@freezed
class ImageTypePair with _$ImageTypePair {
  factory ImageTypePair({
    required String imageUrl,
    required ImageType imageType,
  }) = _ImageTypePair;
}
