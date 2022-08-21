import 'package:intl/intl.dart';

String ymdDotFormat(String dateTime) {
  final time = DateTime.parse(dateTime);
  return DateFormat('yyyy.MM.dd').format(time);
}

String ymdDotFormatShort(String dateTime) {
  final time = DateTime.parse(dateTime);
  return DateFormat('yy.MM.dd').format(time);
}
