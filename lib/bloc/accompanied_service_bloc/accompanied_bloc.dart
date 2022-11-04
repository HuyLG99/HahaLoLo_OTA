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
    // on<AccompaniedServiceFetch>((event, emit) async {
    //   emit(AccompaniedServiceState(data, selectedList:selectedList,)
    //       .copyWith(status: AccompaniedServiceStatus.loading));
    //   data = await accompaniedServiceRepository.readAccompanied();
    //
    //   try {
    //     emit(AccompaniedServiceState().copyWith(
    //       status: AccompaniedServiceStatus.success,
    //       listAccompaniedService: state.listAccompaniedService,
    //       selectedList: state.selectedList,
    //       remainList: state.remainList,
    //       hasReachedMax: true,
    //     ));
    //   } on Exception {
    //     emit(AccompaniedServiceState().copyWith(
    //       status: AccompaniedServiceStatus.failure,
    //       listAccompaniedService: state.listAccompaniedService,
    //       selectedList: state.selectedList,
    //       remainList: state.listAccompaniedService,
    //       hasReachedMax: state.hasReachedMax,
    //     ));
    //   }
    // });

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
          hasReachedMax: true,
        ));
      } on Exception {
        emit(AccompaniedServiceState(
          listAccompaniedService: state.listAccompaniedService,
          status: AccompaniedServiceStatus.failure,
          selectedList: state.selectedList,
          remainList: state.listAccompaniedService,
          hasReachedMax: state.hasReachedMax,
        ));
      }
    });

    on<AccompaniedServiceSelected>((event, emit) async {
      emit(state.copyWith(status: AccompaniedServiceStatus.loading));
      if (event.accompaniedServiceDataPrevious == null) {
        state.selectedList!.add(event.accompaniedServiceDataSelected);
        var remainList = state.listAccompaniedService!
            .toSet()
            .difference(state.selectedList!.toSet())
            .toList();
        emit(state.copyWith(
            listAccompaniedService: data,
            selectedList: state.selectedList,
            remainList: remainList,
            status: AccompaniedServiceStatus.selected));
      } else if (event.accompaniedServiceDataSelected.id !=
          event.accompaniedServiceDataPrevious!.id) {
        state.selectedList!.add(event.accompaniedServiceDataSelected);
        state.selectedList!.remove(event.accompaniedServiceDataPrevious);
        var remainList = state.listAccompaniedService!
            .toSet()
            .difference(state.selectedList!.toSet())
            .toList();
        emit(state.copyWith(
            listAccompaniedService: data,
            selectedList: state.selectedList,
            remainList: remainList,
            status: AccompaniedServiceStatus.selected));
      }
    });
  }
}
