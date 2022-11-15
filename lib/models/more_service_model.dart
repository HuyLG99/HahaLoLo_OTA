import 'package:equatable/equatable.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';

class MoreServiceModel extends Equatable {
  AccompaniedServiceData? accompaniedServiceData;
  String? idSelectedMenuItem;
  String? name;
  int? qty;
  MoreServiceModel({
    String? idSelectedMenuItem,
    AccompaniedServiceData? accompaniedServiceData,
    String? id,
    String? name,
    int? qty,
  });

  @override
  List<Object?> get props => [];
}
