// To parse this JSON data, do
//
//     final mediaTourModel = mediaTourModelFromJson(jsonString);

import 'dart:convert';

MediaTourModel mediaTourModelFromJson(String str) =>
    MediaTourModel.fromJson(json.decode(str));

String mediaTourModelToJson(MediaTourModel data) => json.encode(data.toJson());

class MediaTourModel {
  MediaTourModel({
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

  factory MediaTourModel.fromJson(Map<String, dynamic> json) => MediaTourModel(
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
    required this.pt100,
    required this.pp100,
    required this.path,
    required this.thumb,
    required this.width,
    required this.height,
    required this.id,
  });

  String pt100;
  String pp100;
  String path;
  String thumb;
  int width;
  int height;
  String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pt100: json["pt100"],
        pp100: json["pp100"],
        path: json["path"],
        thumb: json["thumb"],
        width: json["width"],
        height: json["height"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "pt100": pt100,
        "pp100": pp100,
        "path": path,
        "thumb": thumb,
        "width": width,
        "height": height,
        "id": id,
      };
}
