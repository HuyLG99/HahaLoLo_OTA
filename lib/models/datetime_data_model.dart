// To parse this JSON data, do
//
//     final dateModel = dateModelFromJson(jsonString);

import 'dart:convert';

DateModel dateModelFromJson(String str) => DateModel.fromJson(json.decode(str));

String dateModelToJson(DateModel data) => json.encode(data.toJson());

class DateModel {
  DateModel({
    required this.success,
    required this.code,
    required this.message,
    required this.meta,
    required this.data,
  });

  bool success;
  int code;
  String message;
  Meta meta;
  List<DataDate> data;

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        meta: Meta.fromJson(json["meta"]),
        data:
            List<DataDate>.from(json["data"].map((x) => DataDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataDate {
  DataDate({
    required this.month,
    required this.year,
  });

  int month;
  int year;

  factory DataDate.fromJson(Map<String, dynamic> json) => DataDate(
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "year": year,
      };
}

class Meta {
  Meta({
    this.next,
  });

  String? next;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
      };
}
