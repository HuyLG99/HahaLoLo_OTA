import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../models/more_service_model.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(amountCustomer: MoreServiceModel()));

  void incrementAdult(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(adult: amount)));
  }

  void incrementChild(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(child: amount)));
  }

  void incrementLittleChild(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(littleChild: amount)));
  }

  void incrementBaby(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(baby: amount)));
  }

  void decrementAdult(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(adult: amount)));
  }

  void decrementChild(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(child: amount)));
  }

  void decrementLittleChild(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(littleChild: amount)));
  }

  void decrementBaby(int amount) {
    emit(CounterState(
        amountCustomer: state.amountCustomer.copyWith(baby: amount)));
  }

  void increment(int qty) {
    emit(CounterState(amountCustomer: state.amountCustomer.copyWith(qty: qty)));
  }

  void decrement(int qty) {
    emit(CounterState(amountCustomer: state.amountCustomer.copyWith(qty: qty)));
  }
}
