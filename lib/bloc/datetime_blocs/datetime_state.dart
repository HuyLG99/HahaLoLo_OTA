part of 'datetime_bloc.dart';

enum DatetimeStatus { initial, loading, loadMore, success, failure }

class DatetimeState extends Equatable {
  final DatetimeStatus status;
  final List<DataDate> listDate;
  final bool hasReachedMax;
  final bool activeConnect;

  const DatetimeState({
    this.status = DatetimeStatus.initial,
    this.listDate = const [],
    this.hasReachedMax = false,
    this.activeConnect = true,
  });

  DatetimeState copyWith({
    status,
    listDate,
    hasReachedMax,
    activeConnect,
  }) {
    return DatetimeState(
      status: status ?? this.status,
      listDate: listDate ?? this.listDate,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      activeConnect: activeConnect ?? this.activeConnect,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listDate,
        hasReachedMax,
      ];
}
// abstract class DatetimeState extends Equatable {
//   const DatetimeState();
// }
//
// class DatetimeInitialState extends DatetimeState {
//   const DatetimeInitialState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class DatetimeLoadingState extends DatetimeState {
//   const DatetimeLoadingState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class DatetimeErrorFetchDataState extends DatetimeState {
//   final String errorMessage;
//   const DatetimeErrorFetchDataState({
//     required this.errorMessage,
//   });
//
//   @override
//   List<Object?> get props => [];
// }
//
// class DatetimeSuccessFetchDataState extends DatetimeState {
//   final List<DataDate> listDataDate;
//   const DatetimeSuccessFetchDataState({
//     required this.listDataDate,
//   });
//
//   @override
//   List<Object?> get props => [];
// }
