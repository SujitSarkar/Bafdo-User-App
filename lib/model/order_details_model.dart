import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

class OrderDetailsModel {
  OrderDetailsModel({
    this.data,
    this.success,
    this.status,
  });

  List<OrderDetails>? data;
  bool? success;
  int? status;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    data: List<OrderDetails>.from(json["data"].map((x) => OrderDetails.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );
}

class OrderDetails {
  OrderDetails({
    this.id,
    this.code,
    this.userId,
    this.shippingAddress,
    this.paymentType,
    this.shippingType,
    this.shippingTypeString,
    this.paymentStatus,
    this.paymentStatusString,
    this.deliveryStatus,
    this.deliveryStatusString,
    this.grandTotal,
    this.couponDiscount,
    this.shippingCost,
    this.subtotal,
    this.tax,
    this.date,
    this.cancelRequest,
    this.links,
  });

  int? id;
  String? code;
  int? userId;
  ShippingAddress? shippingAddress;
  String? paymentType;
  dynamic shippingType;
  String? shippingTypeString;
  String? paymentStatus;
  String? paymentStatusString;
  String? deliveryStatus;
  String? deliveryStatusString;
  String? grandTotal;
  String? couponDiscount;
  String? shippingCost;
  String? subtotal;
  String? tax;
  String? date;
  bool? cancelRequest;
  Links? links;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    id: json["id"],
    code: json["code"],
    userId: json["user_id"],
    shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
    paymentType: json["payment_type"],
    shippingType: json["shipping_type"],
    shippingTypeString: json["shipping_type_string"],
    paymentStatus: json["payment_status"],
    paymentStatusString: json["payment_status_string"],
    deliveryStatus: json["delivery_status"],
    deliveryStatusString: json["delivery_status_string"],
    grandTotal: json["grand_total"],
    couponDiscount: json["coupon_discount"],
    shippingCost: json["shipping_cost"],
    subtotal: json["subtotal"],
    tax: json["tax"],
    date: json["date"],
    cancelRequest: json["cancel_request"],
    links: Links.fromJson(json["links"]),
  );
}

class Links {
  Links({
    this.details,
  });
  String? details;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    details: json["details"],
  );
}

class ShippingAddress {
  ShippingAddress({
    this.id,
    this.userId,
    this.address,
    this.country,
    this.city,
    this.longitude,
    this.latitude,
    this.postalCode,
    this.phone,
    this.setDefault,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
  });

  int? id;
  int? userId;
  String? address;
  String? country;
  String? city;
  dynamic longitude;
  dynamic latitude;
  String? postalCode;
  String? phone;
  int? setDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  dynamic email;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    id: json["id"],
    userId: json["user_id"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    postalCode: json["postal_code"],
    phone: json["phone"],
    setDefault: json["set_default"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    email: json["email"],
  );
}
