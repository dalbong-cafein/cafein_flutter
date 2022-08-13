import 'package:flutter/material.dart';

class StickerPage extends StatelessWidget {
  const StickerPage({Key? key}) : super(key: key);

  static const routeName = 'StickerPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('스티커 페이지'),
      ),
    );
  }
}
