import 'package:get/get.dart';
import 'package:rtku/model/calendar.model.dart';
import 'package:rtku/repository/calendar.repository.dart';

class CalendarController extends GetxController {
  var calendarAgenda = <CalendarModel>[].obs;

  @override
  void onInit() {
  getData();
    super.onInit();
  }

  void getData({int? data}) async {
    calendarAgenda.clear();
    var fetchCalendar = await CalendarRepository.getCalendar(data: data);
    calendarAgenda.addAll(fetchCalendar);

  }

}
