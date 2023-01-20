import 'dart:io';

import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class OnboardCard extends StatelessWidget {
  const OnboardCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    String title = '';
    String subTitle = '';
    String imagePath = '';

    if (index == 0) {
      title = '카공할 카페 찾기';
      subTitle = '지도에서 원하는 지역에 있는\n카공 카페를 찾아요.';
      imagePath = Platform.isIOS ? AppImage.onboardAIOS : AppImage.onboardA;
    } else if (index == 1) {
      title = '카공 정보 확인하기';
      subTitle = '콘셉트, 와이파이, 테이블 등\n필요한 정보를 확인해요.';
      imagePath = Platform.isIOS ? AppImage.onboardBIOS : AppImage.onboardB;
    } else if (index == 2) {
      title = '자주 가는 나의 카페';
      subTitle = "자주 가는 카페는 ‘나의 카페’로 저장해\n혼잡도와 영업시간을 빠르게 확인해요";
      imagePath = Platform.isIOS ? AppImage.onboardCIOS : AppImage.onboardC;
    } else if (index == 3) {
      title = '더 넓어지는 카공 지도';
      subTitle = '새로운 카페의 정보와 후기를 공유하고\n스티커를 모아 커피 쿠폰을 받아요';
      imagePath = Platform.isIOS ? AppImage.onboardDIOS : AppImage.onboardD;
    }

    return Container(
      color: AppColor.grey50,
      height: 300,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 44),
            Text(
              title,
              style: AppStyle.title21Bold,
            ),
            const SizedBox(height: 16),
            Text(
              subTitle,
              style: AppStyle.body14Regular,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: index == 0 || index == 3 ? 48 : 32,
            ),
            loadAsset(
              imagePath,
              width: MediaQuery.of(context).size.width - 32,
            ),
          ],
        ),
      ),
    );
  }
}
