import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/store/registered_store.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:flutter/material.dart';

class RegisteredStoreCard extends StatelessWidget {
  const RegisteredStoreCard({
    Key? key,
    required this.store,
    required this.index,
  }) : super(key: key);

  final RegisteredStore store;
  final int index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 80,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: CustomCachedNetworkImage(
                imageUrl: store.imageIdPair?.imageUrl ?? CafeinConst.defaultStoreImage,
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  store.storeName,
                  style: AppStyle.subTitle15Medium,
                ),
                Row(
                  children: [
                    OpenCloseChip(
                      isOpen: store.businessInfo.isOpen ?? false,
                    ),
                    const SizedBox(width: 4),
                    const ConfuseChip(
                      width: 29,
                      height: 18,
                      textStyle: AppStyle.caption11Regular,
                    ),
                  ],
                ),
                Text(
                  '작성일 ${ymdDotFormat(store.registeredDateTime)}',
                  style: AppStyle.caption12Regular.copyWith(
                    color: AppColor.grey600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 30,
              width: 76,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.grey800,
                  backgroundColor: AppColor.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColor.grey400,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                child: const Text('정보 수정'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
