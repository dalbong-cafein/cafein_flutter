import 'dart:developer';

import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/model/common/more_view_count_response.dart';
import 'package:cafein_flutter/data/repository/app_repository.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/more_view/bloc/more_view_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/edit_profile_page.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/faq_page.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_page.dart';
import 'package:cafein_flutter/feature/main/more_view/sign_off/sign_off_page.dart';
import 'package:cafein_flutter/feature/main/more_view/widget/more_view_count_card.dart';
import 'package:cafein_flutter/feature/main/more_view/widget/more_view_menu_card.dart';
import 'package:cafein_flutter/feature/main/more_view/widget/more_view_sign_out_dialog.dart';
import 'package:cafein_flutter/feature/review/registered_review/registered_review_page.dart';
import 'package:cafein_flutter/feature/terms/terms_detail_page.dart';
import 'package:cafein_flutter/feature/terms/terms_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/circle_profile_image.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreViewPage extends StatelessWidget {
  const MoreViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('********** MoreViewPage Build **********');

    final userData = context.watch<UserRepository>().getMemberData;

    return MultiBlocListener(
      listeners: [
        BlocListener<MoreViewBloc, MoreViewState>(
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
        ),
        BlocListener<MainBloc, MainState>(
          listenWhen: (pre, next) => next is MainNavigationSelected,
          listener: (context, state) {
            if (state is MainNavigationSelected && state.index == 3) {
              context.read<MoreViewBloc>().add(
                    const MoreViewCountRequested(),
                  );
            }
          },
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        appBar: AppBar(toolbarHeight: 44),
        body: RefreshIndicator(
          onRefresh: () async => context.read<MoreViewBloc>().add(
                const MoreViewCountRequested(),
              ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final bloc = context.read<MoreViewBloc>();
                      await Navigator.of(context).pushNamed(
                        EditProfilePage.routeName,
                      );

                      bloc.add(const MoreViewProfileChanged());
                    },
                    child: BlocBuilder<MoreViewBloc, MoreViewState>(
                      buildWhen: (pre, next) => next is MoreViewProfileEdited,
                      builder: (context, state) {
                        String userName = userData?.nickname ?? '';
                        String? imageUrl = userData?.imageIdPair?.imageUrl;
                        if (state is MoreViewProfileEdited) {
                          userName = context
                                  .watch<UserRepository>()
                                  .getMemberData
                                  ?.nickname ??
                              '';
                          imageUrl = context
                              .watch<UserRepository>()
                              .getMemberData
                              ?.imageIdPair
                              ?.imageUrl;
                        }
                        return Row(
                          children: [
                            CircleProfileImage(
                              imageUrl: imageUrl,
                              radius: 28,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  style: AppStyle.subTitle17SemiBold,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '카페인 ${DateTime.now().difference(
                                        DateTime.parse(userData!.joinDateTime),
                                      ).inDays}일차',
                                  style: AppStyle.caption13Regular.copyWith(
                                    color: AppColor.grey400,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            loadAsset(
                              AppIcon.right,
                              color: AppColor.grey400,
                              width: 16,
                              height: 16,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 74,
                    width: double.infinity,
                    child: BlocBuilder<MoreViewBloc, MoreViewState>(
                      buildWhen: (pre, next) =>
                          next is MoreViewStoreCntAndReviewCntLoaded,
                      builder: (context, state) {
                        if (state is MoreViewStoreCntAndReviewCntLoaded) {
                          return InkWell(
                            onTap: () => Navigator.of(context).pushNamed(
                              RegisteredReviewPage.routeName,
                            ),
                            child: MoreViewCountCard(
                              title: '작성한 리뷰',
                              value: state.reviewCount,
                            ),
                          );
                        }

                        return const CustomCircleLoadingIndicator();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 1,
                    color: AppColor.grey100,
                  ),
                  const SizedBox(height: 12),
                  MoreViewMenuCard(
                    title: '연결된 계정',
                    isAuthProvider: true,
                    trailingWidget: Text(
                      '${context.watch<AppRepository>().getAuthProvider()}',
                      style: AppStyle.body14Regular.copyWith(
                        color: AppColor.grey400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 1,
                    color: AppColor.grey100,
                  ),
                  const SizedBox(height: 12),
                  MoreViewMenuCard(
                    title: '공지사항',
                    onTab: () => Navigator.of(context).pushNamed(
                      NoticePage.routeName,
                    ),
                  ),
                  MoreViewMenuCard(
                    title: '자주 묻는 질문',
                    onTab: () => Navigator.of(context).pushNamed(
                      FaqPage.routeName,
                    ),
                  ),
                  MoreViewMenuCard(
                    title: '서비스 이용 약관',
                    onTab: () => Navigator.of(context).pushNamed(
                      TermsDetailPage.routeName,
                      arguments: '이용약관',
                    ),
                  ),
                  MoreViewMenuCard(
                    title: '개인정보 처리방침',
                    // onTab: () => Navigator.of(context).pushNamed(
                    //   TermsDetailPage.routeName,
                    //   arguments: '개인정보 처리방침',
                    // ),
                    onTab: () => Navigator.of(context).pushNamed(
                      TermsPage.routeName,
                    ),
                  ),
                  MoreViewMenuCard(
                    title: '버전 정보',
                    trailingWidget: Text(
                      CafeinConfig.packageInfo.version,
                      style: AppStyle.body14Regular.copyWith(
                        color: AppColor.grey400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 1,
                    color: AppColor.grey100,
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
                    color: AppColor.grey100,
                  ),
                  BlocBuilder<MoreViewBloc, MoreViewState>(
                    buildWhen: (pre, next) =>
                        next is MoreViewStoreCntAndReviewCntLoaded,
                    builder: (context, state) {
                      return InkWell(
                        onTap: state is! MoreViewStoreCntAndReviewCntLoaded
                            ? null
                            : () => Navigator.of(context).pushNamed(
                                  SignOffPage.routeName,
                                  arguments: MoreViewCountResponse(
                                    storeCnt: state.storeCount,
                                    reviewCnt: state.reviewCount,
                                  ),
                                ),
                        child: SizedBox(
                          height: 56,
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
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
