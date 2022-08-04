import 'package:cafein_flutter/data/model/sticker/sticker.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/home/widget/mystores_card.dart';
import 'package:cafein_flutter/feature/main/home/widget/request_location_card.dart';
import 'package:cafein_flutter/feature/main/home/widget/recommend_stores_card.dart';
import 'package:cafein_flutter/feature/main/home/widget/sticker_card.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;
    context.read<HomeBloc>().add(HomeMemberProfileRequested());
    return Scaffold(
      backgroundColor: AppColor.grey50,
      appBar: AppBar(
        backgroundColor: AppColor.grey50,
        title: const Padding(
          padding: EdgeInsets.only(left : 20),
          child: Text(
            "나의 카페",
            style: AppStyle.title18Bold,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(left : 221 * widthPercent, right: 20 * widthPercent),
            child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state is HomeMemberProfileLoaded){
                if(state.member.imageIdPair == null){
                  return const CircleAvatar(
                    radius: 20, // Image radius
                    backgroundImage: AssetImage(AppImage.profile1),
                  );
                }
                else{

                  return CircleAvatar(
                    radius: 20, // Image radius
                    //TODO 이미지 연결이 안됨ㅠ
                    backgroundImage: NetworkImage(state.member.imageIdPair!.imageUrl!.substring(7, state.member.imageIdPair!.imageUrl!.length)),
                  );
                }
              }else{
                return const CircleAvatar(
                  radius: 20, // Image radius
                  backgroundImage: AssetImage(AppImage.profile1),
                  );
                }
              },
            )
          )
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left : 16 , right: 16, top : 16),
              child: Container(
                width : 328 * widthPercent,
                decoration: const BoxDecoration(
                  color: AppColor.orange400,
                  borderRadius: BorderRadius.all(
                      Radius.circular(16.0)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left : 32, top : 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "친구 초대하고",
                        style: AppStyle.subTitle14Medium.copyWith(
                            color : Colors.white
                        ),
                      ),
                      Text(
                          "무료 아메리카노 받자",
                          style:AppStyle.subTitle14Medium.copyWith(
                              color : Colors.white
                          )
                      )
                    ],
                  ),
                ),

              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top : 16),
              child: StickerCard(),
            ),
            const Padding(
              padding: EdgeInsets.only(top : 16),
              child: MyStoresCard(),
            ),
            const RequestLocationCard(),
            const RecommendStoresCard()

          ],
        ),
      )
    );
  }
}
