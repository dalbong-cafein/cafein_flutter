import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NotificaionPage extends StatelessWidget {
  const NotificaionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MainBottomNavigationBar(),
      body: Center(
        child: Text('NotificationPage'),
      ),
    );
  }
}
