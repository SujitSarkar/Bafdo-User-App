import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    this.name,
    this.ownerId,
    this.cartItems,
  });

  String? name;
  int? ownerId;
  List<CartItem>? cartItems;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    name: json["name"],
    ownerId: json["owner_id"],
    cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "owner_id": ownerId,
    "cart_items": List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  };
}

class CartItem {
  CartItem({
    this.id,
    this.ownerId,
    this.userId,
    this.productId,
    this.productName,
    this.productThumbnailImage,
    this.variation,
    this.price,
    this.currencySymbol,
    this.tax,
    this.shippingCost,
    this.quantity,
    this.lowerLimit,
    this.upperLimit,
  });

  int? id;
  int? ownerId;
  int? userId;
  int? productId;
  String? productName;
  String? productThumbnailImage;
  dynamic variation;
  int? price;
  String? currencySymbol;
  int? tax;
  int? shippingCost;
  int? quantity;
  int? lowerLimit;
  int? upperLimit;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    ownerId: json["owner_id"],
    userId: json["user_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productThumbnailImage: json["product_thumbnail_image"],
    variation: json["variation"],
    price: json["price"],
    currencySymbol: json["currency_symbol"],
    tax: json["tax"],
    shippingCost: json["shipping_cost"],
    quantity: json["quantity"],
    lowerLimit: json["lower_limit"],
    upperLimit: json["upper_limit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "user_id": userId,
    "product_id": productId,
    "product_name": productName,
    "product_thumbnail_image": productThumbnailImage,
    "variation": variation,
    "price": price,
    "currency_symbol": currencySymbol,
    "tax": tax,
    "shipping_cost": shippingCost,
    "quantity": quantity,
    "lower_limit": lowerLimit,
    "upper_limit": upperLimit,
  };
}