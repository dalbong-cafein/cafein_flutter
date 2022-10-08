import 'package:flutter/material.dart';

class StickerCountDialog extends StatelessWidget {
  const StickerCountDialog({Key? key}) : super(key: key);

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const StickerCountDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
