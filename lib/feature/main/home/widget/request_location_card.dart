import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestLocationCard extends StatelessWidget {
  const RequestLocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left : 16, right: 16),
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
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Center(
                      child: loadAsset(AppIcon.placeCircle,
                          height: 44,
                          width: 4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "카페를 찾고 있나요? 위치 접근을\n허용하시면 근처 카페를 추천해 드해릴게요",
                      style: AppStyle.subTitle14Medium
                          .copyWith(color: AppColor.grey700, height: 1.5),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => openAppSettings(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.orange400,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 10, bottom: 10),
                        child: Text(
                          "위치 접근 설정",
                          style: AppStyle.subTitle14Medium
                              .copyWith(color: Colors.white, height: 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
