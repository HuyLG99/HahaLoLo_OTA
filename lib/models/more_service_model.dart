import 'package:equatable/equatable.dart';
import 'package:hahaloloapp/models/accompanied_service_model.dart';

class MoreServiceModel extends Equatable {
  AccompaniedServiceData? accompaniedServiceData;
  String? idSelectedMenuItem;
  String? name;
  int? qty;
  int? maxCount;
  int? price;
  int adult;
  int child;
  int littleChild;
  int baby;

  MoreServiceModel({
    String? idSelectedMenuItem,
    AccompaniedServiceData? accompaniedServiceData,
    String? id,
    String? name,
    this.qty = 0,
    int? maxCont,
    int? price,
    this.adult = 1,
    this.child = 0,
    this.littleChild = 0,
    this.baby = 0,
  });
  int get totalCustomer => adult + child + littleChild + baby;
  @override
  List<Object?> get props => [adult, child, littleChild, baby, qty];

  MoreServiceModel copyWith({
    int? adult,
    int? child,
    int? littleChild,
    int? baby,
    int? qty,
  }) {
    return MoreServiceModel(
      adult: adult ?? this.adult,
      child: child ?? this.child,
      littleChild: littleChild ?? this.littleChild,
      baby: baby ?? this.baby,
      qty: qty ?? this.qty,
    );
  }
}
