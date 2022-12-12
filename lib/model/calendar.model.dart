class CalendarModel {
  String? holidayDate;
  String? holidayName;
  bool? isNationalHoliday;

  CalendarModel({this.holidayDate, this.holidayName, this.isNationalHoliday});

  CalendarModel.fromJson(Map<String, dynamic> json) {
    holidayDate = json['holiday_date'];
    holidayName = json['holiday_name'];
    isNationalHoliday = json['is_national_holiday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['holiday_date'] = holidayDate;
    data['holiday_name'] = holidayName;
    data['is_national_holiday'] = isNationalHoliday;
    return data;
  }
}
