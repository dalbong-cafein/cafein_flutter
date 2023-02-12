import 'package:cafein_flutter/data/repository/auth_repository.dart';
import 'package:cafein_flutter/data/repository/board_repository.dart';
import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/notification_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/home/home_page.dart';
import 'package:cafein_flutter/feature/main/map/bloc/map_bloc.dart';
import 'package:cafein_flutter/feature/main/map/map_page.dart';
import 'package:cafein_flutter/feature/main/more_view/bloc/more_view_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/more_view_page.dart';
import 'package:cafein_flutter/feature/main/notification/bloc/notification_bloc.dart';
import 'package:cafein_flutter/feature/main/notification/notification_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = 'MainPage';

  @override
  Widget build(BuildContext context) {
    final pages = [
      BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          isPreview: context.read<AuthCubit>().state == const AuthPreviewed(),
          stickerRepository: context.read<StickerRepository>(),
          heartRepository: context.read<HeartRepository>(),
          userRepository: context.read<UserRepository>(),
          storeRepository: context.read<StoreRepository>(),
          boardRepository: context.read<BoardRepository>(),
        ),
        child: const HomePage(),
      ),
      BlocProvider<MapBloc>(
        create: (context) => MapBloc(
          userRepository: context.read<UserRepository>(),
          storeRepository: context.read<StoreRepository>(),
          heartRepository: context.read<HeartRepository>(),
        ),
        child: const MapPage(),
      ),
      BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(
          notificationRepository: context.read<NotificationRepository>(),
        ),
        child: const NotificationPage(),
      ),
      BlocProvider<MoreViewBloc>(
        create: (context) => MoreViewBloc(
          authRepository: context.read<AuthRepository>(),
          userRepository: context.read<UserRepository>(),
        ),
        child: const MoreViewPage(),
      ),
      const SizedBox.shrink(),
    ];

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainNavigationSelected) {
          return WillPopScope(
            onWillPop: () async => false,
            child: IndexedStack(
              index: state.index,
              children: pages,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
