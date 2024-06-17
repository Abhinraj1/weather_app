import 'package:intl/intl.dart';


String formatTime(String dateTime) {
  DateTime parsedDateTime = DateTime.parse(dateTime);
  String formattedTime = DateFormat('h a').format(parsedDateTime).toLowerCase();
  return formattedTime;
}


String getDateNumberOrNow(String date) {
  DateTime parsedDate = DateTime.parse(date);
  DateTime now = DateTime.now();

  if (parsedDate.year == now.year && parsedDate.month == now.month && parsedDate.day == now.day) {
    return 'now';
  } else {
    return '${parsedDate.day}';
  }
}
