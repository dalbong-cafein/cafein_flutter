import 'dart:developer';

import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final status = await Permission.locationWhenInUse.request();
            if (!status.isGranted) {
              final result = await PermissionDialog.show(context);
              if (result) {
                openAppSettings();
              }
            }
            log('$status');
          },
          child: const Text('위치권한'),
        ),
      ),
    );
  }
}
