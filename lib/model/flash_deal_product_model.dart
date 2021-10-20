import 'dart:convert';

FlashDealProductModel flashDealProductModelFromJson(String str) => FlashDealProductModel.fromJson(json.decode(str));

String productListToJson(FlashDealProductModel data) => json.encode(data.toJson());

class FlashDealProductModel {
  FlashDealProductModel({
    this.data,
    this.success,
    this.status,
  });

  Data? data;
  bool? success;
  int? status;

  factory FlashDealProductModel.fromJson(Map<String, dynamic> json) => FlashDealProductModel(
    data: Data.fromJson(json["data"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "success": success,
    "status": status,
  };
}

class Data {
  Data({
    this.title,
    this.endDate,
    this.products,
  });

  String? title;
  int? endDate;
  Products? products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    endDate: json["end_date"],
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "end_date": endDate,
    "products": products!.toJson(),
  };
}

class Products {
  Products({
    this.data,
  });

  List<FlashDealDatum>? data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    data: List<FlashDealDatum>.from(json["data"].map((x) => FlashDealDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FlashDealDatum {
  FlashDealDatum({
    this.id,
    this.name,
    this.photos,
    this.thumbnailImage,
    this.basePrice,
    this.baseDiscountedPrice,
    this.todaysDeal,
    this.featured,
    this.unit,
    this.discount,
    this.discountType,
    this.rating,
    this.sales,
    this.links,
  });

  int? id;
  String? name;
  List<String>? photos;
  String? thumbnailImage;
  int? basePrice;
  int? baseDiscountedPrice;
  int? todaysDeal;
  int? featured;
  String? unit;
  int? discount;
  String? discountType;
  int? rating;
  int? sales;
  Links? links;

  factory FlashDealDatum.fromJson(Map<String, dynamic> json) => FlashDealDatum(
    id: json["id"],
    name: json["name"],
    photos: List<String>.from(json["photos"].map((x) => x)),
    thumbnailImage: json["thumbnail_image"],
    basePrice: json["base_price"],
    baseDiscountedPrice: json["base_discounted_price"],
    todaysDeal: json["todays_deal"],
    featured: json["featured"],
    unit: json["unit"],
    discount: json["discount"],
    discountType: json["discount_type"],
    rating: json["rating"],
    sales: json["sales"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photos": List<dynamic>.from(photos!.map((x) => x)),
    "thumbnail_image": thumbnailImage,
    "base_price": basePrice,
    "base_discounted_price": baseDiscountedPrice,
    "todays_deal": todaysDeal,
    "featured": featured,
    "unit": unit,
    "discount": discount,
    "discount_type": discountType,
    "rating": rating,
    "sales": sales,
    "links": links!.toJson(),
  };
}

class Links {
  Links({
    this.details,
    this.reviews,
    this.related,
    this.topFromSeller,
  });

  String? details;
  String? reviews;
  String? related;
  String? topFromSeller;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    details: json["details"],
    reviews: json["reviews"],
    related: json["related"],
    topFromSeller: json["top_from_seller"],
  );

  Map<String, dynamic> toJson() => {
    "details": details,
    "reviews": reviews,
    "related": related,
    "top_from_seller": topFromSeller,
  };
}
