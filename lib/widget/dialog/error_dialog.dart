import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
  super.key,
  required this.isNetworkError,
  });

  final bool isNetworkError;

  static Future<void> show(
      BuildContext context, {
        required bool isNetworkError,
        required Function refresh,
      }) async {
    final result = await showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        isNetworkError: isNetworkError,
      ),
    );
    if (result == null) {
      return;
    }

    if (result == true) {
      refresh();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Center(
          child: Text(
            'ErrorDialog $isNetworkError',
          ),
        ),
      ),
    );
  }
}