import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_detail_page.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeEventBanner extends StatelessWidget {
  const HomeEventBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is HomeLoaded,
      listener: (context, state) {
        if (state is HomeError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      builder: (context, state) {
        if (state is HomeLoaded) {
          return InkWell(
            onTap: () {
              if (state.homeEventBoardId != null){
                Navigator.of(context).pushNamed(
                  NoticeDetailPage.routeName,
                  arguments: state.homeEventBoardId,
                );
              }
            },
            child: SizedBox(
              height: (width - 32) /5,
              width: width - 32,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(state.homeEventImageUrl, fit: BoxFit.fill,),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
