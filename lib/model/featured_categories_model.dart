// To parse this JSON data, do
//
//     final featuredCategories = featuredCategoriesFromJson(jsonString);

import 'dart:convert';

FeaturedCategories featuredCategoriesFromJson(String str) => FeaturedCategories.fromJson(json.decode(str));

String featuredCategoriesToJson(FeaturedCategories data) => json.encode(data.toJson());

class FeaturedCategories {
  FeaturedCategories({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory FeaturedCategories.fromJson(Map<String, dynamic> json) => FeaturedCategories(
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
    this.name,
    this.banner,
    this.icon,
    this.numberOfChildren,
    this.links,
  });

  String? name;
  String? banner;
  String? icon;
  int? numberOfChildren;
  Links? links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    banner: json["banner"],
    icon: json["icon"],
    numberOfChildren: json["number_of_children"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "banner": banner,
    "icon": icon,
    "number_of_children": numberOfChildren,
    "links": links!.toJson(),
  };
}

class Links {
  Links({
    this.products,
    this.subCategories,
  });

  String? products;
  String? subCategories;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    products: json["products"],
    subCategories: json["sub_categories"],
  );

  Map<String, dynamic> toJson() => {
    "products": products,
    "sub_categories": subCategories,
  };
}
