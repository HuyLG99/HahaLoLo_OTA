import 'package:equatable/equatable.dart';
import 'package:hahaloloapp/models/upcoming_calendar_model.dart';

import 'package:bloc/bloc.dart';

import 'calendar_repository.dart';

part 'calendar.state.dart';
part 'calendar.event.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarRepository calendarRepository;
  List<CalendarData>? calendars;
  CalendarBloc(this.calendarRepository) : super(const CalendarState()) {
    on<CalendarFetch>((event, emit) async {
      emit(const CalendarState().copyWith(status: CalendarStatus.loading));
      calendars = await calendarRepository.readCalendar();
      // print(calendars);
      try {
        emit(const CalendarState().copyWith(
          status: CalendarStatus.success,
          listCalendar: calendars,
          hasReachedMax: true,
        ));
      } on Exception {
        emit(const CalendarState().copyWith(
          status: CalendarStatus.failure,
          hasReachedMax: state.hasReachedMax,
        ));
      }
    });
    on<CalendarFetch2>((event, emit) async {
      emit(const CalendarState().copyWith(status: CalendarStatus.loading));
      // state.listCalendar.remove(state.listCalendar);
      calendars = await calendarRepository.readCalendar2();
      // print(calendars);
      try {
        emit(const CalendarState().copyWith(
          status: CalendarStatus.success,
          listCalendar: calendars,
          hasReachedMax: true,
        ));
      } on Exception {
        emit(const CalendarState().copyWith(
          status: CalendarStatus.failure,
          hasReachedMax: state.hasReachedMax,
        ));
      }
    });
  }
}
