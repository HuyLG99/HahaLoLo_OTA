import 'dart:convert';

RatingModel ratingModelFromJson(String str) =>
    RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  RatingModel({
    required this.data,
  });

  List<Datum> data;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.avg,
    required this.pd304,
    required this.pn100,
    required this.pn302,
    required this.pn305,
    required this.pn306,
    required this.pn307,
    required this.pn308,
    required this.pn309,
    required this.pv303,
    required this.id,
    required this.usrInf,
  });

  double avg;
  DateTime pd304;
  String pn100;
  int pn302;
  int pn305;
  int pn306;
  int pn307;
  int pn308;
  int pn309;
  String pv303;
  String id;
  UsrInf usrInf;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        avg: json["avg"].toDouble(),
        pd304: DateTime.parse(json["pd304"]),
        pn100: json["pn100"],
        pn302: json["pn302"],
        pn305: json["pn305"],
        pn306: json["pn306"],
        pn307: json["pn307"],
        pn308: json["pn308"],
        pn309: json["pn309"],
        pv303: json["pv303"],
        id: json["id"],
        usrInf: UsrInf.fromJson(json["usrInf"]),
      );

  Map<String, dynamic> toJson() => {
        "avg": avg,
        "pd304": pd304.toIso8601String(),
        "pn100": pn100,
        "pn302": pn302,
        "pn305": pn305,
        "pn306": pn306,
        "pn307": pn307,
        "pn308": pn308,
        "pn309": pn309,
        "pv303": pv303,
        "id": id,
        "usrInf": usrInf.toJson(),
      };
}

class UsrInf {
  UsrInf({
    required this.nv203,
    required this.nv204,
    required this.nv205,
    required this.nv239,
    required this.nn270,
    required this.id,
  });

  String nv203;
  String nv204;
  String nv205;
  String nv239;
  int nn270;
  String id;

  factory UsrInf.fromJson(Map<String, dynamic> json) => UsrInf(
        nv203: json["nv203"],
        nv204: json["nv204"],
        nv205: json["nv205"],
        nv239: json["nv239"],
        nn270: json["nn270"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nv203": nv203,
        "nv204": nv204,
        "nv205": nv205,
        "nv239": nv239,
        "nn270": nn270,
        "id": id,
      };
}
