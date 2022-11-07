import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class StickerBottomSheet extends StatelessWidget {
  const StickerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return SizedBox(
      height: bottomPadding > 0 ? bottomPadding + 72 : 72,
      child: Padding(
        padding: EdgeInsets.only(
          top: 8,
          bottom: bottomPadding > 0 ? bottomPadding + 14 : 14,
          left: 16,
        ),
        child: Container(
          width: width - 32,
          decoration: const BoxDecoration(
            color: AppColor.orange400,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: Center(
            child: Text(
              "쿠폰 신청하기",
              style: AppStyle.subTitle15Medium.copyWith(
                color: AppColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
