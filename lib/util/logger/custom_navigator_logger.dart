import 'dart:developer';

import 'package:flutter/material.dart';

class CustomNavigatorLogger extends NavigatorObserver {
  @override
  void didPush(route, previousRoute) {
    super.didPush(route, previousRoute);
    log('didPush: ${previousRoute?.settings.name} --> ${route.settings.name}');
  }

  @override
  void didPop(route, previousRoute) {
    super.didPop(route, previousRoute);
    log('didPop: ${previousRoute?.settings.name} --> ${route.settings.name}');
  }

  @override
  void didRemove(route, previousRoute) {
    super.didRemove(route, previousRoute);
    log('didRemove: ${previousRoute?.settings.name} --> ${route.settings.name}');
  }
}
