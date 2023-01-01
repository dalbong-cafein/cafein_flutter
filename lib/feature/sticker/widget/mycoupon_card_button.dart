import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class MyCouponCardButton extends StatelessWidget {
  const MyCouponCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            height: 10,
            color: AppColor.grey50
        )
        , Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          child: Row(
            children: [
              SizedBox(
                width: width / 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "받은 쿠폰 내역",
                    style: AppStyle.subTitle16Medium.copyWith(
                      height: 1
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: loadAsset(
                        AppIcon.rightS,
                        color : AppColor.grey400,
                        width: 16,
                        height: 16
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
