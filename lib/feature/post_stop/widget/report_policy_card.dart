import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class ReportPolicyCard extends StatelessWidget {
  const ReportPolicyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: AppColor.grey50),
        width: width - 32,
        child: Column(
          children: [
            _reportPolicyText("hello")
          ],
        ),
      ),
    );
  }

  Widget _reportPolicyText(String text) {
    return Text(
      text,
      style:
          AppStyle.body14Regular.copyWith(color: AppColor.grey800, height: 1.5),
    );
  }
}
