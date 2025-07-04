// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  bool success;
  List<String> message;
  Data data;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"],
        message: List<String>.from(json["message"].map((x) => x)),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x)),
        "data": data.toJson(),
      };
}

class Data {
  User user;
  String accessToken;
  String tokenType;

  Data({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}

class User {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String dialCode;
  String countryCode;
  String mobile;
  String countryName;
  String city;
  String state;
  String zip;
  String address;
  int status;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.dialCode,
    required this.countryCode,
    required this.mobile,
    required this.countryName,
    required this.city,
    required this.state,
    required this.zip,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        dialCode: json["dial_code"] ?? '',
        countryCode: json["country_code"] ?? '',
        mobile: json["mobile"] ?? '',
        countryName: json["country_name"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        zip: json["zip"] ?? '',
        address: json["address"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "dial_code": dialCode,
        "country_code": countryCode,
        "mobile": mobile,
        "country_name": countryName,
        "city": city,
        "state": state,
        "zip": zip,
        "address": address,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
