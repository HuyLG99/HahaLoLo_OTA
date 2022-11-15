part of 'counter_accompanied_cubit.dart';

class CounterAccompaniedState extends Equatable {
  final int counter;
  const CounterAccompaniedState({required this.counter});

  @override
  List<Object> get props => [counter];
}
