import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/received_coupons/received_coupons_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplyCouponFinished extends StatelessWidget {
  const ApplyCouponFinished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color : AppColor.white,
        child: Column(
          children: [
            const SizedBox(
              height: 221,
            ),
            const Text(
                "쿠폰 신청 완료",
              style: AppStyle.title25Bold,
            ),
            const SizedBox(
              height: 36,
            ),
            loadAsset(
              AppImage.couponPlus,
              height: 100,
              width: 156
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "쿠폰 발송은 신청일 이후 월요일에",
              style: AppStyle.body14Regular.copyWith(
                color : AppColor.grey600
              )
            ),
            Text(
                "휴대전화번호로 발송됩니다.",
                style: AppStyle.body14Regular.copyWith(
                    color : AppColor.grey600
                )
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 118,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){

                Navigator.of(context)
                    .pushNamed(MainPage.routeName);
              },
              child: Container(
                width: width - 32,
                decoration: const BoxDecoration(
                  color : AppColor.orange400,
                  borderRadius: BorderRadius.all(
                      Radius.circular(14.0)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Center(
                    child: Text(
                      "확인",
                      style: AppStyle.subTitle16Medium.copyWith(
                        color : AppColor.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context)
                    .pushNamed(ReceivedCouponsPage.routeName);
              },
              child: SizedBox(
                width: width - 32,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      "신청한 쿠폰 내역 보러가기",
                      style: AppStyle.subTitle15Medium
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
