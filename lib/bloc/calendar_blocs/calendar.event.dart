part of 'calendar.bloc.dart';

abstract class CalendarEvent {
  CalendarEvent();
  List<Object?> get props => [];
}

class CalendarInitial extends CalendarEvent {}

class CalendarFetch extends CalendarEvent {
  CalendarFetch();
}

class CalendarFetch2 extends CalendarEvent {
  CalendarFetch2();
}

class CalendarLoadMore extends CalendarEvent {
  CalendarLoadMore();
}

class CalendarReLoad extends CalendarEvent {
  CalendarReLoad();
}
