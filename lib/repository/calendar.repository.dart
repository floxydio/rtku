import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:rtku/model/calendar.model.dart';

class CalendarRepository {
  static Future<List<CalendarModel>> getCalendar({int? data}) async {
    int? calendarInt;

    if (data == null) {
    var month = returnMonth(DateTime.now());
    if(month == "January") {
      calendarInt = 1;
    } else if (month == "February") {
      calendarInt = 2;
    } else if (month == "March") {
      calendarInt = 3;
    } else if (month == "April") {
      calendarInt = 4;
    } else if (month == "May") {
      calendarInt = 5;
    } else if (month == "June") {
      calendarInt = 6;
    } else if(month == "July") {
      calendarInt = 7;
    } else if (month== "August") {
      calendarInt = 8;
    } else if (month =="September") {
      calendarInt = 9;
    } else if (month == "October") {
      calendarInt = 10;
    } else if (month == "November") {
      calendarInt = 11;
    } else if (month == "December") {
      calendarInt = 12;
    }
    } else {
      calendarInt = data;
    }

    var response = await Dio().get("https://api-harilibur.vercel.app/api?month=$calendarInt");
    List resbody = response.data;
    return resbody.map((e) => CalendarModel.fromJson(e)).toList();
  }
}
String returnMonth(DateTime date) {
  return DateFormat.MMMM().format(date);
}
