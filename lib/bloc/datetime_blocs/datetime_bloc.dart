import 'package:bloc/bloc.dart';
import 'package:hahaloloapp/models/datetime_data_model.dart';
import 'package:equatable/equatable.dart';

import 'datetime_repository.dart';

part 'datetime_state.dart';
part 'datetime_event.dart';

class DatetimeBloc extends Bloc<DatetimeEvent, DatetimeState> {
  DateTimeRepository dateTimeRepository;
  List<DataDate>? dates;

  ///
  DatetimeBloc(this.dateTimeRepository) : super(const DatetimeState()) {
    on<DatetimeFetch>((event, emit) async {
      emit(const DatetimeState().copyWith(
        status: DatetimeStatus.loading,
        activeConnect: state.activeConnect,
      ));
      try {
        dates = await dateTimeRepository.readDate();
        // print(dates);
        emit(const DatetimeState().copyWith(
          status: DatetimeStatus.success,
          listDate: dates,
          hasReachedMax: true,
          activeConnect: state.activeConnect,
        ));
      } on Exception {
        emit(const DatetimeState().copyWith(
          status: DatetimeStatus.failure,
          hasReachedMax: state.hasReachedMax,
          activeConnect: state.activeConnect,
        ));
      }
    });

    on<DatetimeLoadMore>((event, emit) async {
      emit(const DatetimeState().copyWith(
        status: DatetimeStatus.loadMore,
        listDate: state.listDate,
        hasReachedMax: state.hasReachedMax,
        activeConnect: state.activeConnect,
      ));
      if (state.listDate.length < 36) {
        try {
          final dates2 = await dateTimeRepository.readDate2();
          dates?.insertAll((dates?.length ?? 0), dates2);
          // print(dates);
          emit(
            const DatetimeState().copyWith(
              status: DatetimeStatus.success,
              listDate: dates,
              hasReachedMax: false,
              activeConnect: state.activeConnect,
            ),
          );
        } on Exception {
          emit(const DatetimeState().copyWith(
            status: DatetimeStatus.failure,
            hasReachedMax: true,
            activeConnect: state.activeConnect,
          ));
        }
      } else {
        emit(
          const DatetimeState().copyWith(
            status: DatetimeStatus.failure,
            listDate: dates,
            hasReachedMax: false,
            activeConnect: state.activeConnect,
          ),
        );
      }
    });

    // on<DatetimeReLoad>((event, emit) async {
    //   emit(const DatetimeState().copyWith(
    //     status: DatetimeStatus.loadMore,
    //     listDate: state.listDate,
    //     hasReachedMax: state.hasReachedMax,
    //   ));
    //   // if (state.listDate.length >= 48) {
    //   try {
    //     final dates2 = await dateTimeRepository.readDate2();
    //     dates?.insertAll((dates?.length ?? 0), dates2);
    //     print(dates);
    //     emit(
    //       const DatetimeState().copyWith(
    //         status: DatetimeStatus.failure,
    //         listDate: dates,
    //         hasReachedMax: state.hasReachedMax,
    //       ),
    //     );
    //   } on Exception {
    //     emit(const DatetimeState().copyWith(
    //       status: DatetimeStatus.failure,
    //       hasReachedMax: false,
    //     ));
    //   }
    //   // } else {
    //   //   emit(
    //   //     const DatetimeState().copyWith(
    //   //       status: DatetimeStatus.success,
    //   //       listDate: dates,
    //   //       hasReachedMax: false,
    //   //     ),
    //   //   );
    //   // }
    // });

    // on<DatetimeFetchLoading>((event, emit) async {
    //   if (state.status == DatetimeStatus.loading && state.listDate.isNotEmpty) {
    //     emit(
    //       DatetimeState(
    //         status: DatetimeStatus.success,
    //         listDate: state.listDate,
    //       ),
    //     );
    //   } else {
    //     emit(
    //       DatetimeState(
    //         status: DatetimeStatus.loading,
    //         listDate: state.listDate,
    //       ),
    //     );
    //   }
    // });
    // on<DatetimeFetchLoadError>((event, emit) async {
    //   emit(
    //     const DatetimeState(
    //       status: DatetimeStatus.failure,
    //     ),
    //   );
    // });
    // on<DatetimeFetchedFail>((event, emit) async {
    //   emit(
    //     DatetimeState(
    //       status: DatetimeStatus.failure,
    //       listDate: state.listDate,
    //     ),
    //   );
    // });
  }
}
