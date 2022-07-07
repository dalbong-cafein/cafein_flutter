import 'package:flutter/material.dart';

class CafeinApp extends StatelessWidget {
  const CafeinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Cafein Button'),
          ),
        ),
      ),
    );
  }
}
