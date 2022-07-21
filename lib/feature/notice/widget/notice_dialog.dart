import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({Key? key}) : super(key: key);


  static Future<void> show (BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const NoticeDialog(
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;

    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(16.0)
          ),
        ),
        height: 160 * heightPercent,
        width: 300 * widthPercent,
        padding: const EdgeInsets.only(left :16, right: 16  , top : 30, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("알림을 모두 삭제하시겠어요?", style: TextStyle(fontSize: 16)),
            Padding(
              padding: EdgeInsets.only(top : 12 * heightPercent, bottom: 20 * heightPercent),
              child: const Text("삭제된 알림은 다시 확인할 수 없습니다.",style: TextStyle(fontSize: 14)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    width : 130 * widthPercent,
                    height: 44 * heightPercent,

                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color : AppColor.grey400
                      ),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(12.0)
                      ),
                    ),

                    child: const Center(child: Text("취소"),),
                  ),
                ),
                Container(
                  width : 130 * widthPercent,
                  height: 44 * heightPercent,

                  decoration: const BoxDecoration(
                    color : AppColor.orange500,
                    borderRadius: BorderRadius.all(
                        Radius.circular(12.0)
                    ),
                  ),

                  child: const Center(child: Text("삭제"),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
