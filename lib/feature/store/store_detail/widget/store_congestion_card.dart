import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class StoreCongestionCard extends StatelessWidget {
  const StoreCongestionCard({
    super.key,
    required this.congestionResponse,
  });

  final CongestionResponse congestionResponse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text(
              '혼잡도',
              style: AppStyle.subTitle17SemiBold,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 36,
                  width: 88,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColor.grey800,
                      backgroundColor: AppColor.white,
                      textStyle: AppStyle.subTitle14Medium,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        side: BorderSide(
                          color: AppColor.grey300,
                        ),
                      ),
                    ),
                    child: Text('월요일'),
                  ),
                ),
                SizedBox(
                  height: 36,
                  width: 116,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      textStyle: AppStyle.subTitle14Medium,
                    ),
                    child: const Text('혼잡도 알려주기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
