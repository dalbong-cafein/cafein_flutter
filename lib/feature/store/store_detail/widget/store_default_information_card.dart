import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class StoreDefaultInformationCard extends StatelessWidget {
  const StoreDefaultInformationCard({
    super.key,
    required this.storeDetail,
  });

  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '기본 정보',
            style: AppStyle.subTitle17SemiBold,
          ),
          const SizedBox(height: 16),
          Container(
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              loadAsset(
                AppIcon.clock,
                color: AppColor.grey400,
              ),
              const SizedBox(width: 8),
              Text(
                (storeDetail.businessInfo.isOpen ?? false) ? '영업 중' : '영업 종료',
                style: (storeDetail.businessInfo.isOpen ?? false)
                    ? AppStyle.subTitle14Medium.copyWith(
                        color: AppColor.orange500,
                      )
                    : AppStyle.subTitle14Medium.copyWith(
                        color: AppColor.grey500,
                      ),
              ),
              const SizedBox(width: 4),
              const Text(
                '오후 11:30에 영업 종료',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              loadAsset(
                AppIcon.call,
                color: AppColor.grey400,
              ),
              const SizedBox(width: 8),
              Text(
                storeDetail.phone ?? '',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              loadAsset(
                AppIcon.world,
                color: AppColor.grey400,
              ),
              const SizedBox(width: 8),
              Text(
                storeDetail.website ?? '',
                style: AppStyle.body14Regular,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 1,
            color: AppColor.grey50,
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '잘못된 정보가 있다면 알려주세요',
                style: AppStyle.caption13Regular.copyWith(
                  color: AppColor.grey600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '마지막 수정일 ${ymdDotFormat(storeDetail.modDateTime)}',
                style: AppStyle.caption11Regular.copyWith(
                  color: AppColor.grey500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
