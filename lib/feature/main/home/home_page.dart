import 'dart:math';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/home/widget/mystores_card.dart';
import 'package:cafein_flutter/feature/main/home/widget/recommend_stores_card.dart';
import 'package:cafein_flutter/feature/main/home/widget/sticker_card.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/report/report_page.dart';
import 'package:cafein_flutter/feature/review/created_review/created_review_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final widthPercent = width / 360;
    final memberData = context.watch<UserRepository>().getMemberData;

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.grey50,
        appBar: AppBar(
          backgroundColor: AppColor.grey50,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: () {
                //TODO Inkwell 없애야함, 테스트용
                Navigator.of(context).pushNamed(ReportPage.routeName);
              },
              child: loadAsset(
                AppImage.cafeinLogo,
                color: AppColor.grey500,
                width: 100,
              ),
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
              ),
              child: SizedBox(
                width: 32,
                height: 32,
                child: memberData?.imageIdPair?.imageUrl == null
                    ? CircleAvatar(
                        child: loadAsset(
                          CafeinConst.defaultProfiles[Random().nextInt(2)],
                          width: 32,
                          height: 32,
                        ),
                      )
                    : CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            memberData?.imageIdPair?.imageUrl ?? 'url'),
                      ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const MainBottomNavigationBar(),
        body: RefreshIndicator(
          onRefresh: () async => context.read<HomeBloc>().add(
                const HomeRequested(),
              ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: InkWell(
                        //TODO inkwell 없애야함
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(CreatedReviewPage.routeName);
                        },
                        child: Container(
                          width: 328 * widthPercent,
                          decoration: const BoxDecoration(
                            color: AppColor.orange400,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 32, top: 12, bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "친구 초대하고",
                                  style: AppStyle.subTitle14Medium.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "무료 아메리카노 받자",
                                  style: AppStyle.subTitle14Medium.copyWith(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const StickerCard(),
                    const SizedBox(
                      height: 16,
                    ),
                    const MyStoresCard(),
                    const SizedBox(
                      height: 32,
                    ),
                    const RecommendStoresCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
