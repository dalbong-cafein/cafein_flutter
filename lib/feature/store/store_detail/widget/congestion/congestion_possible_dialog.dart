import 'package:flutter/material.dart';

class CongestionPossibleDialog extends StatelessWidget {
  const CongestionPossibleDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const CongestionPossibleDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
