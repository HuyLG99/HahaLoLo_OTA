import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/more_service_model.dart';
part 'counter_state.dart';

class CounterAccompaniedCubit extends Cubit<CounterAccompaniedState> {
  CounterAccompaniedCubit() : super(CounterAccompaniedState(counter: 0));

  // void increment() => emit(state + 1);
  // void decrement() => emit(state - 1);
  int countTemp = 1;

  void increment() {
    emit(CounterAccompaniedState(counter: state.counter + 1));
  }

  void decrement() {
    emit(CounterAccompaniedState(counter: state.counter - 1));
  }

  void clean() {
    state.counter = countTemp;
    emit(CounterAccompaniedState(counter: state.counter));
  }
}
