import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_number_request.g.dart';
part 'phone_number_request.freezed.dart';

@freezed
class PhoneNumberRequest with _$PhoneNumberRequest {
  factory PhoneNumberRequest({
    @JsonKey(name: 'phone') required String phoneNumber,
  }) = _PhoneNumberRequest;

  factory PhoneNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberRequestFromJson(json);
}
