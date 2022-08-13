import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStickerCard extends StatelessWidget {
  const MyStickerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left : 20),
              child: Text(
                  "내가 모은 스티커",
                style: AppStyle.subTitle17SemiBold,
              ),
            ),
            const SizedBox(
              width :6
            ),
            Text(
                "0",
              style: AppStyle.subTitle17SemiBold.copyWith(
                color : AppColor.orange500
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left : 30, right : 30, bottom: 24, top : 16),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 36,
                  crossAxisSpacing: 18,
              ),
              itemBuilder: (BuildContext context, int index){
                return Container(
                  width : 44,
                  height: 44,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
