import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/notice/bloc/notice_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NoticeBloc>().add(NoticeRequested());
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text("알림"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcon.trash,
                ),
                iconSize: 160,
              ))
        ],
      ),
      body: BlocBuilder<NoticeBloc, NoticeState>(
        builder: (context, state) {
          if (state is NoticeLoaded) {
            if (state.notices.isEmpty) {
              return const Center(
                child: Text("빈 화면"),
              );
            }
            return ListView.builder(
                itemCount: state.notices.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: state.notices[index].isRead
                        ? Colors.white
                        : AppColor.grey50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 12, bottom: 12, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.square, color: AppColor.grey400),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.notices[index].noticeType),
                                Text(
                                  state.notices[index].content,
                                  style: AppStyle.body14Regular,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is NoticeLoading) {
            return Container();
          } else if (state is NoticeError) {
            return Container();
          } else if (state is NoticeInitial) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
