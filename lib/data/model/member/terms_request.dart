import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_request.g.dart';
part 'terms_request.freezed.dart';

@freezed
class TermsRequest with _$TermsRequest {
  const factory TermsRequest({
    required bool isAgreeLocation,
    required bool isAgreeMarketingPush,
  }) = _TermsRequest;

  factory TermsRequest.fromJson(Map<String, dynamic> json) =>
      _$TermsRequestFromJson(json);
}
