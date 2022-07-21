import 'package:cafein_flutter/data/repository/notice_repository.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/home/home_page.dart';
import 'package:cafein_flutter/feature/main/more_view/more_view_page.dart';
import 'package:cafein_flutter/feature/main/notification/notificaion_page.dart';
import 'package:cafein_flutter/feature/main/search/search_page.dart';
import 'package:cafein_flutter/feature/notice/bloc/notice_bloc.dart';
import 'package:cafein_flutter/feature/notice/notice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notice/widget/notice_dialog.dart';



class MainPage extends StatelessWidget {
  const MainPage

  ({super.key});

  static const routeName = 'MainPage';

  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(),
      SearchPage(),
      BlocProvider(
        create: (context) => NoticeBloc(
          noticeRepository: context.read<NoticeRepository>(),
        ),
        child: NoticePage(),
      ),
      MoreViewPage(),
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
