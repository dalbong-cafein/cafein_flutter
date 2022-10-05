import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class StoreCongestionBottomSheet extends StatelessWidget {
  const StoreCongestionBottomSheet({
    super.key,
    required this.selectedDay,
  });

  final String selectedDay;

  static Future<String> show(
    BuildContext ctx, {
    required String selectedDay,
  }) async {
    final result = await showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (context) => StoreCongestionBottomSheet(
        selectedDay: selectedDay,
      ),
    );

    return result ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          children: List.generate(
            CafeinConst.krDays.length,
            (index) => InkWell(
              onTap: () => Navigator.of(context).pop(CafeinConst.krDays[index]),
              child: SizedBox(
                height: 56,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CafeinConst.krDays[index],
                        style: AppStyle.subTitle15Medium.copyWith(
                          color:
                              CafeinConst.krDays[index] == selectedDay ? AppColor.orange500 : null,
                        ),
                      ),
                      if (CafeinConst.krDays[index] == selectedDay)
                        loadAsset(
                          AppIcon.doneOn,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
