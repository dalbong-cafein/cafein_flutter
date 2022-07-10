import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/login/bloc/login_bloc.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/phone_certification/phone_certification_page.dart';
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CafeinRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case SplashPage.routeName:
        page = const SplashPage();
        break;
      case LoginPage.routeName:
        page = BlocProvider(
          create: (context) => LoginBloc(
            authRepository: context.read<AuthRepository>(),
            userRepository: context.read<UserRepository>(),
          ),
          child: const LoginPage(),
        );
        break;
      case PhoneCertificationPage.routeName:
        page = const PhoneCertificationPage();
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
