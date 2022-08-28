part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object?> get props => [];
}

class EditProfileRequested extends EditProfileEvent {
  const EditProfileRequested();
}

class EditProfileNicknameChanged extends EditProfileEvent {
  const EditProfileNicknameChanged({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object?> get props => [nickname];
}

class EditProfileNicknameDuplicationRequested extends EditProfileEvent {
  const EditProfileNicknameDuplicationRequested({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object?> get props => [nickname];
}

class EditProfilePermissionRequested extends EditProfileEvent {
  const EditProfilePermissionRequested({
    required this.permission,
  });

  final Permission permission;

  @override
  List<Object> get props => [permission];
}

class EditProfileImageChanged extends EditProfileEvent {
  const EditProfileImageChanged({
    this.permission,
    this.isDefault = false,
  });

  final Permission? permission;
  final bool isDefault;

  @override
  List<Object?> get props => [
        permission,
        isDefault,
      ];
}

class EditProfilePhoneNumberChanged extends EditProfileEvent {
  const EditProfilePhoneNumberChanged({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}
