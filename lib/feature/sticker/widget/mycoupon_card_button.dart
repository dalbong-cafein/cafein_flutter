import 'package:cafein_flutter/resource/resource.dart';
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
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "받은 쿠폰을 확인해보세요",
                    style: AppStyle.subTitle16Medium,
                  ),
                ),
              ),
              SizedBox(
                width: width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.grey400,
                          size: 16
                      ),
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
