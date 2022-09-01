import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CreatedReviewPage extends StatelessWidget {
  const CreatedReviewPage({Key? key}) : super(key: key);

  static const routeName = 'CreatedReviewPage';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "리뷰 작성",
            style: AppStyle.subTitle16Medium,
          ),
        ),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 72,
                  height: 72,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48),
                      child: Image.network(
                        "https://avatars.githubusercontent.com/u/73538957?v=4",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "엔제리너스 홍대점",
                  style: AppStyle.caption12Regular
                      .copyWith(color: AppColor.grey600),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "카공 카페로 어떤가요?",
                  style: AppStyle.subTitle17SemiBold,
                )
              ],
            ),
          ),
        ));
  }
}
