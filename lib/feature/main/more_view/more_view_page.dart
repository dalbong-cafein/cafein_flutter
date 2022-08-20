import 'dart:math';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/more_view/bloc/more_view_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/faq_page.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_page.dart';
import 'package:cafein_flutter/feature/main/more_view/widget/more_view_menu_card.dart';
import 'package:cafein_flutter/feature/main/more_view/widget/more_view_sign_out_dialog.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreViewPage extends StatefulWidget {
  const MoreViewPage({Key? key}) : super(key: key);

  @override
  State<MoreViewPage> createState() => _MoreViewPageState();
}

class _MoreViewPageState extends State<MoreViewPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<MoreViewBloc>().add(
            const MoreViewCountRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserRepository>().getMemberData;
    final width = MediaQuery.of(context).size.width;

    return BlocListener<MoreViewBloc, MoreViewState>(
      listener: (context, state) {
        if (state is MoreViewSignOuted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginPage.routeName,
            (route) => false,
          );
        } else if (state is MoreViewError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 39,
                      backgroundColor: AppColor.white,
                      backgroundImage: NetworkImage(
                        userData?.imageIdPair?.imageUrl ?? CafeinConst.defaultProfile,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userData!.nickname}',
                          style: AppStyle.subTitle17SemiBold,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '카페인 ${DateTime.now().difference(
                                DateTime.parse(userData.joinDateTime),
                              ).inDays}일차',
                          style: AppStyle.caption13Regular.copyWith(
                            color: AppColor.grey400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Transform.rotate(
                      angle: pi,
                      child: const Icon(
                        CupertinoIcons.back,
                        color: AppColor.grey400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 74,
                  width: width - 48,
                  child: BlocBuilder<MoreViewBloc, MoreViewState>(
                    buildWhen: (pre, next) => next is MoreViewStoreCntAndReviewCntLoaded,
                    builder: (context, state) {
                      if (state is MoreViewStoreCntAndReviewCntLoaded) {
                        return Row(
                          children: [
                            _MoreViewCard(
                              title: '내가 등록한 카페',
                              value: state.storeCount,
                            ),
                            const SizedBox(width: 8),
                            _MoreViewCard(
                              title: '내가 쓴 리뷰',
                              value: state.reviewCount,
                            ),
                          ],
                        );
                      }

                      return const CircleLoadingIndicator();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 1,
                  width: width - 40,
                  color: AppColor.grey50,
                ),
                const SizedBox(height: 12),
                MoreViewMenuCard(
                  title: '연결된 계정',
                  authProvider: true,
                  trailingWidget: Text(
                    '${context.watch<UserRepository>().getAuthProvider}',
                    style: AppStyle.body14Regular.copyWith(
                      color: AppColor.grey400,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 1,
                  width: width - 40,
                  color: AppColor.grey50,
                ),
                const SizedBox(height: 12),
                MoreViewMenuCard(
                  title: '공지사항',
                  onTab: () {
                    Navigator.of(context).pushNamed(NoticePage.routeName);
                  },
                ),
                MoreViewMenuCard(
                  title: '자주 묻는 질문',
                  onTab: () {
                    Navigator.of(context).pushNamed(FaqPage.routeName);
                  },
                ),
                MoreViewMenuCard(
                  title: '서비스 이용 약관',
                  onTab: () {},
                ),
                MoreViewMenuCard(
                  title: '개인정보 처리방침',
                  onTab: () {},
                ),
                MoreViewMenuCard(
                  title: '버전 정보',
                  trailingWidget: Text(
                    '1.0.0',
                    style: AppStyle.body14Regular.copyWith(
                      color: AppColor.grey400,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 1,
                  width: width - 40,
                  color: AppColor.grey50,
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () async {
                    final moreViewBloc = context.read<MoreViewBloc>();
                    final result = await MoreViewSignOutDialog.show(context);
                    if (!result) {
                      return;
                    }

                    moreViewBloc.add(const MoreViewSignOutRequested());
                  },
                  child: SizedBox(
                    height: 56,
                    width: width - 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '로그아웃',
                        style: AppStyle.subTitle15Medium.copyWith(
                          color: AppColor.orange500,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 1,
                  width: width - 40,
                  color: AppColor.grey50,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '탈퇴하기',
                        style: AppStyle.caption13Medium.copyWith(
                          color: AppColor.grey400,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MoreViewCard extends StatelessWidget {
  const _MoreViewCard({
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: (MediaQuery.of(context).size.width - 56) / 2,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColor.grey50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyle.caption13Medium.copyWith(
              color: AppColor.grey600,
            ),
          ),
          Text(
            '$value',
            style: AppStyle.title19SemiBold,
          ),
        ],
      ),
    );
  }
}
