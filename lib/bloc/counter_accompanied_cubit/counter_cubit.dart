import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterAccompaniedCubit extends Cubit<int> {
  CounterAccompaniedCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
