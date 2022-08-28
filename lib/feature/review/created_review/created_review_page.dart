import 'package:flutter/material.dart';

class CreatedReviewPage extends StatelessWidget {
  const CreatedReviewPage({Key? key}) : super(key: key);

  static const routeName = 'CreatedReviewPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('리뷰 생성 페이지'),
      ),
    );
  }
}
