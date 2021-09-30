import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  WishlistModel({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
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
    this.product,
  });

  int? id;
  Product? product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product!.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.thumbnailImage,
    this.basePrice,
    this.rating,
  });

  int? id;
  String? name;
  String? thumbnailImage;
  String? basePrice;
  int? rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    thumbnailImage: json["thumbnail_image"],
    basePrice: json["base_price"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "thumbnail_image": thumbnailImage,
    "base_price": basePrice,
    "rating": rating,
  };
}