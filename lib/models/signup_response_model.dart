// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) => SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) => json.encode(data.toJson());

class SignUpResponseModel {
  bool success;
  String message;
  Data data;

  SignUpResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String accessToken;
  User user;
  String tokenType;

  Data({
    required this.accessToken,
    required this.user,
    required this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user.toJson(),
        "token_type": tokenType,
      };
}

class User {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  dynamic dialCode;
  dynamic countryCode;
  dynamic mobile;
  dynamic countryName;
  dynamic city;
  dynamic state;
  dynamic zip;
  dynamic address;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

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
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        dialCode: json["dial_code"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        countryName: json["country_name"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        address: json["address"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
