part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final MoreServiceModel amountCustomer;
  const CounterState({required this.amountCustomer});

  @override
  List<Object> get props => [amountCustomer];
}
