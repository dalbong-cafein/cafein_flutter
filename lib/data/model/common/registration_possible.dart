import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_possible.g.dart';
part 'registration_possible.freezed.dart';

@freezed
class RegistrationPossible with _$RegistrationPossible {
  factory RegistrationPossible({
    required bool isPossibleRegistration,
    String? reason,
  }) = _RegistrationPossible;

  factory RegistrationPossible.fromJson(Map<String, dynamic> json) =>
      _$RegistrationPossibleFromJson(json);
}
