import 'package:equatable/equatable.dart';

class ServiceAccompaniedModel extends Equatable {
  String? idSelectedMenuItem;
  String? id;
  String? currency;
  String? pt100;
  String? pn100;
  String? pp100;
  String? pt250;
  String? tv451;
  int? tn452;
  T250? t250;
  DateTime? dl146;
  String? dl147;
  ServiceAccompaniedModel({
    this.idSelectedMenuItem,
    this.id = '',
    this.pn100 = '',
    this.dl147 = '',
    this.dl146,
    this.currency = '',
    this.t250,
    this.pp100 = '',
    this.pt100 = '',
    this.pt250 = '',
    this.tn452 = 0,
    this.tv451 = '',
  });

  @override
  List<Object?> get props => [];

  ServiceAccompaniedModel copyWith({
    String? idSelectedMenuItem,
    String? currency,
    String? pt100,
    String? pn100,
    String? pp100,
    String? pt250,
    String? tv451,
    int? tn452,
    String? id,
    DateTime? dl146,
    String? dl147,
  }) {
    return ServiceAccompaniedModel(
      idSelectedMenuItem: idSelectedMenuItem ?? this.idSelectedMenuItem,
      currency: currency ?? this.currency,
      pt250: pt250 ?? this.pt250,
      pt100: pt100 ?? this.pt100,
      pn100: pn100 ?? this.pn100,
      pp100: pp100 ?? this.pp100,
      tn452: tn452 ?? this.tn452,
      tv451: tv451 ?? this.tv451,
      id: id ?? this.id,
      dl146: dl146 ?? this.dl146,
      dl147: dl147 ?? this.dl147,
    );
  }
}

class T250 {
  T250({
    this.t251,
    this.tv253,
    this.tv254,
    this.pt150,
    this.tv255,
    this.tn256,
    this.id,
  });

  T251? t251;
  String? tv253;
  String? tv254;
  String? pt150;
  String? tv255;
  int? tn256;
  String? id;
}

class T251 {
  T251({
    this.lang,
    this.tv251,
  });

  String? lang;
  String? tv251;
}
