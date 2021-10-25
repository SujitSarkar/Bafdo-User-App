// To parse this JSON data, do
//
//     final traditionalProductList = traditionalProductListFromJson(jsonString);

import 'dart:convert';

AnniversaryProductList anniversaryProductListFromJson(String str) => AnniversaryProductList.fromJson(json.decode(str));

String anniversaryProductListListToJson(AnniversaryProductList data) => json.encode(data.toJson());

class AnniversaryProductList {
  AnniversaryProductList({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  List<AnniversaryProductListDatum>? data;
  AnniversaryProductListLinks? links;
  Meta? meta;
  bool? success;
  int? status;

  factory AnniversaryProductList.fromJson(Map<String, dynamic> json) => AnniversaryProductList(
    data: List<AnniversaryProductListDatum>.from(json["data"].map((x) => AnniversaryProductListDatum.fromJson(x))),
    links: AnniversaryProductListLinks.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links!.toJson(),
    "meta": meta!.toJson(),
    "success": success,
    "status": status,
  };
}

class AnniversaryProductListDatum {
  AnniversaryProductListDatum({
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
  DatumLinks? links;

  factory AnniversaryProductListDatum.fromJson(Map<String, dynamic> json) => AnniversaryProductListDatum(
    id: json["id"],
    name: json["name"],
    thumbnailImage: json["thumbnail_image"],
    hasDiscount: json["has_discount"],
    strokedPrice: json["stroked_price"],
    mainPrice: json["main_price"],
    rating: json["rating"],
    sales: json["sales"],
    links: DatumLinks.fromJson(json["links"]),
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

class DatumLinks {
  DatumLinks({
    this.details,
  });

  String? details;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "details": details,
  };
}

class AnniversaryProductListLinks {
  AnniversaryProductListLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory AnniversaryProductListLinks.fromJson(Map<String, dynamic> json) => AnniversaryProductListLinks(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
