import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/data/model/common/more_view_count_response.dart';
import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:cafein_flutter/data/repository/coupon_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/apply_coupon/apply_coupon_page.dart';
import 'package:cafein_flutter/feature/apply_coupon/bloc/apply_coupon_bloc.dart';
import 'package:cafein_flutter/feature/certify_phone/bloc/certify_code_bloc.dart';
import 'package:cafein_flutter/feature/certify_phone/bloc/input_phone_number_bloc.dart';
import 'package:cafein_flutter/feature/certify_phone/input_certification_code_page.dart';
import 'package:cafein_flutter/feature/certify_phone/input_phone_number_page.dart';
import 'package:cafein_flutter/feature/certify_phone/phone_certificaion_done_page.dart';
import 'package:cafein_flutter/feature/login/bloc/login_bloc.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/edit_profile_page.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/bloc/faq_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/faq_page.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/bloc/notice_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_detail_page.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_page.dart';
import 'package:cafein_flutter/feature/main/more_view/sign_off/sign_off_page.dart';
import 'package:cafein_flutter/feature/main/search/search_keyword_page.dart';
import 'package:cafein_flutter/feature/profile/bloc/profile_bloc.dart';
import 'package:cafein_flutter/feature/profile/profile_page.dart';
import 'package:cafein_flutter/feature/received_coupons/received_coupons_page.dart';
import 'package:cafein_flutter/feature/splash/splash_page.dart';
import 'package:cafein_flutter/feature/sticker/bloc/sticker_bloc.dart';
import 'package:cafein_flutter/feature/sticker/sticker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/received_coupons/bloc/received_coupons_bloc.dart';

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
        page = BlocProvider(
          create: (context) => InputPhoneNumberBloc(
            authRepository: context.read<AuthRepository>(),
          ),
          child: const InputPhoneNumberPage(),
        );
        break;
      case InputCertificationCodePage.routeName:
        final phoneNumber = settings.arguments as String;

        page = BlocProvider(
          create: (context) => CertifyCodeBloc(
            authRepository: context.read<AuthRepository>(),
            userRepository: context.read<UserRepository>(),
            phoneNumber: phoneNumber,
          ),
          child: const InputCertificationCodePage(),
        );
        break;
      case MainPage.routeName:
        page = MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainBloc(),
            ),
            BlocProvider(
              create: (context) => LocationPermissionBloc(),
            ),
          ],
          child: const MainPage(),
        );
        break;
      case ProfilePage.routeName:
        page = BlocProvider(
          create: (context) => ProfileBloc(
            authRepository: context.read<AuthRepository>(),
            userRepository: context.read<UserRepository>(),
          ),
          child: const ProfilePage(),
        );
        break;
      case PhoneCertificationDonePage.routeName:
        page = const PhoneCertificationDonePage();
        break;
      case SearchKeywordPage.routeName:
        page = const SearchKeywordPage();
        break;
      case StickerPage.routeName:
        page = BlocProvider(
          create: (context) => StickerBloc(
              stickerRepository: context.read<StickerRepository>(),
              couponRepository: context.read<CouponRepository>()),
          child: const StickerPage(),
        );
        break;

      case NoticePage.routeName:
        page = BlocProvider(
          create: (context) => NoticeBloc(
            boardRepository: context.read<BoardRepository>(),
          ),
          child: const NoticePage(),
        );
        break;
      case NoticeDetailPage.routeName:
        final notice = settings.arguments as Board;
        page = NoticeDetailPage(notice: notice);
        break;
      case FaqPage.routeName:
        page = BlocProvider(
          create: (context) => FaqBloc(
            boardRepository: context.read<BoardRepository>(),
          ),
          child: const FaqPage(),
        );
        break;
      case SignOffPage.routeName:
        final moreViewCountResponse = settings.arguments as MoreViewCountResponse;
        page = SignOffPage(
          moreViewCountResponse: moreViewCountResponse,
        );
        break;
      case EditProfilePage.routeName:
        page = const EditProfilePage();
        break;
      case ReceivedCouponsPage.routeName :
        page = BlocProvider(
          create: (context) => ReceivedCouponsBloc(
            couponRepository: context.read<CouponRepository>()
          ),
          child: const ReceivedCouponsPage(),
        );
        break;
      case ApplyCouponPage.routeName :
        page = BlocProvider(
            create: (context) => ApplyCouponBloc(
                couponRepository: context.read<CouponRepository>()
            ),
          child: const ApplyCouponPage(),
        );
        break;

    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
