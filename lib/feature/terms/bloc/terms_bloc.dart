import 'dart:async';

import 'package:cafein_flutter/data/model/member/terms_request.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'terms_event.dart';
part 'terms_state.dart';

enum TermsContents {
  all('전체 동의'),
  service('이용약관 동의(필수)'),
  personal('개인정보 수집 및 이용 동의(필수)'),
  location('위치 기반 서비스 약관 동의(필수)'),
  marketing('마케팅 정보 앱 푸시 알림 수신 동의(선택)');

  final String title;

  const TermsContents(this.title);
}

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  TermsBloc({
    required this.userRepository,
  }) : super(const TermsInitial()) {
    on<TermsRequested>(_onTermsRequested);
    on<TermsToggled>(_onTermsToggled);
  }

  final UserRepository userRepository;

  bool isAllChecked = false;
  bool isServiceChecked = false;
  bool isPersonalChecked = false;
  bool isLocationChecked = false;
  bool isMarketingChecked = false;
  bool isValid = false;

  FutureOr<void> _onTermsRequested(
    TermsRequested event,
    Emitter<TermsState> emit,
  ) async {
    emit(const TermsLoading());

    try {
      final response = await userRepository.agreeTerms(
        TermsRequest(
          isAgreeLocation: isMarketingChecked,
          isAgreeMarketingPush: isLocationChecked,
        ),
      );

      emit(const TermsLoaded());
    } catch (e) {
      emit(
        TermsError(
          error: e,
          event: () => add(event),
        ),
      );
    }
  }

  FutureOr<void> _onTermsToggled(
    TermsToggled event,
    Emitter<TermsState> emit,
  ) {
    switch (event.termsContents) {
      case TermsContents.service:
        isServiceChecked = event.isCheck;
        break;
      case TermsContents.personal:
        isPersonalChecked = event.isCheck;
        break;
      case TermsContents.location:
        isLocationChecked = event.isCheck;
        break;
      case TermsContents.marketing:
        isMarketingChecked = event.isCheck;
        break;
      case TermsContents.all:
        isMarketingChecked = event.isCheck;
        isLocationChecked = event.isCheck;
        isPersonalChecked = event.isCheck;
        isServiceChecked = event.isCheck;
        break;
    }

    isAllChecked = isServiceChecked &&
        isPersonalChecked &&
        isLocationChecked &&
        isMarketingChecked;

    isValid = isServiceChecked && isPersonalChecked && isLocationChecked;

    emit(
      TermsChecked(
        isAllChecked: isAllChecked,
        isServiceChecked: isServiceChecked,
        isPersonalChecked: isPersonalChecked,
        isLocationChecked: isLocationChecked,
        isMarketingChecked: isMarketingChecked,
        isValid: isValid,
      ),
    );
  }
}
