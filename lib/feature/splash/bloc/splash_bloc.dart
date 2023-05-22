import 'dart:async';

import 'package:cafein_flutter/data/repository/app_repository.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.authRepository,
    required this.userRepository,
    required this.appRepository,
  }) : super(const SplashInitial()) {
    on<SplashLoginRequested>(_onSplashLoginRequested);
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;
  final AppRepository appRepository;

  FutureOr<void> _onSplashLoginRequested(
    SplashLoginRequested event,
    Emitter<SplashState> emit,
  ) async {
    final tokenData = authRepository.getTokenData();
    print("@@@@@@@" + _stringToDatTime(tokenData!.refreshTokenExpires).toString());
    print("@@@@@@@ access : " + _stringToDatTime(tokenData!.accessTokenExpires).toString());
    DateTime accessTokenExpireDate = _stringToDatTime(tokenData.accessTokenExpires);

    //accessToken이 만료되었을 경우청

      //refresh Token이 만료 안되었을 경우
        //access Token 재발급
      //refresh Token이 만료  되었을 경우
        //로그인 재 요청

    if (tokenData == null) {
      emit(const SplashLoginChecked());

      return;
    }

    try {
      final response = await userRepository.getMember();

      final userData = response.data;
      userRepository.setMemberData = response.data;

      if (userData.isAgreeLocation == null) {
        emit(const SplashTermsChecked());

        return;
      }

      if (userData.phoneNumber == null) {
        emit(const SplashPhoneChecked());

        return;
      }

      if (userData.nickname == null) {
        emit(const SplashProfileChecked());

        return;
      }

      if (!appRepository.isOnboardSkip()) {
        emit(const SplashOnboardChecked());

        return;
      }
      emit(const SplashMainChecked());
    } catch (e) {
      emit(const SplashError());
    }
  }

  DateTime _stringToDatTime(String str){

    String month = str.substring(3,6);
    String year = str.substring(7, 11);
    String date = str.substring(0 , 2);
    String time = str.substring(12, str.length);

    if(month == 'Jan'){
      month = '01';
    }if(month == 'Feb') {
      month = '02';
    }if(month == 'Mar'){
      month = '03';
    }if(month == 'Apr'){
      month = '04';
    }if(month == 'May'){
      month = '05';
    }if(month == 'Jun'){
      month = '06';
    }if(month == 'Jul'){
      month = '07';
    }if(month == 'Aug'){
      month = '08';
    }if(month == 'Sep'){
      month = '09';
    }if(month == 'Oct'){
      month = '10';
    }if(month == 'Nov'){
      month = '11';
    }if(month == 'Dec'){
      month = '12';
    }
    String newDate = "$year-$month-$date $time";

    DateTime result = DateTime.parse(newDate);
    return result;
  }
}
