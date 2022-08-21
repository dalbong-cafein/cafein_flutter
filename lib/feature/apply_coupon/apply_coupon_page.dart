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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              return Container(
                height: 240,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left :12, right: 12, top: 12 , bottom: 16),
                  child: Column(
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
                      )

                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
