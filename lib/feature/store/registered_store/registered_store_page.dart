import 'package:flutter/material.dart';

class RegisteredStorePage extends StatefulWidget {
  const RegisteredStorePage({Key? key}) : super(key: key);

  static const routeName = 'RegisteredStorePage';

  @override
  State<RegisteredStorePage> createState() => _RegisteredStorePageState();
}

class _RegisteredStorePageState extends State<RegisteredStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('등록한 카페 페이지'),
      ),
    );
  }
}
