// To parse this JSON data, do
//
//     final sliders = slidersFromJson(jsonString);

import 'dart:convert';

Sliders slidersFromJson(String str) => Sliders.fromJson(json.decode(str));

String slidersToJson(Sliders data) => json.encode(data.toJson());

class Sliders {
  Sliders({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Datum {
  Datum({
    this.photo,
  });

  String? photo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
  };
}
