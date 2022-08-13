import 'package:cafein_flutter/resource/resource.dart';
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
          padding: const EdgeInsets.only(left : 38, right : 38, top : 28),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 36,
              ),
              itemBuilder: (BuildContext context, int index){
                return Container(
                  width : 44,
                  height: 44,
                  decoration: BoxDecoration(
                      color: AppColor.grey50,
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1,
                          color : AppColor.grey100
                      ),
                  ),
                  child: const Center(
                    child: Center(
                      child: Icon(
                          Icons.question_mark_rounded,
                          color : AppColor.grey400
                      ),
                    ),
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
