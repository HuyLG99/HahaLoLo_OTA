part of 'counter_accompanied_cubit.dart';

//ignore: must_be_immutable
class CounterAccompaniedState extends Equatable {
  int counter;
  CounterAccompaniedState({this.counter = 0});

  @override
  List<Object> get props => [counter];
}
