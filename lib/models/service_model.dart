import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
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
  List<Datum> data;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        meta: json["meta"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "meta": meta,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.t251,
    required this.tv253,
    required this.tv254,
    required this.tv255,
    required this.tn256,
    required this.id,
  });

  T251 t251;
  String tv253;
  String tv254;
  String tv255;
  int tn256;
  String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        t251: T251.fromJson(json["t251"]),
        tv253: json["tv253"],
        tv254: json["tv254"],
        tv255: json["tv255"],
        tn256: json["tn256"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "t251": t251.toJson(),
        "tv253": tv253,
        "tv254": tv254,
        "tv255": tv255,
        "tn256": tn256,
        "id": id,
      };
}

class T251 {
  T251({
    required this.lang,
    required this.tv251,
    required this.tv252,
    required this.id,
    required this.dl146,
    required this.dl147,
    required this.dl148,
    required this.dl149,
  });

  String lang;
  String tv251;
  String tv252;
  String id;
  DateTime dl146;
  String dl147;
  DateTime? dl148;
  String dl149;

  factory T251.fromJson(Map<String, dynamic> json) => T251(
        lang: json["lang"],
        tv251: json["tv251"],
        tv252: json["tv252"],
        id: json["id"],
        dl146: DateTime.parse(json["dl146"]),
        dl147: json["dl147"],
        dl148: json["dl148"] == null ? null : DateTime.parse(json["dl148"]),
        dl149: json["dl149"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tv251": tv251,
        "tv252": tv252,
        "id": id,
        "dl146": dl146.toIso8601String(),
        "dl147": dl147,
        "dl148": dl148,
        "dl149": dl149,
      };
}
