import 'package:equatable/equatable.dart';

class AmountCustomerModel extends Equatable {
  final int adult;
  final int child;
  final int littleChild;
  final int baby;

  const AmountCustomerModel({
    this.adult = 0,
    this.child = 0,
    this.littleChild = 0,
    this.baby = 0,
  });

  get totalCustomer => adult + child + littleChild + baby;

  @override
  List<Object?> get props => [adult, child, littleChild, baby];

  AmountCustomerModel copyWith({
    int? adult,
    int? child,
    int? littleChild,
    int? baby,
  }) {
    return AmountCustomerModel(
      adult: adult ?? this.adult,
      child: child ?? this.child,
      littleChild: littleChild ?? this.littleChild,
      baby: baby ?? this.baby,
    );
  }
}
