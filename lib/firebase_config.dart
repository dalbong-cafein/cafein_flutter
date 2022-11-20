import 'package:cafein_flutter/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

final analytics = FirebaseAnalytics.instance;
final crashlytics = FirebaseCrashlytics.instance;

abstract class FirebaseConfig {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await analytics.setAnalyticsCollectionEnabled(!kDebugMode);
    await crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }
}
