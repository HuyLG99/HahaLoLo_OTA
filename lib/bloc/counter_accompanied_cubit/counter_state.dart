part of 'counter_accompanied_cubit.dart';

class CounterAccompaniedState extends Equatable {
  int counter;
  CounterAccompaniedState({this.counter = 0});

  @override
  List<Object> get props => [counter];
}
