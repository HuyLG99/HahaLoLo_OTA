import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterAccompaniedCubit extends Cubit<CounterAccompaniedState> {
  CounterAccompaniedCubit() : super(CounterAccompaniedState(counter: 0));

  // void increment() => emit(state + 1);
  // void decrement() => emit(state - 1);
  int countTemp = 1;
  int countTemp1 = 2;
  int countTemp2 = 3;
  int countTemp3 = 4;
  int countTemp4 = 5;
  int countTemp5 = 6;
  int countTemp6 = 7;
  int countTemp7 = 8;
  void increment() {
    emit(CounterAccompaniedState(counter: state.counter + 1));
  }

  void decrement() {
    emit(CounterAccompaniedState(counter: state.counter - 1));
  }

  void clean() {
    state.counter = (countTemp);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean1() {
    state.counter = (countTemp1);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean2() {
    state.counter = (countTemp2);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean3() {
    state.counter = (countTemp3);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean4() {
    state.counter = (countTemp4);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean5() {
    state.counter = (countTemp5);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean6() {
    state.counter = (countTemp6);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void clean7() {
    state.counter = (countTemp7);
    emit(CounterAccompaniedState(counter: state.counter));
  }

  void cleanNon() {
    state.counter = ((state.counter == 0) ? state.counter : state.counter - 1);
    emit(CounterAccompaniedState(counter: state.counter));
  }
}
