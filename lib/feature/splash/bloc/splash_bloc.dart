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

    print("@@@@@@ expires : " + str);
    String newDate = '2023-03-12 11:10:11Z';
    //String newDate = "${str.substring(0,2)}$month${str.substring(8, 20)}Z";
    DateTime result = DateTime.parse(newDate);
    return result;
  }
}
