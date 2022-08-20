import 'package:flutter/material.dart';

class SignOffPage extends StatelessWidget {
  const SignOffPage({Key? key}) : super(key: key);

  static const routeName = 'SignOffPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('탈퇴하기'),
      ),
    );
  }
}
