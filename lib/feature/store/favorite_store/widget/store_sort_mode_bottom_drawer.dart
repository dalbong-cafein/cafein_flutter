import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreSortModeBottomDrawer extends StatelessWidget {
  const StoreSortModeBottomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 208,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 20, top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: InkWell(
                onTap: (){

                },
                child: Row(
                  children: [
                    Text(
                      "등록순",
                      style: AppStyle.subTitle15Medium
                          .copyWith(color: AppColor.orange500),
                    ),
                    const Spacer(),
                    loadAsset(AppIcon.doneOn, width: 24, height: 24)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: (){

                },
                child: Row(
                  children: [
                    Text(
                      "등록순",
                      style: AppStyle.subTitle15Medium
                          .copyWith(color: AppColor.orange500),
                    ),
                    const Spacer(),
                    loadAsset(AppIcon.doneOn, width: 24, height: 24)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: (){

                },
                child: Row(
                  children: [
                    Text(
                      "등록순",
                      style: AppStyle.subTitle15Medium
                          .copyWith(color: AppColor.orange500),
                    ),
                    const Spacer(),
                    loadAsset(AppIcon.doneOn, width: 24, height: 24)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
