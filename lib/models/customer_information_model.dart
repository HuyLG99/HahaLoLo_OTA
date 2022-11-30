import 'dart:convert';

import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class CustomerInformationModel extends Equatable {
  int? id;
  String? firstName;
  String? lastName;
  bool? gender;
  String? email;
  String? address;
  String? nation;
  String? city;
  String? phone;

  CustomerInformationModel({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.address,
    this.nation,
    this.city,
    this.phone,
  });

  CustomerInformationModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? gender,
    String? address,
    String? nation,
    String? city,
    String? phone,
  }) =>
      CustomerInformationModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        nation: nation ?? this.nation,
        city: city ?? this.city,
        phone: phone ?? this.phone,
      );

  factory CustomerInformationModel.fromJson(Map<String, dynamic> json) =>
      CustomerInformationModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        gender: json["gender"],
        address: json["address"],
        nation: json["nation"],
        city: json["city"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "gender": gender,
        "address": address,
        "nation": nation,
        "city": city,
        "phone": phone,
      };
  static Map<String, dynamic> toMap(CustomerInformationModel customerInfo) => {
        "id": customerInfo.id,
        "firstName": customerInfo.firstName,
        "lastName": customerInfo.lastName,
        "email": customerInfo.email,
        "gender": customerInfo.gender,
        "address": customerInfo.address,
        "nation": customerInfo.nation,
        "city": customerInfo.city,
        "phone": customerInfo.phone,
      };
  static String encode(List<CustomerInformationModel> customerInformation) =>
      json.encode(
        customerInformation
            .map<Map<String, dynamic>>(
                (customerInfo) => CustomerInformationModel.toMap(customerInfo))
            .toList(),
      );

  static List<CustomerInformationModel> decode(String customerInformation) =>
      (json.decode(customerInformation) as List<dynamic>)
          .map<CustomerInformationModel>(
              (item) => CustomerInformationModel.fromJson(item))
          .toList();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
