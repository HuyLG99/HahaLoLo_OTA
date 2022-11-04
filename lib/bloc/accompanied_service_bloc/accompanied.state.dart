part of 'accompanied_bloc.dart';

enum AccompaniedServiceStatus {
  initial,
  loading,
  selected,
  remaining,
  success,
  failure
}

class AccompaniedServiceState extends Equatable {
  final AccompaniedServiceStatus status;
  List<AccompaniedServiceData> listAccompaniedService;
  List<AccompaniedServiceData> selectedList;
  List<AccompaniedServiceData> remainList;
  // final AccompaniedServiceData serviceData;
  final bool hasReachedMax;

  AccompaniedServiceState({
    this.status = AccompaniedServiceStatus.initial,
    required this.listAccompaniedService,
    required this.selectedList,
    required this.remainList,
    this.hasReachedMax = false,
    // required this.serviceData,
  });

  AccompaniedServiceState copyWith({
    status,
    listAccompaniedService,
    selectedList,
    remainList,
    hasReachedMax,
    serviceData,
  }) {
    return AccompaniedServiceState(
      status: status ?? this.status,
      listAccompaniedService:
          listAccompaniedService ?? this.listAccompaniedService,
      selectedList: selectedList ?? this.selectedList,
      remainList: remainList ?? this.remainList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      // serviceData: serviceData ?? this.serviceData,
    );
  }

  @override
  List<Object?> get props => [
        status,
        listAccompaniedService,
        remainList,
        selectedList,
        hasReachedMax,
      ];
}
