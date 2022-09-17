import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/resource/resource.dart';
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
              Text(
                '오후 11:30에 영업 종료',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
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
              Text(
                '오후 11:30에 영업 종료',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
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
              Text(
                '오후 11:30에 영업 종료',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    '마지막 수정일',
                    style: AppStyle.caption11Regular.copyWith(
                      color: AppColor.grey500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
                width: 80,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.grey800,
                    padding: EdgeInsets.zero,
                    backgroundColor: AppColor.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(
                        color: AppColor.grey400,
                      ),
                    ),
                    textStyle: AppStyle.subTitle14Medium,
                  ),
                  child: const Text('정보 수정'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
