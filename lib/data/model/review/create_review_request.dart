import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_review_request.freezed.dart';

@freezed
class CreateReivewRequest with _$CreateReivewRequest {
  factory CreateReivewRequest({
    required int storeId,
    required String recommendation,
    required String content,
    required String socket,
    required String wifi,
    required String restroom,
    required String tableSize,
    List<String>? imageFiles,
  }) = _CreateReivewRequest;
}
