import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/phone_certification/phone_certification_page.dart';
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:flutter/material.dart';

abstract class CafeinRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case SplashPage.routeName:
        page = const SplashPage();
        break;
      case LoginPage.routeName:
        page = const LoginPage();
        break;
      case PhoneCertificationPage.routeName:
        page = const PhoneCertificationPage();
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
