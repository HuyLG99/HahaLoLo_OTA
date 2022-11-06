import 'package:bloc/bloc.dart';
import 'accompanied_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/accompanied_service_model.dart';

part 'accompanied.event.dart';
part 'accompanied.state.dart';

class AccompaniedServiceBloc
    extends Bloc<AccompaniedServiceEvent, AccompaniedServiceState> {
  AccompaniedServiceRepository accompaniedServiceRepository;

  List<AccompaniedServiceData> data = [];
  List<AccompaniedServiceData> selectedList = [];
  List<AccompaniedServiceData> remainList = [];

  AccompaniedServiceBloc(this.accompaniedServiceRepository)
      : super(AccompaniedServiceState(
          listAccompaniedService: [],
          selectedList: [],
          remainList: [],
        )) {
    on<AccompaniedServiceCompareSelected>((event, emit) async {
      emit(AccompaniedServiceState(
          listAccompaniedService: [],
          selectedList: [],
          remainList: []).copyWith(status: AccompaniedServiceStatus.loading));
      data = await accompaniedServiceRepository.readAccompanied();
      try {
        emit(AccompaniedServiceState(
            status: AccompaniedServiceStatus.success,
            listAccompaniedService: data,
            selectedList: state.selectedList,
            remainList: data,
            selectedMenuItem: state.selectedMenuItem));
      } on Exception {
        emit(AccompaniedServiceState(
            listAccompaniedService: state.listAccompaniedService,
            status: AccompaniedServiceStatus.failure,
            selectedList: state.selectedList,
            remainList: state.listAccompaniedService,
            selectedMenuItem: state.selectedMenuItem));
      }
    });

    on<AccompaniedServiceSelected>((event, emit) async {
      emit(state.copyWith(status: AccompaniedServiceStatus.loading));
      if (event.accompaniedServiceDataPrevious == null) {
        state.selectedList.add(event.accompaniedServiceDataSelected);
        var remainList = state.listAccompaniedService
            .toSet()
            .difference(state.selectedList.toSet())
            .toList();
        emit(state.copyWith(
            selectedData: event.accompaniedServiceDataSelected,
            remainData: event.accompaniedServiceDataPrevious,
            listAccompaniedService: data,
            selectedList: state.selectedList,
            remainList: remainList,
            selectedMenuItem: state.selectedMenuItem,
            status: AccompaniedServiceStatus.selected));
      } else if (event.accompaniedServiceDataSelected.id !=
          event.accompaniedServiceDataPrevious!.id) {
        state.selectedList.add(event.accompaniedServiceDataSelected);
        state.selectedList.remove(event.accompaniedServiceDataPrevious);
        var remainList = state.listAccompaniedService
            .toSet()
            .difference(state.selectedList.toSet())
            .toList();
        emit(state.copyWith(
            selectedData: event.accompaniedServiceDataSelected,
            remainData: event.accompaniedServiceDataPrevious,
            listAccompaniedService: data,
            selectedMenuItem: state.selectedMenuItem,
            selectedList: state.selectedList,
            remainList: remainList,
            status: AccompaniedServiceStatus.selected));
      }
    });

    on<AccompaniedServiceDeleted>((event, emit) async {
      emit(state.copyWith(status: AccompaniedServiceStatus.loading));
      if (state.selectedData != null) {
        state.remainList.add(state.selectedData!);
        state.selectedList.remove(state.selectedData);
      }

      emit(state.copyWith(
          selectedData: state.selectedData,
          remainData: state.remainData,
          listAccompaniedService: data,
          selectedList: state.selectedList,
          remainList: state.remainList,
          status: AccompaniedServiceStatus.deleted));
    });
  }
}
