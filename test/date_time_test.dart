// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('시간 테스트', () {
    // final dateTime = DateTime(2022, 12, 2);
    final dateTime = DateTime.parse('11.09');

    final now = DateTime.now();

    int difSecond = now.difference(dateTime).inSeconds;

    print(difSecond);

    if (difSecond < 60) {
      print('$difSecond초전');
    }

    difSecond = difSecond ~/ 60;

    if (difSecond < 60) {
      print('$difSecond분전');
    }

    difSecond = difSecond ~/ 60;

    if (difSecond < 24) {
      print('$difSecond시간전');
    }

    print('그냥 출력');
  });
}
