import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class ReceivedCouponsPage extends StatelessWidget {
  const ReceivedCouponsPage({Key? key}) : super(key: key);
  static const routeName = 'ReceivedCouponsPage';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "받은 쿠폰",
            style: AppStyle.subTitle16Medium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 2 / 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "06.04",
                              style: AppStyle.body14Regular,
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "아이스카페 아메리카노",
                              style: AppStyle.subTitle15Medium,
                            ),
                            Text(
                              "스벅",
                              style: AppStyle.caption13Regular
                                  .copyWith(color: AppColor.grey400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 1 / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14, right: 20),
                        child: isSend(false),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ));
  }

  Widget isSend(bool isSend) {
    if (isSend) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.grey50,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(
            "전송 완료",
            style: AppStyle.caption13Medium.copyWith(
                color: AppColor.grey400
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.orange50,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(
            "신청 완료",
            style: AppStyle.caption13Medium.copyWith(
                color: AppColor.orange500
            ),
          ),
        ),
      );;
    }
  }
}
