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
      subTitle = '지도에서 검색을 통해\n원하는 지역의 카페를 찾아보세요.';
      imagePath = AppImage.onboardA;
    } else if (index == 1) {
      title = '카공 정보 확인하기';
      subTitle = '카페 상세페이지에서\n콘셉트 / 와이파이 / 테이블 등\n필요한 정보를 확인해 보세요.';
      imagePath = AppImage.onboardB;
    } else if (index == 2) {
      title = '자주 가는 나의 카페';
      subTitle = "단골 카공 카페는 하트를 눌러\n'나의 카페'에서 혼잡도와 영업시간을\n쉽게 확인해 보세요.";
      imagePath = AppImage.onboardC;
    } else if (index == 3) {
      title = '더 넓어지는 카공 지도';
      subTitle = '새로운 카페와 정보와 후기를 공휴하고\n스티커를 모아 아메리카노 쿠폰을 받아보세요.';
      imagePath = AppImage.onboardD;
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
