import 'package:bloc/bloc.dart';

import 'dart:async';

import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0));

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    print(event.toString());
    if (event is IncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    } else if (state is DecrementEvent) {
      yield CounterState(counter: state.counter - 1);
    }
  }
}
