part of 'accompanied_bloc.dart';

abstract class AccompaniedServiceEvent {
  AccompaniedServiceEvent();
  List<Object?> get props => [];
}

class AccompaniedServiceInitial extends AccompaniedServiceEvent {}

class AccompaniedServiceCompareSelected extends AccompaniedServiceEvent {
  AccompaniedServiceCompareSelected();
}

class AccompaniedServiceSelected extends AccompaniedServiceEvent {
  final AccompaniedServiceData accompaniedServiceDataSelected;
  final AccompaniedServiceData? accompaniedServiceDataPrevious;
  AccompaniedServiceSelected(
      this.accompaniedServiceDataSelected, this.accompaniedServiceDataPrevious);
}

class AccompaniedServiceDeleted extends AccompaniedServiceEvent {
  AccompaniedServiceDeleted();
}
