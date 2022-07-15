import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cafein_flutter/data/model/member/update_member_request.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.userRepository,
    required this.authRepository,
  }) : super(const ProfileInitial()) {
    on<ProfileUpdateRequested>(_onProfileUpdateRequested);
    on<ProfileNicknameDuplicationRequested>(_onProfileNicknameDuplicationRequested);
    on<ProfileImageChanged>(_onProfileImageChanged);
    on<ProfilePermissionRequested>(_onProfilePermissionRequested);
    on<ProfileNicknameChanged>(_onProfileNicknameChanged);
  }

  final UserRepository userRepository;
  final AuthRepository authRepository;

  String? imagePath;
  String nickname = '';

  FutureOr<void> _onProfilePermissionRequested(
    ProfilePermissionRequested event,
    Emitter<ProfileState> emit,
  ) async {
    if (Platform.isIOS) {
      final status = await event.permission.request();
      log('$status');
    } else if (Platform.isAndroid) {}
  }

  FutureOr<void> _onProfileImageChanged(
    ProfileImageChanged event,
    Emitter<ProfileState> emit,
  ) {
    imagePath = event.imagePath;
    emit(
      ProfileImageSelected(
        imagePath: event.imagePath,
      ),
    );
  }

  FutureOr<void> _onProfileNicknameDuplicationRequested(
    ProfileNicknameDuplicationRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      final response = await authRepository.duplicateNickname(event.nickname);
      if (response.code == -1) {
        emit(
          ProfileError(
            event: () => add(event),
          ),
        );
        return;
      }
      emit(
        ProfileNicknameDuplicationChecked(
          isDuplicated: response.data,
        ),
      );
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

  FutureOr<void> _onProfileUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      final response = await userRepository.updateMember(
        UpdateMemberRequest(
          memberId: userRepository.getMemberData?.memberId ?? -1,
          nickName: nickname,
          imageFile: imagePath,
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
        isValid: event.nickname.length >= 2,
      ),
    );
  }
}
