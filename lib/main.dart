import 'package:cafein_flutter/cafein_app.dart';
import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/util/logger/custom_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CafeinConfig.initializeApp();
  CafeinConst.initConst();

  BlocOverrides.runZoned(
    () => runApp(
      const CafeinApp(),
    ),
    blocObserver: CustomBlocObserver(),
  );
}
