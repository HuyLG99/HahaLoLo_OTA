// To parse this JSON data, do
//
//     final upcomingCalenderModel = upcomingCalenderModelFromJson(jsonString);

import 'dart:convert';

UpcomingCalenderModel upcomingCalenderModelFromJson(String str) =>
    UpcomingCalenderModel.fromJson(json.decode(str));

String upcomingCalenderModelToJson(UpcomingCalenderModel data) =>
    json.encode(data.toJson());

class UpcomingCalenderModel {
  UpcomingCalenderModel({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  List<CalendarData> data;

  factory UpcomingCalenderModel.fromJson(Map<String, dynamic> json) =>
      UpcomingCalenderModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<CalendarData>.from(
            json["data"].map((x) => CalendarData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CalendarData {
  CalendarData({
    required this.dateStart,
    required this.dateEnd,
    required this.promPerc,
    required this.rateProm,
    required this.total,
    required this.totalBase,
    required this.maxSlot,
    required this.remainSlot,
    required this.maxSlotBooking,
    required this.bookNow,
  });

  DateTime dateStart;
  DateTime dateEnd;
  int promPerc;
  double rateProm;
  int total;
  int totalBase;
  int maxSlot;
  int remainSlot;
  int maxSlotBooking;
  int bookNow;

  factory CalendarData.fromJson(Map<String, dynamic> json) => CalendarData(
        dateStart: DateTime.parse(json["dateStart"]),
        dateEnd: DateTime.parse(json["dateEnd"]),
        promPerc: json["promPerc"],
        rateProm: json["rateProm"].toDouble(),
        total: json["total"],
        totalBase: json["totalBase"],
        maxSlot: json["maxSlot"],
        remainSlot: json["remainSlot"],
        maxSlotBooking: json["maxSlotBooking"],
        bookNow: json["bookNow"],
      );

  Map<String, dynamic> toJson() => {
        "dateStart":
            "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "dateEnd":
            "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}",
        "promPerc": promPerc,
        "rateProm": rateProm,
        "total": total,
        "totalBase": totalBase,
        "maxSlot": maxSlot,
        "remainSlot": remainSlot,
        "maxSlotBooking": maxSlotBooking,
        "bookNow": bookNow,
      };
}
