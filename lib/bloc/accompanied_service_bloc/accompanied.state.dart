part of 'accompanied_bloc.dart';

enum AccompaniedServiceStatus {
  initial,
  loading,
  selected,
  remaining,
  deleted,
  success,
  failure
}

class AccompaniedServiceState extends Equatable {
  final AccompaniedServiceStatus status;
  List<AccompaniedServiceData> listAccompaniedService;
  List<AccompaniedServiceData> selectedList;
  List<AccompaniedServiceData> remainList;
  final AccompaniedServiceData? selectedData;
  final AccompaniedServiceData? remainData;
  final AccompaniedServiceData? selectedMenuItem;

  AccompaniedServiceState({
    this.status = AccompaniedServiceStatus.initial,
    required this.listAccompaniedService,
    required this.selectedList,
    required this.remainList,
    this.remainData,
    this.selectedData,
    this.selectedMenuItem,
  });

  AccompaniedServiceState copyWith({
    status,
    listAccompaniedService,
    selectedList,
    remainList,
    hasReachedMax,
    selectedData,
    remainData,
    selectedMenuItem,
  }) {
    return AccompaniedServiceState(
      status: status ?? this.status,
      listAccompaniedService:
          listAccompaniedService ?? this.listAccompaniedService,
      selectedList: selectedList ?? this.selectedList,
      remainList: remainList ?? this.remainList,
      remainData: remainData ?? remainData,
      selectedData: selectedData ?? this.selectedData,
      selectedMenuItem: selectedMenuItem ?? this.selectedMenuItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listAccompaniedService,
        remainList,
        selectedList,
        selectedData,
        remainData,
        selectedMenuItem,
      ];
}
