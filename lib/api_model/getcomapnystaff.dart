// To parse this JSON data, do
//
//     final getallcompanystaff = getallcompanystaffFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Getallcompanystaff getallcompanystaffFromJson(String str) => Getallcompanystaff.fromJson(json.decode(str));

String getallcompanystaffToJson(Getallcompanystaff data) => json.encode(data.toJson());

class Getallcompanystaff {
  final bool success;
  final String message;
  final List<User> users;

  Getallcompanystaff({
    required this.success,
    required this.message,
    required this.users,
  });

  factory Getallcompanystaff.fromJson(Map<String, dynamic> json) => Getallcompanystaff(
    success: json["success"],
    message: json["message"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  final String companyUserId;
  final String userName;
  final String userName2;
  final String mobileNo;
  final String emailId;
  final String userId;
  final String image;
  final String companyIds;
  final dynamic lastLogin;
  final bool isActive;
  final String dateAdded;
  final String dateModified;

  User({
    required this.companyUserId,
    required this.userName,
    required this.userName2,
    required this.mobileNo,
    required this.emailId,
    required this.userId,
    required this.image,
    required this.companyIds,
    required this.lastLogin,
    required this.isActive,
    required this.dateAdded,
    required this.dateModified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    companyUserId: json["company_user_id"],
    userName: json["user_name"],
    userName2: json["user_name2"],
    mobileNo: json["mobile_no"],
    emailId: json["email_id"],
    userId: json["user_id"],
    image: json["image"],
    companyIds: json["company_ids"],
    lastLogin: json["last_login"],
    isActive: json["is_active"],
    dateAdded: json["date_added"],
    dateModified: json["date_modified"],
  );

  Map<String, dynamic> toJson() => {
    "company_user_id": companyUserId,
    "user_name": userName,
    "user_name2": userName2,
    "mobile_no": mobileNo,
    "email_id": emailId,
    "user_id": userId,
    "image": image,
    "company_ids": companyIds,
    "last_login": lastLogin,
    "is_active": isActive,
    "date_added": dateAdded,
    "date_modified": dateModified,
  };
}
