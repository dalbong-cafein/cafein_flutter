import 'package:cafein_flutter/util/datetime/md_dot_format.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';

extension StringX on String {
  String get textTime {
    final dateTime = DateTime.parse(this);

    final now = DateTime.now();

    int difSecond = now.difference(dateTime).inSeconds;

    if (difSecond < 10) {
      return '방금 전';
    }

    if (difSecond < 60) {
      return '$difSecond초 전';
    }

    difSecond = difSecond ~/ 60;

    if (difSecond < 60) {
      return '$difSecond분 전';
    }

    difSecond = difSecond ~/ 60;

    if (difSecond < 24) {
      return '$difSecond시간 전';
    }

    return ymdDotFormatShort(this);
  }

  String get textTimeMD {
    final dateTime = DateTime.parse(this);

    final now = DateTime.now();

    int difSecond = now.difference(dateTime).inSeconds;

    if (difSecond < 10) {
      return '방금 전';
    }

    if (difSecond < 60) {
      return '$difSecond초 전';
    }

    difSecond = difSecond ~/ 60;

    if (difSecond < 60) {
      return '$difSecond분 전';
    }

    difSecond = difSecond ~/ 60;

    if (difSecond < 24) {
      return '$difSecond시간 전';
    }

    return mdDotFormatShort(this);
  }
}
