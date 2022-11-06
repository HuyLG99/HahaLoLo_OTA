part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final AmountCustomerModel amountCustomer;
  const CounterState({required this.amountCustomer});

  @override
  List<Object> get props => [amountCustomer];
}
