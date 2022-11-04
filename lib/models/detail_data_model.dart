// To parse this JSON data, do
//
//     final detailDataModel = detailDataModelFromJson(jsonString);

import 'dart:convert';

DetailDataModel detailDataModelFromJson(String str) =>
    DetailDataModel.fromJson(json.decode(str));

String detailDataModelToJson(DetailDataModel data) =>
    json.encode(data.toJson());

class DetailDataModel {
  DetailDataModel({
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
  List<Data> data;

  factory DetailDataModel.fromJson(Map<String, dynamic> json) =>
      DetailDataModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        meta: json["meta"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "meta": meta,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.language,
    required this.currency,
    required this.id,
    required this.pp100,
    required this.pb100,
    required this.tv101,
    required this.tv102,
    required this.t550,
    required this.tv118,
    required this.tn120,
    required this.tn130,
    required this.tn131,
    required this.tn123,
    required this.t101,
    required this.ft300,
    required this.insInf,
    required this.tn134,
    required this.promsNumb,
    required this.rates,
    required this.maxSlotBooking,
    required this.remainSlot,
  });

  String language;
  String currency;
  String id;
  String pp100;
  String pb100;
  String tv101;
  dynamic tv102;
  T550 t550;
  String tv118;
  int tn120;
  int tn130;
  int tn131;
  int tn123;
  T101 t101;
  List<Ft300> ft300;
  InsInf insInf;
  int tn134;
  int promsNumb;
  Rates rates;
  int maxSlotBooking;
  int remainSlot;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        language: json["language"],
        currency: json["currency"],
        id: json["id"],
        pp100: json["pp100"],
        pb100: json["pb100"],
        tv101: json["tv101"],
        tv102: json["tv102"],
        t550: T550.fromJson(json["t550"]),
        tv118: json["tv118"],
        tn120: json["tn120"],
        tn130: json["tn130"],
        tn131: json["tn131"],
        tn123: json["tn123"],
        t101: T101.fromJson(json["t101"]),
        ft300: List<Ft300>.from(json["ft300"].map((x) => Ft300.fromJson(x))),
        insInf: InsInf.fromJson(json["insInf"]),
        tn134: json["tn134"],
        promsNumb: json["promsNumb"],
        rates: Rates.fromJson(json["rates"]),
        maxSlotBooking: json["maxSlotBooking"],
        remainSlot: json["remainSlot"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "currency": currency,
        "id": id,
        "pp100": pp100,
        "pb100": pb100,
        "tv101": tv101,
        "tv102": tv102,
        "t550": t550.toJson(),
        "tv118": tv118,
        "tn120": tn120,
        "tn130": tn130,
        "tn131": tn131,
        "tn123": tn123,
        "t101": t101.toJson(),
        "ft300": List<dynamic>.from(ft300.map((x) => x.toJson())),
        "insInf": insInf.toJson(),
        "tn134": tn134,
        "promsNumb": promsNumb,
        "rates": rates.toJson(),
        "maxSlotBooking": maxSlotBooking,
        "remainSlot": remainSlot,
      };
}

class Ft300 {
  Ft300({
    required this.tv301,
    required this.tn305,
    required this.tv306,
    required this.tv308,
    required this.id,
    required this.dl146,
    required this.dl148,
    required this.t301,
  });

  dynamic tv301;
  int tn305;
  String tv306;
  String tv308;
  String id;
  dynamic dl146;
  dynamic dl148;
  T301 t301;

  factory Ft300.fromJson(Map<String, dynamic> json) => Ft300(
        tv301: json["tv301"],
        tn305: json["tn305"],
        tv306: json["tv306"],
        tv308: json["tv308"],
        id: json["id"],
        dl146: json["dl146"],
        dl148: json["dl148"],
        t301: T301.fromJson(json["t301"]),
      );

  Map<String, dynamic> toJson() => {
        "tv301": tv301,
        "tn305": tn305,
        "tv306": tv306,
        "tv308": tv308,
        "id": id,
        "dl146": dl146,
        "dl148": dl148,
        "t301": t301.toJson(),
      };
}

class T301 {
  T301({
    required this.lang,
    required this.tv302,
    required this.tv303,
    required this.tv304,
    required this.dl146,
    required this.dl148,
    required this.id,
  });

  String lang;
  String tv302;
  String tv303;
  List<String> tv304;
  DateTime dl146;
  DateTime? dl148;
  String id;

  factory T301.fromJson(Map<String, dynamic> json) => T301(
        lang: json["lang"],
        tv302: json["tv302"],
        tv303: json["tv303"],
        tv304: List<String>.from(json["tv304"].map((x) => x)),
        dl146: DateTime.parse(json["dl146"]),
        dl148: json["dl148"] == null ? null : DateTime.parse(json["dl148"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tv302": tv302,
        "tv303": tv303,
        "tv304": List<dynamic>.from(tv304.map((x) => x)),
        "dl146": dl146.toIso8601String(),
        "dl148": dl148 ?? '',
        "id": id,
      };
}

class InsInf {
  InsInf({
    required this.bv501,
    required this.bd502,
    required this.bd503,
    required this.bn504,
    required this.bn505,
    required this.fbn506,
    required this.bn509,
    required this.b503,
    required this.id,
  });

  String bv501;
  DateTime bd502;
  DateTime bd503;
  int bn504;
  int bn505;
  List<int> fbn506;
  int bn509;
  B503 b503;
  String id;

  factory InsInf.fromJson(Map<String, dynamic> json) => InsInf(
        bv501: json["bv501"],
        bd502: DateTime.parse(json["bd502"]),
        bd503: DateTime.parse(json["bd503"]),
        bn504: json["bn504"],
        bn505: json["bn505"],
        fbn506: List<int>.from(json["fbn506"].map((x) => x)),
        bn509: json["bn509"],
        b503: B503.fromJson(json["b503"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "bv501": bv501,
        "bd502": bd502.toIso8601String(),
        "bd503": bd503.toIso8601String(),
        "bn504": bn504,
        "bn505": bn505,
        "fbn506": List<dynamic>.from(fbn506.map((x) => x)),
        "bn509": bn509,
        "b503": b503.toJson(),
        "id": id,
      };
}

class B503 {
  B503({
    required this.lang,
    required this.bv501,
    required this.id,
  });

  String lang;
  String bv501;
  String id;

  factory B503.fromJson(Map<String, dynamic> json) => B503(
        lang: json["lang"],
        bv501: json["bv501"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "bv501": bv501,
        "id": id,
      };
}

class Rates {
  Rates({
    required this.adultRate,
    required this.childRate,
    required this.kidRate,
    required this.promPerc,
    required this.rateProm,
    required this.total,
    required this.totalBase,
    required this.currency,
  });

  int adultRate;
  int childRate;
  int kidRate;
  int promPerc;
  int rateProm;
  int total;
  int totalBase;
  String currency;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        adultRate: json["adultRate"],
        childRate: json["childRate"],
        kidRate: json["kidRate"],
        promPerc: json["promPerc"],
        rateProm: json["rateProm"],
        total: json["total"],
        totalBase: json["totalBase"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "adultRate": adultRate,
        "childRate": childRate,
        "kidRate": kidRate,
        "promPerc": promPerc,
        "rateProm": rateProm,
        "total": total,
        "totalBase": totalBase,
        "currency": currency,
      };
}

class T101 {
  T101({
    required this.lang,
    required this.tv151,
    required this.tv152,
    required this.tv153,
    required this.tv154,
    required this.tv159,
    required this.id,
  });

  String lang;
  String tv151;
  String tv152;
  String tv153;
  String tv154;
  String tv159;
  String id;

  factory T101.fromJson(Map<String, dynamic> json) => T101(
        lang: json["lang"],
        tv151: json["tv151"],
        tv152: json["tv152"],
        tv153: json["tv153"],
        tv154: json["tv154"],
        tv159: json["tv159"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tv151": tv151,
        "tv152": tv152,
        "tv153": tv153,
        "tv154": tv154,
        "tv159": tv159,
        "id": id,
      };
}

class T550 {
  T550({
    required this.pp100,
    required this.t551,
    required this.id,
  });

  String pp100;
  T551 t551;
  String id;

  factory T550.fromJson(Map<String, dynamic> json) => T550(
        pp100: json["pp100"],
        t551: T551.fromJson(json["t551"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "pp100": pp100,
        "t551": t551.toJson(),
        "id": id,
      };
}

class T551 {
  T551({
    required this.lang,
    required this.tv552,
    required this.id,
  });

  String lang;
  String tv552;
  String id;

  factory T551.fromJson(Map<String, dynamic> json) => T551(
        lang: json["lang"],
        tv552: json["tv552"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tv552": tv552,
        "id": id,
      };
}
