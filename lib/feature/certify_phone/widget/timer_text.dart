import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.duration,
  });

  final int duration;

  @override
  Widget build(BuildContext context) {
    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: AppStyle.subTitle3Medium.copyWith(
        color: AppColor.grey400,
      ),
    );
  }
}
