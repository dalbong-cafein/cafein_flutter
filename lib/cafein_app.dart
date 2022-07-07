import 'package:cafein_flutter/cafein_route.dart';
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:flutter/material.dart';

class CafeinApp extends StatelessWidget {
  const CafeinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQueryData.fromWindow(
            WidgetsBinding.instance.window,
          ).copyWith(boldText: false),
          child: child!,
        );
      },
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      onGenerateRoute: CafeinRoute.onGenerateRoute,
    );
  }
}
