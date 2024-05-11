import 'package:intl/intl.dart';

String getTodayDateFormat() {
  DateTime now = DateTime.now();
  return DateFormat('dd/MM/yyyy').format(now);
}

String getTodayDateFullMonthFormat() {
  DateTime now = DateTime.now();
  return DateFormat('dd MMMM yyyy').format(now);
}

String convertDateToString(DateTime dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String getYesterdayDateFormat() {
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  return DateFormat('yyyy-MM-dd').format(yesterday);
}

String getNextSixMonthFormat() {
  final DateTime now = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month + 6, now.day);
  return DateFormat('MM/yyyy').format(yesterday);
}

String getLastMonthDateFormat(int? multiply) {
  DateTime yesterday = DateTime.now().subtract(Duration(days: multiply != null ? 30 * multiply : 30));
  return DateFormat('MMMM yyyy').format(yesterday);
}

String getMonthAndYearFormat(int? multiply) {
  DateTime yesterday = DateTime.now().subtract(Duration(days: multiply != null ? 30 * multiply : 30));
  return DateFormat('MMMM yyyy').format(yesterday);
}

String convertToViewFormat(String yyyyMMdd) {
  return DateFormat('EEEE, dd MMMM yyyy', 'id').format(DateFormat('yyyy-MM-dd').parse(yyyyMMdd));
}
String convertToViewFormatWithTime(String yyyyMMdd) {
  return DateFormat('EEEE, dd MMMM yyyy', 'id').format(DateFormat('yyyy-MM-dd h:m').parse(yyyyMMdd));
}

DateTime toDateTime(String dateString, String format, {bool utc = true}) {
  return DateFormat(format).parse(dateString, utc);
}

int minutesBetween(DateTime from, DateTime to) {
  return (to.difference(from).inSeconds / 60).round();
}
