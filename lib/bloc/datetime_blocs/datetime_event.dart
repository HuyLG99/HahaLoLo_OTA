part of 'datetime_bloc.dart';

abstract class DatetimeEvent {
  DatetimeEvent();
  List<Object?> get props => [];
}

class DatetimeInitial extends DatetimeEvent {}

class DatetimeFetch extends DatetimeEvent {
  DatetimeFetch();
}

class DatetimeLoadMore extends DatetimeEvent {
  DatetimeLoadMore();
}

class DatetimeReLoad extends DatetimeEvent {
  DatetimeReLoad();
}
