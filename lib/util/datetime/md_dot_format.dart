import 'package:intl/intl.dart';

String mdDotFormatShort(String dateTime) {
  final time = DateTime.parse(dateTime);
  return DateFormat('MM.dd').format(time);
}
