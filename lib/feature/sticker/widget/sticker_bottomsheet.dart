import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class StickerBottomSheet extends StatelessWidget {
  const StickerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return SizedBox(
      height: bottomPadding > 0 ? bottomPadding + 73 : 73,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container( height:1.0,
            width:width,
            color:AppColor.grey100,),
          Padding(
            padding: EdgeInsets.only(
              top: 8,
              bottom: bottomPadding > 0 ? bottomPadding + 14 : 14,
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width - 32,
                  decoration: const BoxDecoration(
                    color: AppColor.orange400,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text(
                        "쿠폰 신청하기",
                        style: AppStyle.subTitle15Medium.copyWith(
                          height: 1,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 11,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
