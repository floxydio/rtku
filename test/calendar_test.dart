import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';



void main() {
  test("Test Month", () {
    var month = returnMonth(DateTime.now());
    expect(month, "December");


  });
}

String returnMonth(DateTime date) {
  return DateFormat.MMMM().format(date);
}

