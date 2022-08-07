import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/store_additional_information_row.dart';
import 'package:flutter/material.dart';

class SearchStoreCard extends StatelessWidget {
  const SearchStoreCard({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                store.storeName,
                style: AppStyle.subTitle16SemiBold,
              ),
              const Icon(
                Icons.favorite_outline,
                size: 32,
                color: AppColor.grey300,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 18,
                width: 37,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.orange500),
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.white,
                ),
                child: Center(
                  child: Text(
                    '영업중',
                    style: AppStyle.caption11Regular.copyWith(
                      color: AppColor.orange500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              ConfuseChip(
                confuseScore: store.congestionScoreAvg,
                height: 18,
                width: 29,
                textStyle: AppStyle.caption12Medium,
              ),
            ],
          ),
          const SizedBox(height: 4),
          StoreAdditionalInformationRow(
            textStyle: AppStyle.caption12Regular,
            distance: 150,
            recommendScore: store.recommendPercent?.toInt() ?? 0,
            likeCount: store.heartCnt,
            iconSize: 20,
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Image.network(
                  'https://avatars.githubusercontent.com/u/73538957?v=4',
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 6),
            ),
          ),
        ],
      ),
    );
  }
}
