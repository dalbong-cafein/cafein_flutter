import 'dart:async';
import 'dart:io';

import 'package:cafein_flutter/data/model/member/update_member_request.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.userRepository,
    required this.authRepository,
  }) : super(const ProfileInitial()) {
    on<ProfileUpdateRequested>(_onProfileUpdateRequested);
    on<ProfileNicknameDuplicationRequested>(
        _onProfileNicknameDuplicationRequested);
    on<ProfileImageChanged>(_onProfileImageChanged);
    on<ProfilePermissionRequested>(_onProfilePermissionRequested);
    on<ProfileNicknameChanged>(_onProfileNicknameChanged);
  }

  final UserRepository userRepository;
  final AuthRepository authRepository;

  String? profileImagePath;
  String nickname = '';

  bool isDuplicated = true;

  FutureOr<void> _onProfilePermissionRequested(
    ProfilePermissionRequested event,
    Emitter<ProfileState> emit,
  ) async {
    if (Platform.isIOS) {
      final status = await event.permission.request();
      emit(
        ProfilePermissionChecked(
          permission: event.permission,
          permissionStatus: status,
        ),
      );
    } else if (Platform.isAndroid) {}
  }

  FutureOr<void> _onProfileImageChanged(
    ProfileImageChanged event,
    Emitter<ProfileState> emit,
  ) async {
    final imagePicker = ImagePicker();
    XFile? imageFile;
    if (event.permission == Permission.camera) {
      imageFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 480,
      );
    } else if (event.permission == Permission.photos) {
      imageFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 480,
        maxWidth: 480,
      );
    }

    if (imageFile != null) {
      profileImagePath = imageFile.path;
      emit(
        ProfileImageSelected(
          imagePath: profileImagePath!,
        ),
      );
    }
  }

  FutureOr<void> _onProfileNicknameDuplicationRequested(
    ProfileNicknameDuplicationRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final response = await authRepository.duplicateNickname(event.nickname);
      if (response.code == -1) {
        emit(
          const ProfileNicknameDuplicationChecked(
            isDuplicated: false,
          ),
        );
        return;
      }
      isDuplicated = response.data;
      emit(
        ProfileNicknameDuplicationChecked(
          isDuplicated: isDuplicated,
        ),
      );
    } catch (e) {
      emit(
        const ProfileNicknameDuplicationChecked(
          isDuplicated: false,
        ),
      );
    }
  }

  FutureOr<void> _onProfileUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    if (!isDuplicated) {
      emit(
        const ProfileNicknameDuplicationChecked(isDuplicated: false),
      );

      return;
    }

    try {
      final response = await userRepository.updateMember(
        UpdateMemberRequest(
          memberId: userRepository.getMemberData?.memberId ?? -1,
          nickName: nickname,
          imageFile: profileImagePath,
        ),
      );

      if (response.code == -1) {
        emit(
          ProfileError(
            event: () => add(event),
          ),
        );

        return;
      }
      emit(const ProfileUpdateSucceed());
    } catch (e) {
      if (e is! DioError) {
        emit(
          ProfileError(
            event: () => add(event),
          ),
        );
        return;
      }

      bool isNetworkError = false;
      if (e.type == DioErrorType.other) {
        isNetworkError = true;
      }

      emit(
        ProfileError(
          event: () => add(event),
          isNetworkError: isNetworkError,
        ),
      );
    }
  }

  FutureOr<void> _onProfileNicknameChanged(
    ProfileNicknameChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      ProfileNicknameValidationChecked(
        isValid: event.nickname.isNotEmpty,
        nicknameLength: event.nickname.length,
      ),
    );
  }
}
