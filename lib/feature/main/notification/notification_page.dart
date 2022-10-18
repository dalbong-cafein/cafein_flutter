import 'dart:developer';

import 'package:cafein_flutter/data/model/enum/notification_type.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_page.dart';
import 'package:cafein_flutter/feature/main/notification/bloc/notification_bloc.dart';
import 'package:cafein_flutter/feature/main/notification/widget/notification_dialog.dart';
import 'package:cafein_flutter/feature/received_coupons/received_coupons_page.dart';
import 'package:cafein_flutter/feature/sticker/sticker_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationBloc, NotificationState>(
          listener: (context, state) {
            if (state is NotificationError) {
              ErrorDialog.show(
                context,
                error: state.error,
                refresh: state.event,
              );
            } else if (state is NotificationOpened) {
              if (state.notification.notificationType ==
                  NotificationType.sticker.title) {
                Navigator.of(context).pushNamed(
                  StickerPage.routeName,
                );
              } else if (state.notification.notificationType ==
                  NotificationType.coupon.title) {
                Navigator.of(context).pushNamed(
                  ReceivedCouponsPage.routeName,
                );
              } else if (state.notification.notificationType ==
                  NotificationType.notice.title) {
                Navigator.of(context).pushNamed(
                  NoticePage.routeName,
                );
              }
            }
          },
        ),
        BlocListener<MainBloc, MainState>(
          listenWhen: (pre, next) => next is MainNavigationSelected,
          listener: (context, state) {
            if (state is MainNavigationSelected && state.index == 2) {
              context.read<NotificationBloc>().add(
                    const NotificationRequested(),
                  );
            }
          },
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 16,
          title: const Text(
            '알림',
            style: AppStyle.title19Bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () async {
                  final bloc = context.read<NotificationBloc>();
                  final result = await NotificationDialog.show(context);

                  if (!result) {
                    return;
                  }

                  bloc.add(
                    const NotificationDeleteRequested(),
                  );
                },
                icon: SvgPicture.asset(
                  AppIcon.trash,
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          buildWhen: (pre, next) => next is NotificationLoaded,
          builder: (context, state) {
            if (state is NotificationLoaded) {
              if (state.notifications.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      loadAsset(
                        AppIcon.notificationOff,
                        width: 80,
                        height: 80,
                        color: AppColor.grey200,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '새로운 알림이 없습니다',
                        style: AppStyle.caption13Regular.copyWith(
                          color: AppColor.grey600,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async => context.read<NotificationBloc>().add(
                      const NotificationRequested(),
                    ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => context.read<NotificationBloc>().add(
                            NotificationReadRequested(notificationIndex: index),
                          ),
                      child: Container(
                        color: state.notifications[index].isRead
                            ? Colors.white
                            : AppColor.grey50,
                        height: 92,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _getNotificationIcon(
                                state.notifications[index].notificationType),
                            const SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.notifications[index].notificationType,
                                  style: AppStyle.subTitle14Medium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.notifications[index].content,
                                  style: AppStyle.body14Regular,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const CustomCircleLoadingIndicator();
          },
        ),
      ),
    );
  }

  Widget _getNotificationIcon(String notificationType) {
    if (notificationType == NotificationType.notice.title) {
      return loadAsset(AppIcon.notificationNotice);
    } else if (notificationType == NotificationType.sticker.title) {
      return loadAsset(AppIcon.notificationSticker);
    } else if (notificationType == NotificationType.coupon.title) {
      return loadAsset(AppIcon.notificationEvent);
    } else if (notificationType == NotificationType.report.title) {
      return loadAsset(AppIcon.notificationReport);
    } else {
      return const Icon(
        CupertinoIcons.xmark,
      );
    }
  }
}
