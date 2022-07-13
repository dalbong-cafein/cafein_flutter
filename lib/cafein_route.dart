import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/login/bloc/login_bloc.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/phone_certification/input_certification_code_page.dart';
import 'package:cafein_flutter/feature/phone_certification/input_phone_number_page.dart';
import 'package:cafein_flutter/feature/phone_certification/phone_certificaion_done_page.dart';
import 'package:cafein_flutter/feature/profile/profile_page.dart';
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
      case InputPhoneNumberPage.routeName:
        page = const InputPhoneNumberPage();
        break;
      case InputCertificationCodePage.routeName:
        page = const InputCertificationCodePage();
        break;
      case MainPage.routeName:
        page = BlocProvider(
          create: (context) => MainBloc(),
          child: const MainPage(),
        );
        break;
      case ProfilePage.routeName:
        page = const ProfilePage();
        break;
      case PhoneCertificationDonePage.routeName:
        page = const PhoneCertificationDonePage();
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
