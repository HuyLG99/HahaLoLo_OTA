import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class CustomerInformationModel extends Equatable {
  CustomerInformationModel? customerInformationModel;
  String? firstName;
  String? lastName;
  bool? gender;
  String? email;
  String? address;
  String? nation;
  String? city;
  String? phone;

  CustomerInformationModel({
    String? firstName,
    String? lastName,
    String? email,
    bool? gender,
    String? address,
    String? nation,
    String? city,
    String? phone,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
