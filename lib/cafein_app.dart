import 'package:cafein_flutter/cafein_route.dart';
import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/data/datasource/remote/dio_util.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/member_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/auth_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/member_client.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CafeinApp extends StatelessWidget {
  const CafeinApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            authClient: AuthClient(DioUtil().authDio),
            authPreference: AppDatabase().authPreference,
          ),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            memberClient: MemberClient(DioUtil().dio),
            memberFormDataClient: MemberFormDataClient(dio: DioUtil().dio),
          ),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQueryData.fromWindow(
            WidgetsBinding.instance.window,
          ).copyWith(
            boldText: false,
            textScaleFactor: 1.0,
          ),
          child: child!,
        ),
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.routeName,
        onGenerateRoute: CafeinRoute.onGenerateRoute,
      ),
    );
  }
}
