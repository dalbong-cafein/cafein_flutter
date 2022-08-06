import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/notification/bloc/notification_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NotificationBloc>().add(const NotificationRequested());

    return BlocListener<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state is NotificationError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
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
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoaded) {
              if (state.notifications.isEmpty) {
                return const Center(
                  child: Text("빈 화면"),
                );
              }
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: state.notifications[index].isRead ? Colors.white : AppColor.grey50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 16),
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
                                Text(state.notifications[index].noticeType),
                                Text(
                                  state.notifications[index].content,
                                  style: AppStyle.body14Regular,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
