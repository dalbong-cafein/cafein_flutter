import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/member/update_member_request.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    required this.userRepository,
    required this.authRepository,
  }) : super(const EditProfileInitial()) {
    on<EditProfileRequested>(_onEditProfileRequested);
    on<EditProfileNicknameChanged>(_onEditProfileNicknameChanged);
    on<EditProfileNicknameDuplicationRequested>(_onEditProfileNicknameDuplicationRequested);
    on<EditProfileImageChanged>(_onEditProfileImageChanged);
    on<EditProfilePermissionRequested>(_onEditProfilePermissionRequested);
    on<EditProfilePhoneNumberChanged>(_onEditProfilePhoneNumberChanged);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;

  bool _isNicknameValid = true;
  late int _nicknameLength = userRepository.getMemberData?.nickname?.length ?? 0;
  bool _isDuplicated = true;
  late String _nickname = userRepository.getMemberData?.nickname ?? '';
  String? _imagePath;
  String? _phoneNumber;

  FutureOr<void> _onEditProfileRequested(
    EditProfileRequested event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(const EditProfileLoading());
    if (!_isDuplicated) {
      emit(
        EditProfileNicknameDupicatedChecked(
          isDuplicated: _isDuplicated,
        ),
      );

      return;
    }
    try {
      final currentUserData = userRepository.getMemberData;

      final response = await userRepository.updateMember(
        UpdateMemberRequest(
          memberId: currentUserData!.memberId,
          nickName: _nickname,
          imageFile: _imagePath == null || _imagePath == CafeinConst.defaultProfileFlag
              ? null
              : _imagePath,
          deleteImageId: _imagePath == null ? null : currentUserData.imageIdPair?.imageId,
        ),
      );

      if (response.code == -1) {
        emit(
          EditProfileError(
            error: Error(),
            event: () => add(event),
          ),
        );

        return;
      }
      userRepository.setMemberData = userRepository.getMemberData!.copyWith(
        nickname: _nickname,
        imageIdPair: _imagePath == CafeinConst.defaultProfileFlag ? null : response.data,
      );
      emit(const EditProfileSucceed());
    } catch (e) {
      debugPrint(e.toString());
      emit(
        EditProfileError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onEditProfileNicknameChanged(
    EditProfileNicknameChanged event,
    Emitter<EditProfileState> emit,
  ) {
    _nicknameLength = event.nickname.length;
    _isNicknameValid = event.nickname.isNotEmpty;

    emit(
      EditProfileInformationChecked(
        nicknameLength: _nicknameLength,
        isNicknameValid: _isNicknameValid,
        phoneNumber: _phoneNumber,
        imagePath: _imagePath,
      ),
    );
  }

  FutureOr<void> _onEditProfileNicknameDuplicationRequested(
    EditProfileNicknameDuplicationRequested event,
    Emitter<EditProfileState> emit,
  ) async {
    try {
      final response = await authRepository.duplicateNickname(event.nickname);
      if (response.code == -1) {
        _isDuplicated = false;
      } else {
        _isDuplicated = response.data;
        _nickname = event.nickname;
      }
    } catch (e) {
      _isDuplicated = false;
    } finally {
      emit(
        EditProfileNicknameDupicatedChecked(
          isDuplicated: _isDuplicated,
        ),
      );
    }
  }

  FutureOr<void> _onEditProfileImageChanged(
    EditProfileImageChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    if (event.isDefault) {
      _imagePath = CafeinConst.defaultProfileFlag;
    } else {
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

      _imagePath = imageFile?.path;
    }

    emit(
      EditProfileInformationChecked(
        nicknameLength: _nicknameLength,
        isNicknameValid: _isNicknameValid,
        phoneNumber: _phoneNumber,
        imagePath: _imagePath,
      ),
    );
  }

  FutureOr<void> _onEditProfilePermissionRequested(
    EditProfilePermissionRequested event,
    Emitter<EditProfileState> emit,
  ) async {
    final status = await event.permission.request();
    emit(
      EditProfilePermissionChecked(
        permission: event.permission,
        permissionStatus: status,
      ),
    );
  }

  FutureOr<void> _onEditProfilePhoneNumberChanged(
    EditProfilePhoneNumberChanged event,
    Emitter<EditProfileState> emit,
  ) {
    _phoneNumber = userRepository.getMemberData!.phoneNumber;

    emit(
      EditProfileInformationChecked(
        nicknameLength: _nicknameLength,
        isNicknameValid: _isNicknameValid,
        phoneNumber: _phoneNumber,
        imagePath: _imagePath,
      ),
    );
  }
}
