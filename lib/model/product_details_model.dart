// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
    this.addedBy,
    this.user,
    this.category,
    this.brand,
    this.photos,
    this.thumbnailImage,
    this.tags,
    this.priceLower,
    this.priceHigher,
    this.choiceOptions,
    this.colors,
    this.todaysDeal,
    this.featured,
    this.currentStock,
    this.unit,
    this.discount,
    this.discountType,
    this.tax,
    this.taxType,
    this.shippingType,
    this.shippingCost,
    this.numberOfSales,
    this.rating,
    this.ratingCount,
    this.description,
    this.links,
  });

  int? id;
  String? name;
  String? addedBy;
  User? user;
  Category? category;
  Brand? brand;
  List<String>? photos;
  String? thumbnailImage;
  List<String>? tags;
  int? priceLower;
  int? priceHigher;
  List<dynamic>? choiceOptions;
  List<dynamic>? colors;
  int? todaysDeal;
  int? featured;
  int? currentStock;
  String? unit;
  int? discount;
  String? discountType;
  int? tax;
  dynamic taxType;
  String? shippingType;
  int? shippingCost;
  int? numberOfSales;
  int? rating;
  int? ratingCount;
  String? description;
  DatumLinks? links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    addedBy: json["added_by"],
    user: User.fromJson(json["user"]),
    category: Category.fromJson(json["category"]),
    brand: Brand.fromJson(json["brand"]),
    photos: List<String>.from(json["photos"].map((x) => x)),
    thumbnailImage: json["thumbnail_image"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    priceLower: json["price_lower"],
    priceHigher: json["price_higher"],
    choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
    colors: List<dynamic>.from(json["colors"].map((x) => x)),
    todaysDeal: json["todays_deal"],
    featured: json["featured"],
    currentStock: json["current_stock"],
    unit: json["unit"],
    discount: json["discount"],
    discountType: json["discount_type"],
    tax: json["tax"],
    taxType: json["tax_type"],
    shippingType: json["shipping_type"],
    shippingCost: json["shipping_cost"],
    numberOfSales: json["number_of_sales"],
    rating: json["rating"],
    ratingCount: json["rating_count"],
    description: json["description"],
    links: DatumLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "added_by": addedBy,
    "user": user!.toJson(),
    "category": category!.toJson(),
    "brand": brand!.toJson(),
    "photos": List<dynamic>.from(photos!.map((x) => x)),
    "thumbnail_image": thumbnailImage,
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "price_lower": priceLower,
    "price_higher": priceHigher,
    "choice_options": List<dynamic>.from(choiceOptions!.map((x) => x)),
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "todays_deal": todaysDeal,
    "featured": featured,
    "current_stock": currentStock,
    "unit": unit,
    "discount": discount,
    "discount_type": discountType,
    "tax": tax,
    "tax_type": taxType,
    "shipping_type": shippingType,
    "shipping_cost": shippingCost,
    "number_of_sales": numberOfSales,
    "rating": rating,
    "rating_count": ratingCount,
    "description": description,
    "links": links!.toJson(),
  };
}

class Brand {
  Brand({
    this.name,
    this.logo,
    this.links,
  });

  dynamic name;
  dynamic logo;
  BrandLinks? links;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    name: json["name"],
    logo: json["logo"],
    links: BrandLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
    "links": links!.toJson(),
  };
}

class BrandLinks {
  BrandLinks({
    this.products,
  });

  dynamic products;

  factory BrandLinks.fromJson(Map<String, dynamic> json) => BrandLinks(
    products: json["products"],
  );

  Map<String, dynamic> toJson() => {
    "products": products,
  };
}

class Category {
  Category({
    this.name,
    this.banner,
    this.icon,
    this.links,
  });

  String? name;
  String? banner;
  dynamic icon;
  CategoryLinks? links;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    banner: json["banner"],
    icon: json["icon"],
    links: CategoryLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "banner": banner,
    "icon": icon,
    "links": links!.toJson(),
  };
}

class CategoryLinks {
  CategoryLinks({
    this.products,
    this.subCategories,
  });

  String? products;
  String? subCategories;

  factory CategoryLinks.fromJson(Map<String, dynamic> json) => CategoryLinks(
    products: json["products"],
    subCategories: json["sub_categories"],
  );

  Map<String, dynamic> toJson() => {
    "products": products,
    "sub_categories": subCategories,
  };
}

class DatumLinks {
  DatumLinks({
    this.reviews,
    this.related,
  });

  String? reviews;
  String? related;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    reviews: json["reviews"],
    related: json["related"],
  );

  Map<String, dynamic> toJson() => {
    "reviews": reviews,
    "related": related,
  };
}

class User {
  User({
    this.name,
    this.email,
    this.avatar,
    this.avatarOriginal,
    this.shopName,
    this.shopLogo,
    this.shopLink,
  });

  String? name;
  String? email;
  dynamic avatar;
  String? avatarOriginal;
  String? shopName;
  String? shopLogo;
  String? shopLink;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    shopName: json["shop_name"],
    shopLogo: json["shop_logo"],
    shopLink: json["shop_link"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "shop_name": shopName,
    "shop_logo": shopLogo,
    "shop_link": shopLink,
  };
}
