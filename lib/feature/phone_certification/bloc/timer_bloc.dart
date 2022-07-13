import 'dart:async';

import 'package:cafein_flutter/feature/phone_certification/bloc/phone_certification_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> with WidgetsBindingObserver {
  TimerBloc({
    required this.phoneCertificationBloc,
  }) : super(const TimerInitial()) {
    WidgetsBinding.instance.addObserver(this);
    on<TimerTicked>(_onTimerTicked);
    on<TimerCanceled>(_onTimerCanceled);
    on<TimerStarted>(_onTimerStarted);

    phoneCertificationBlocStream = phoneCertificationBloc.stream.listen(
      (state) {
        if (state is PhoneCertificationLoaded) {
          add(const TimerStarted(startDuration: 180));
        }
      },
    );
  }

  final PhoneCertificationBloc phoneCertificationBloc;
  late final StreamSubscription<PhoneCertificationState> phoneCertificationBlocStream;

  StreamSubscription<int>? timerStream;

  DateTime outDateTime = DateTime.now().add(
    const Duration(seconds: 300),
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
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
    phoneCertificationBlocStream.cancel();
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
    emit(const TimerEnded());
  }
}
