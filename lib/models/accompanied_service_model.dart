// To parse this JSON data, do
//
//     final accompaniedServiceModel = accompaniedServiceModelFromJson(jsonString);

import 'dart:convert';

AccompaniedServiceModel accompaniedServiceModelFromJson(String str) =>
    AccompaniedServiceModel.fromJson(json.decode(str));

String accompaniedServiceModelToJson(AccompaniedServiceModel data) =>
    json.encode(data.toJson());

class AccompaniedServiceModel {
  AccompaniedServiceModel({
    required this.success,
    required this.code,
    required this.message,
    required this.meta,
    required this.data,
  });

  bool success;
  int code;
  String message;
  String meta;
  List<AccompaniedServiceData> data;

  factory AccompaniedServiceModel.fromJson(Map<String, dynamic> json) =>
      AccompaniedServiceModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        meta: json["meta"],
        data: List<AccompaniedServiceData>.from(
            json["data"].map((x) => AccompaniedServiceData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "meta": meta,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AccompaniedServiceData {
  AccompaniedServiceData({
    required this.currency,
    required this.pt100,
    required this.pn100,
    required this.pp100,
    required this.pt250,
    required this.tv451,
    required this.tn452,
    required this.t250,
    required this.id,
    required this.dl146,
    required this.dl147,
    this.qty = 0,
  });

  String currency;
  String pt100;
  String pn100;
  String pp100;
  String pt250;
  String tv451;
  int tn452;
  T250 t250;
  String id;
  DateTime dl146;
  String dl147;
  int? qty;

  int get totalPrice => (qty ?? 0) * tn452;

  factory AccompaniedServiceData.fromJson(Map<String, dynamic> json) =>
      AccompaniedServiceData(
        currency: json["currency"],
        pt100: json["pt100"],
        pn100: json["pn100"],
        pp100: json["pp100"],
        pt250: json["pt250"],
        tv451: json["tv451"],
        tn452: json["tn452"],
        t250: T250.fromJson(json["t250"]),
        id: json["id"],
        dl146: DateTime.parse(json["dl146"]),
        dl147: json["dl147"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "pt100": pt100,
        "pn100": pn100,
        "pp100": pp100,
        "pt250": pt250,
        "tv451": tv451,
        "tn452": tn452,
        "t250": t250.toJson(),
        "id": id,
        "dl146": dl146.toIso8601String(),
        "dl147": dl147,
      };
}

class T250 {
  T250({
    required this.t251,
    required this.tv253,
    required this.tv254,
    required this.pt150,
    required this.tv255,
    required this.tn256,
    required this.id,
  });

  T251 t251;
  String tv253;
  String tv254;
  String pt150;
  String tv255;
  int tn256;
  String id;

  factory T250.fromJson(Map<String, dynamic> json) => T250(
        t251: T251.fromJson(json["t251"]),
        tv253: json["tv253"],
        tv254: json["tv254"],
        pt150: json["pt150"],
        tv255: json["tv255"],
        tn256: json["tn256"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "t251": t251.toJson(),
        "tv253": tv253,
        "tv254": tv254,
        "pt150": pt150,
        "tv255": tv255,
        "tn256": tn256,
        "id": id,
      };
}

class T251 {
  T251({
    required this.lang,
    required this.tv251,
  });

  String lang;
  String tv251;

  factory T251.fromJson(Map<String, dynamic> json) => T251(
        lang: json["lang"],
        tv251: json["tv251"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tv251": tv251,
      };
}
