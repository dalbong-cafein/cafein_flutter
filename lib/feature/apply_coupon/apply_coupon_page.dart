import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class ApplyCouponPage extends StatelessWidget {
  const ApplyCouponPage({Key? key}) : super(key: key);
  static const routeName = 'ApplyCouponPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "쿠폰 신청",
          style: AppStyle.subTitle16Medium,
        ),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 158 / 240,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (BuildContext context , int index){
              return Padding(
                padding: index % 2 == 0 ?
                const EdgeInsets.only( left : 16) : const EdgeInsets.only(right: 16),
                child: Container(
                  height: 240,
                  decoration: BoxDecoration(
                    color : AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left :12, right: 12, top: 12 , bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        loadAsset(
                            CafeinConst.couponStoreImages[index]
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            loadAsset(
                              CafeinConst.couponStoreIcons[index],
                              height: 16,
                              width: 16
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              CafeinConst.couponStoreNames[index],
                              style: AppStyle.caption12Regular.copyWith(
                                color: AppColor.grey600
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          CafeinConst.couponItemNames[index],
                          style: AppStyle.subTitle15Bold,
                        )

                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
