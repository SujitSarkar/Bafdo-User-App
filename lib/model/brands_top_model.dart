// To parse this JSON data, do
//
//     final topBrands = topBrandsFromJson(jsonString);

import 'dart:convert';

TopBrands topBrandsFromJson(String str) => TopBrands.fromJson(json.decode(str));

String topBrandsToJson(TopBrands data) => json.encode(data.toJson());

class TopBrands {
  TopBrands({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory TopBrands.fromJson(Map<String, dynamic> json) => TopBrands(
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
    this.id,
    this.name,
    this.logo,
    this.links,
  });

  int? id;
  String? name;
  String? logo;
  Links? links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "links": links!.toJson(),
  };
}

class Links {
  Links({
    this.products,
  });

  String? products;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    products: json["products"],
  );

  Map<String, dynamic> toJson() => {
    "products": products,
  };
}
