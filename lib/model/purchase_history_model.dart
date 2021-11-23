import 'dart:convert';

PurchaseHistoryModel purchaseHistoryModelFromJson(String str) => PurchaseHistoryModel.fromJson(json.decode(str));

class PurchaseHistoryModel {
  PurchaseHistoryModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  List<OrderModel>? data;
  PurchaseHistoryModelLinks? links;
  Meta? meta;
  bool? success;
  int? status;

  factory PurchaseHistoryModel.fromJson(Map<String, dynamic> json) => PurchaseHistoryModel(
    data: List<OrderModel>.from(json["data"].map((x) => OrderModel.fromJson(x))),
    links: PurchaseHistoryModelLinks.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    success: json["success"],
    status: json["status"],
  );
}

class OrderModel {
  OrderModel({
    this.id,
    this.code,
    this.userId,
    this.paymentType,
    this.paymentStatus,
    this.paymentStatusString,
    this.deliveryStatus,
    this.deliveryStatusString,
    this.grandTotal,
    this.date,
    this.links,
  });

  int? id;
  String? code;
  int? userId;
  String? paymentType;
  String? paymentStatus;
  String? paymentStatusString;
  String? deliveryStatus;
  String? deliveryStatusString;
  String? grandTotal;
  String? date;
  DatumLinks? links;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    code: json["code"],
    userId: json["user_id"],
    paymentType: json["payment_type"],
    paymentStatus: json["payment_status"],
    paymentStatusString: json["payment_status_string"],
    deliveryStatus: json["delivery_status"],
    deliveryStatusString: json["delivery_status_string"],
    grandTotal: json["grand_total"],
    date: json["date"],
    links: DatumLinks.fromJson(json["links"]),
  );

}

class DatumLinks {
  DatumLinks({
    this.details,
  });

  String? details;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    details: json["details"],
  );
}

class PurchaseHistoryModelLinks {
  PurchaseHistoryModelLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory PurchaseHistoryModelLinks.fromJson(Map<String, dynamic> json) => PurchaseHistoryModelLinks(
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

}
