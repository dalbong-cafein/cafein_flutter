import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_unite_request.g.dart';
part 'account_unite_request.freezed.dart';

@freezed
class AccountUniteRequest with _$AccountUniteRequest {
  factory AccountUniteRequest({
    required String newOauthId,
    required String newAuthProvider,
  }) = _AccountUniteRequest;

  factory AccountUniteRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountUniteRequestFromJson(json);
}
