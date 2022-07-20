import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    super.key,
  });

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const PermissionDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('권한 동의가 필요합니다'),
      content: const Text('기기 설정에서 권한 동의를 해주세요'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('설정으로 이동'),
        ),
      ],
    );
  }
}
