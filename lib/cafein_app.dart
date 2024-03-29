import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/cafein_route.dart';
import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/data/datasource/remote/dio_util.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/member_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/review_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/store_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/kakao/kakao_api_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/auth_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/board_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/congestion_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/coupon_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/event_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/heart_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/member_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/notification_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/report_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/review_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/sticker_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/store_client.dart';
import 'package:cafein_flutter/data/repository/app_repository.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:cafein_flutter/data/repository/congestion_repository.dart';
import 'package:cafein_flutter/data/repository/coupon_repository.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/notification_repository.dart';
import 'package:cafein_flutter/data/repository/review_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/main/bloc/camera_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/bloc/photo_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:cafein_flutter/firebase_config.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/logger/custom_navigator_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
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
            authClient: AuthClient(
              DioUtil().authDio,
              baseUrl: appConfig.baseUrl,
            ),
            authPreference: AppDatabase().authPreference,
          ),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            memberClient: MemberClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
            memberFormDataClient: MemberFormDataClient(
              dio: DioUtil().dio,
            ),
            kakaoApiClient: KakaoApiClient(dio: DioUtil().kakaoDio),
            authPreference: AppDatabase().authPreference,
          ),
        ),
        RepositoryProvider<StoreRepository>(
          create: (context) => StoreRepositoryImpl(
            storeFormDataClient: StoreFormDataClient(dio: DioUtil().dio),
            storeClient: StoreClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
            kakaoApiClient: KakaoApiClient(dio: DioUtil().kakaoDio),
          ),
        ),
        RepositoryProvider<ReviewRepository>(
          create: (context) => ReviewRepositoryImpl(
            reportClient: ReportClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
            reviewClient: ReviewClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
            reviewFormDataClient: ReviewFormDataClient(dio: DioUtil().dio),
          ),
        ),
        RepositoryProvider<StickerRepository>(
          create: (context) => StickerRepositoryImpl(
            stickerClient: StickerClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<HeartRepository>(
          create: (context) => HeartRepositoryImpl(
            heartClient: HeartClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<NotificationRepository>(
          create: (context) => NotificationRepositoryImpl(
            notificationClient: NotificationClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<BoardRepository>(
          create: (context) => BoardRepositoryImpl(
            boardClient: BoardClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
            eventClient: EventClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<CongestionRepository>(
          create: (context) => CongestionRepositoryImpl(
            congestionClient: CongestionClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<CouponRepository>(
          create: (context) => CouponRepositoryImpl(
            couponClient: CouponClient(
              DioUtil().dio,
              baseUrl: appConfig.baseUrl,
            ),
          ),
        ),
        RepositoryProvider<AppRepository>(
          create: (context) => AppRepositoryImpl(
            appPreference: AppDatabase().appPreference,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocationPermissionBloc()),
          BlocProvider(create: (context) => CameraPermissionBloc()),
          BlocProvider(create: (context) => PhotoPermissionBloc()),
          BlocProvider(create: (context) => AuthCubit()),
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
          theme: AppTheme.light.copyWith(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppColor.grey800,
                  displayColor: AppColor.grey800,
                ),
          ),
          darkTheme: AppTheme.light.copyWith(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: AppColor.grey800,
                  displayColor: AppColor.grey800,
                ),
          ),
          initialRoute: SplashPage.routeName,
          onGenerateRoute: CafeinRoute.onGenerateRoute,
          navigatorObservers: [
            CustomNavigatorLogger(),
            FirebaseAnalyticsObserver(analytics: analytics)
          ],
        ),
      ),
    );
  }
}
