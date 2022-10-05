import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestLocationCard extends StatelessWidget {
  const RequestLocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        const BoxDecoration(color: AppColor.orange50, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Center(
                        child: loadAsset(AppIcon.locationLOrange,
                            height: 32 * heightPercent, width: 32 * widthPercent),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "원하시는 카페가 없나요? 위치 접근을\n허용하시면 근처 카페를 추천해드릴게요",
                      style: AppStyle.subTitle14Medium.copyWith(color: AppColor.grey700),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: InkWell(
                      onTap: () => openAppSettings(),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColor.orange400,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                          child: Text(
                            "위치 접근 설정",
                            style: AppStyle.subTitle14Medium.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
