import 'package:equatable/equatable.dart';

class TotalPriceModel extends Equatable {
  final int qty;
  final int price;

  const TotalPriceModel({
    this.qty = 0,
    this.price = 0,
  });

  get totalPrice => qty * price;

  @override
  List<Object?> get props => [qty, price];

  TotalPriceModel copyWith({
    int? qty,
    int? price,
  }) {
    return TotalPriceModel(
      qty: qty ?? this.qty,
      price: price ?? this.price,
    );
  }
}
