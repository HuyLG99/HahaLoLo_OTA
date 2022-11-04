part of 'calendar.bloc.dart';

enum CalendarStatus { initial, loading, loadMore, success, failure }

class CalendarState extends Equatable {
  final CalendarStatus status;
  final List<CalendarData> listCalendar;
  final bool hasReachedMax;

  const CalendarState({
    this.status = CalendarStatus.initial,
    this.listCalendar = const [],
    this.hasReachedMax = false,
  });

  CalendarState copyWith({
    status,
    listCalendar,
    hasReachedMax,
  }) {
    return CalendarState(
      status: status ?? this.status,
      listCalendar: listCalendar ?? this.listCalendar,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listCalendar,
        hasReachedMax,
      ];
}
