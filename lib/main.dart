import 'package:cafein_flutter/cafein_app.dart';
import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/firebase_config.dart';
import 'package:cafein_flutter/util/logger/custom_bloc_observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseConfig.init();

  FlutterError.onError = crashlytics.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true,
    );

    return true;
  };

  await CafeinConfig.initializeApp();

  CafeinConst.initConst();

  Bloc.observer = CustomBlocObserver();

  runApp(
    const CafeinApp(),
  );
}
