import 'package:cafein_flutter/feature/main/home/widget/home_mycafe.dart';
import 'package:cafein_flutter/feature/main/home/widget/home_noauth.dart';
import 'package:cafein_flutter/feature/main/home/widget/home_sticker.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F6F6),
        title: Padding(
          padding: EdgeInsets.only(left : 20 * widthPercent),
          child: const Text("나의 카페",style: AppStyle.title18Bold,),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(left : 221 * widthPercent, right: 20 * widthPercent),
            child: const CircleAvatar(
              radius: 20, // Image radius
              backgroundImage: NetworkImage('https://googleflutter.com/sample_image.jpg'),
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
                      Text("친구 초대하고",style: AppStyle.subTitle14Medium.copyWith(color : Colors.white),), //TODO 흰색 글꼴
                      Text("무료 아메리카노 받자", style:AppStyle.subTitle14Medium.copyWith(color : Colors.white))
                    ],
                  ),
                ),

              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top : 16),
              child: HomeSticker(),
            ),
            const Padding(
              padding: EdgeInsets.only(top : 16),
              child: HomeMyCafe(),
            ),
            const HomeNoAuth(),

          ],
        ),
      )
    );
  }
}
