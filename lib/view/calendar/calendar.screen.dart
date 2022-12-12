import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtku/controller/calendaragenda.controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarController = Get.put(CalendarController());
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              onPageChanged: (focusedDay) {
                calendarController.getData(data: focusedDay.month);
              },
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Agenda Kalendar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            GetX<CalendarController>(
              builder: (controller) {
                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    physics: const ScrollPhysics(),
                    itemCount: controller.calendarAgenda.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            controller.calendarAgenda[i].holidayName.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            controller.calendarAgenda[i].holidayDate.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      );
                    });
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
