import 'dart:async';

import 'package:cafein_flutter/feature/certify_phone/bloc/certify_code_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> with WidgetsBindingObserver {
  TimerBloc({
    required this.certifyCodeBloc,
  }) : super(const TimerInitial()) {
    WidgetsBinding.instance.addObserver(this);
    on<TimerTicked>(_onTimerTicked);
    on<TimerCanceled>(_onTimerCanceled);
    on<TimerStarted>(_onTimerStarted);

    certifyCodeBlocStream = certifyCodeBloc.stream.listen(
      (state) {
        if (state is CertifyCodeLoaded) {
          isLoaded = true;
          add(const TimerStarted(startDuration: 180));
        }
      },
    );
  }

  final CertifyCodeBloc certifyCodeBloc;
  late final StreamSubscription<CertifyCodeState> certifyCodeBlocStream;
  bool isLoaded = false;

  StreamSubscription<int>? timerStream;

  DateTime outDateTime = DateTime.now().add(
    const Duration(seconds: 180),
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (!isLoaded) {
          break;
        }
        final currentTime = outDateTime
            .difference(
              DateTime.now(),
            )
            .inSeconds;
        if (currentTime <= 0) {
          add(const TimerCanceled());
        }
        add(TimerTicked(duration: currentTime));
        timerStream = Stream<int>.periodic(
          const Duration(seconds: 1),
          (x) => currentTime - x - 1,
        ).take(currentTime).listen(
              (event) => add(TimerTicked(duration: event)),
              onDone: () => add(const TimerCanceled()),
            );
        break;
      default:
        timerStream?.cancel();
        break;
    }
  }

  @override
  Future<void> close() {
    certifyCodeBlocStream.cancel();
    timerStream?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  FutureOr<void> _onTimerStarted(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) {
    outDateTime = DateTime.now().add(
      Duration(seconds: event.startDuration),
    );
    timerStream?.cancel();
    emit(TimerRun(duration: event.startDuration));
    timerStream = Stream<int>.periodic(
      const Duration(seconds: 1),
      (x) => event.startDuration - x - 1,
    ).take(event.startDuration).listen(
          (event) => add(TimerTicked(duration: event)),
          onDone: () => add(const TimerCanceled()),
        );
  }

  FutureOr<void> _onTimerTicked(
    TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    emit(TimerRun(duration: event.duration));
  }

  FutureOr<void> _onTimerCanceled(
    TimerCanceled event,
    Emitter<TimerState> emit,
  ) {
    isLoaded = false;
    emit(const TimerEnded());
  }
}
