import 'package:intl/intl.dart';

String ymdDotFormat(String dateTime) {
  final time = DateTime.parse(dateTime);
  return DateFormat('yyyy.MM.dd').format(time);
}
