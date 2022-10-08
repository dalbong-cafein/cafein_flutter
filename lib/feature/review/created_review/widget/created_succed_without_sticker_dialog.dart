import 'package:flutter/material.dart';

class CreatedSucceedWithoutStickerDialog extends StatelessWidget {
  const CreatedSucceedWithoutStickerDialog({Key? key}) : super(key: key);

  static Future<void> show(
    BuildContext context,
  ) =>
      showDialog(
        context: context,
        builder: (context) => const CreatedSucceedWithoutStickerDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
