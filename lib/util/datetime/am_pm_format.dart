String amPmFormat(String time) {
  final hour = int.parse(time.split(':').first);

  if (hour == 0) {
    return '오전 $time';
  } else if (hour == 12) {
    return '오후 $time';
  } else if (hour < 12) {
    return '오전 $hour:${time.split(':').last}';
  } else {
    return '오후 ${hour - 12}:${time.split(':').last}';
  }
}
