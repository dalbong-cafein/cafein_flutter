part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileNicknameValidationChecked extends ProfileState {
  const ProfileNicknameValidationChecked({
    required this.isValid,
    required this.nicknameLength,
  });

  final bool isValid;
  final int nicknameLength;

  @override
  List<Object> get props => [
        isValid,
        nicknameLength,
      ];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileUpdateSucceed extends ProfileState {
  const ProfileUpdateSucceed();
}

class ProfileError extends ProfileState {
  const ProfileError({
    required this.event,
    this.isNetworkError = false,
  });

  final bool isNetworkError;
  final Function event;

  @override
  List<Object> get props => [isNetworkError];
}

class ProfileNicknameDuplicationChecked extends ProfileState {
  const ProfileNicknameDuplicationChecked({
    required this.isDuplicated,
  });

  final bool isDuplicated;

  @override
  List<Object> get props => [isDuplicated];
}

class ProfilePermissionChecked extends ProfileState {
  const ProfilePermissionChecked({
    required this.permissionStatus,
    required this.permission,
  });

  final PermissionStatus permissionStatus;
  final Permission permission;

  @override
  List<Object> get props => [
        permission,
        permissionStatus,
      ];
}

class ProfileImageSelected extends ProfileState {
  const ProfileImageSelected({
    required this.imagePath,
  });

  final String imagePath;

  @override
  List<Object> get props => [imagePath];
}
