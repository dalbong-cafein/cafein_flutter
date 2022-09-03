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
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/logger/custom_navigator_logger.dart';
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
            kakaoApiClient: KakaoApiClient(dio: DioUtil().kakaoDio),
          ),
        ),
        RepositoryProvider<StoreRepository>(
          create: (context) => StoreRepositoryImpl(
            storeFormDataClient: StoreFormDataClient(dio: DioUtil().dio),
            storeClient: StoreClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<ReviewRepository>(
          create: (context) => ReviewRepositoryImpl(
            reportClient: ReportClient(DioUtil().dio),
            reviewClient: ReviewClient(DioUtil().dio),
            reviewFormDataClient: ReviewFormDataClient(dio: DioUtil().dio),
          ),
        ),
        RepositoryProvider<StickerRepository>(
          create: (context) => StickerRepositoryImpl(
            stickerClient: StickerClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<HeartRepository>(
          create: (context) => HeartRepositoryImpl(
            heartClient: HeartClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<NotificationRepository>(
          create: (context) => NotificationRepositoryImpl(
            notificationClient: NotificationClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<BoardRepository>(
          create: (context) => BoardRepositoryImpl(
            boardClient: BoardClient(DioUtil().dio),
            eventClient: EventClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<CongestionRepository>(
          create: (context) => CongestionRepositoryImpl(
            congestionClient: CongestionClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<CouponRepository>(
          create: (context) => CouponRepositoryImpl(
            couponClient: CouponClient(DioUtil().dio),
          ),
        ),
        RepositoryProvider<AppRepository>(
          create: (context) => AppRepositoryImpl(
            appPreference: AppDatabase().appPreference,
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
            child: child!),
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
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
        onGenerateRoute: CafeinRoute.onGenerateRoute,
        navigatorObservers: [
          CustomNavigatorLogger(),
        ],
      ),
    );
  }
}
