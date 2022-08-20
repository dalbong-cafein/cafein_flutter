import 'package:flutter/material.dart';

class RegisteredReviewPage extends StatefulWidget {
  const RegisteredReviewPage({Key? key}) : super(key: key);

  static const routeName = 'RegisteredReviewPage';

  @override
  State<RegisteredReviewPage> createState() => _RegisteredReviewPageState();
}

class _RegisteredReviewPageState extends State<RegisteredReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('등록한 리뷰 페이지'),
      ),
    );
  }
}
