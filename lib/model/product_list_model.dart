// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    this.data,
    this.success,
    this.status,
  });

  List<ProductListDatum>? data;
  bool? success;
  int? status;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    data: List<ProductListDatum>.from(json["data"].map((x) => ProductListDatum.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class ProductListDatum {
  ProductListDatum({
    this.id,
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
    this.strokedPrice,
    this.mainPrice,
    this.rating,
    this.sales,
    this.links,
  });

  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  Links? links;

  factory ProductListDatum.fromJson(Map<String, dynamic> json) => ProductListDatum(
    id: json["id"],
    name: json["name"],
    thumbnailImage: json["thumbnail_image"],
    hasDiscount: json["has_discount"],
    strokedPrice: json["stroked_price"],
    mainPrice: json["main_price"],
    rating: json["rating"],
    sales: json["sales"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "thumbnail_image": thumbnailImage,
    "has_discount": hasDiscount,
    "stroked_price": strokedPrice,
    "main_price": mainPrice,
    "rating": rating,
    "sales": sales,
    "links": links!.toJson(),
  };
}

class Links {
  Links({
    this.details,
  });

  String? details;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "details": details,
  };
}
