import 'package:intl/intl.dart';

List<String> generateDateList(DateTime startDate, DateTime endDate) {
  List<String> dateList = [];
  DateTime currentDate = startDate;
  while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dateList.add(DateFormat('yyyy-MM-dd').format(currentDate));
    currentDate = currentDate.add(Duration(days: 1));
  }
  return dateList;
}

List<String> getWeekdayNames() {
  return ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
}

List<String> Timing = [
  "09:00 AM",
  "10:00 AM",
  "11:00 AM",
  "01:00 PM",
  "03:00 PM",
  "04:00 PM",
  "05:00 PM",
  "06:00 PM",
  "07:00 PM",
];