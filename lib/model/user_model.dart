import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.result,
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.avatarOriginal,
    this.phone,
  });

  bool? result;
  int? id;
  String? name;
  dynamic email;
  dynamic avatar;
  String? avatarOriginal;
  String? phone;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    result: json["result"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "phone": phone,
  };
}
