import 'package:cafein_flutter/data/repository/heart_repository.dart';
import 'package:cafein_flutter/data/repository/notification_repository.dart';
import 'package:cafein_flutter/data/repository/sticker_repository.dart';
import 'package:cafein_flutter/data/repository/store_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/home/home_page.dart';
import 'package:cafein_flutter/feature/main/more_view/more_view_page.dart';
import 'package:cafein_flutter/feature/main/notification/bloc/notification_bloc.dart';
import 'package:cafein_flutter/feature/main/notification/notification_page.dart';
import 'package:cafein_flutter/feature/main/search/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/main/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = 'MainPage';

  @override
  Widget build(BuildContext context) {
    var pages = [
      BlocProvider(
        create: (context) => HomeBloc(
          stickerRepository: context.read<StickerRepository>(),
          heartRepository: context.read<HeartRepository>(),
          userRepository: context.read<UserRepository>(),
          storeRepository: context.read<StoreRepository>(),
        ),
        child: const HomePage(),
      ),
      BlocProvider(
        create: (context) => SearchBloc(
          userRepository: context.read<UserRepository>(),
          storeRepository: context.read<StoreRepository>(),
        ),
        child: const SearchPage(),
      ),
      BlocProvider(
        create: (context) => NotificationBloc(
          notificationRepository: context.read<NotificationRepository>(),
        ),
        child: const NotificationPage(),
      ),
      const MoreViewPage(),
    ];

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainNavigationSelected) {
          return pages[state.index];
        }
        return const SizedBox.shrink();
      },
    );
  }
}
