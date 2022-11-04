import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hahaloloapp/models/upcoming_calendar_model.dart';

final List<CalendarData> dataCalendar = [];
final List<CalendarData> dataCalendar2 = [];

class CalendarRepository {
  Future<List<CalendarData>> readCalendar() async {
    final String response =
        await rootBundle.loadString('assets/upcoming_calendar.json');
    final dataUpcomingCalendar = await json.decode(response);
    // print(dataUpcomingCalendar['data']);

    dataCalendar.clear();
    dataUpcomingCalendar['data']
        .map((data) => dataCalendar.add(CalendarData.fromJson(data)))
        .toList();

    // print(dataCalendar);
    await Future.delayed(const Duration(seconds: 2));
    return dataCalendar;
  }

  Future<List<CalendarData>> readCalendar2() async {
    final String response = await rootBundle.loadString('assets/calendar.json');
    final dataUpcomingCalendar = await json.decode(response);
    // print(dataUpcomingCalendar['data']);
    dataCalendar2.clear();
    dataUpcomingCalendar['data']
        .map((data) => dataCalendar2.add(CalendarData.fromJson(data)))
        .toList();
    // print(dataCalendar2);
    await Future.delayed(const Duration(milliseconds: 500));

    return dataCalendar2;
  }
}
