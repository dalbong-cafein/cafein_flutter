import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthPreviewed());

  void authConfirmRequested() {
    emit(const AuthConfirmed());
  }

  void authPreviewReqeusted() {
    emit(const AuthPreviewed());
  }
}
