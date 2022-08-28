part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {
  const EditProfileInitial();
}

class EditProfileLoading extends EditProfileState {
  const EditProfileLoading();
}

class EditProfileError extends EditProfileState {
  const EditProfileError({
    required this.error,
    required this.event,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class EditProfileSucceed extends EditProfileState {
  const EditProfileSucceed();
}

class EditProfilePermissionChecked extends EditProfileState {
  const EditProfilePermissionChecked({
    required this.permission,
    required this.permissionStatus,
  });

  final PermissionStatus permissionStatus;
  final Permission permission;

  @override
  List<Object?> get props => [
        permission,
        permissionStatus,
      ];
}

class EditProfileInformationChecked extends EditProfileState {
  const EditProfileInformationChecked({
    required this.isDuplicated,
    required this.isNicknameValid,
    required this.nicknameLength,
    this.imagePath,
    this.phoneNumber,
  });

  final bool isNicknameValid;
  final int nicknameLength;
  final bool isDuplicated;
  final String? imagePath;
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        isNicknameValid,
        nicknameLength,
        isDuplicated,
        imagePath,
        phoneNumber,
      ];
}
