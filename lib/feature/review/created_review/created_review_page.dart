import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CreatedReviewPage extends StatelessWidget {
  const CreatedReviewPage({Key? key}) : super(key: key);

  static const routeName = 'CreatedReviewPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "리뷰 작성",
          style: AppStyle.subTitle16Medium,
        ),
      ),
      body: Center(
        child: Text('리뷰 생성 페이지'),
      ),
    );
  }
}
