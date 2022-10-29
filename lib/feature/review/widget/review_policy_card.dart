import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class ReviewPolicyCard extends StatelessWidget {
  const ReviewPolicyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grey50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "안내 사항",
              style: AppStyle.subTitle15Medium.copyWith(
                color: AppColor.grey400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "리뷰는 삭제 불가하며, 리뷰 작성일로부터 3일 이내에 수정할 수 있습니다.\n카페인은 리뷰 검수 모니터링을 통해 부적절한 리뷰를 작성자에게 사전 안내 없이 페널티 적용과 함께 리뷰를 삭제할 수 있습니다.",
              style: AppStyle.caption13Regular.copyWith(
                color: AppColor.grey400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
