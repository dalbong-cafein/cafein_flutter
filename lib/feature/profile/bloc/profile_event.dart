part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileUpdateRequested extends ProfileEvent {
  const ProfileUpdateRequested();
}

class ProfileNicknameChanged extends ProfileEvent {
  const ProfileNicknameChanged({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object> get props => [nickname];
}

class ProfileNicknameDuplicationRequested extends ProfileEvent {
  const ProfileNicknameDuplicationRequested({
    required this.nickname,
  });

  final String nickname;

  @override
  List<Object> get props => [nickname];
}

class ProfilePermissionRequested extends ProfileEvent {
  const ProfilePermissionRequested({
    required this.permission,
  });

  final Permission permission;

  @override
  List<Object> get props => [permission];
}

class ProfileImageChanged extends ProfileEvent {
  const ProfileImageChanged({
    required this.permission,
    this.isDefault = false,
  });

  final Permission permission;
  final bool isDefault;

  @override
  List<Object> get props => [
        permission,
        isDefault,
      ];
}
