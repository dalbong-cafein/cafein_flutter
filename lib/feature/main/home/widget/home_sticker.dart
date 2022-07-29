import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeSticker extends StatelessWidget {
  const HomeSticker ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;

    return Padding(
      padding: const EdgeInsets.only(left : 16 , right : 16),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(16.0)
          ),
          color : Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(top : 18, bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width : (width - 32) * 0.8,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left : 16),
                      child: Container(
                        width: 44 * widthPercent,
                        height: 44 * heightPercent,
                        decoration: const BoxDecoration(
                          color: AppColor.orange100,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: loadAsset(AppImage.sticker, width : 40 * widthPercent, height : 26 * heightPercent )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("내가 모은 스티커", style: AppStyle.subTitle14Medium),
                              Padding(
                                padding: const EdgeInsets.only(left : 6.0),
                                child: Text("12", style: AppStyle.subTitle14Medium.copyWith(color : AppColor.orange500, fontWeight: FontWeight.w800,),),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :14),
                            child: Row(
                              children: [
                                LinearPercentIndicator(
                                  padding: const EdgeInsets.all(0),
                                  animation: true,
                                  animationDuration: 2000,
                                  barRadius: Radius.elliptical(20, 20),
                                  percent: 12 / 20,
                                  lineHeight: 6 * heightPercent,
                                  width: 120 * widthPercent,
                                  backgroundColor: AppColor.orange50 ,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: AppColor.orange400,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left : 8),
                                  child: Text("20개"),
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(
                width : (width - 32) * 0.2,
                child: Padding(
                  padding: const EdgeInsets.only(right : 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded, color : AppColor.grey400)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
