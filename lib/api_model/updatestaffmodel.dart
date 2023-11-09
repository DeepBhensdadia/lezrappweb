// To parse this JSON data, do
//
//     final updatestaffmodel = updatestaffmodelFromJson(jsonString);

import 'dart:convert';

Updatestaffmodel updatestaffmodelFromJson(String str) =>
    Updatestaffmodel.fromJson(json.decode(str));

String updatestaffmodelToJson(Updatestaffmodel data) =>
    json.encode(data.toJson());

class Updatestaffmodel {
  bool? success;
  String? message;
  User? user;

  Updatestaffmodel({
    this.success,
    this.message,
    this.user,
  });

  factory Updatestaffmodel.fromJson(Map<String, dynamic> json) =>
      Updatestaffmodel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        user:json["user"] != [] ? User() : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  String? companyUserId;
  String? userName;
  String? mobileNo;
  String? emailId;
  String? userId;
  String? image;
  String? companyIds;
  dynamic isActive;
  String? dateAdded;
  String? dateModified;

  User({
    this.companyUserId,
    this.userName,
    this.mobileNo,
    this.emailId,
    this.userId,
    this.image,
    this.companyIds,
    this.isActive,
    this.dateAdded,
    this.dateModified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        companyUserId: json["company_user_id"].toString(),
        userName: json["user_name"].toString(),
        mobileNo: json["mobile_no"].toString(),
        emailId: json["email_id"].toString(),
        userId: json["user_id"].toString(),
        image: json["image"].toString(),
        companyIds: json["company_ids"].toString(),
        isActive: json["is_active"] ,
        dateAdded: json["date_added"].toString(),
        dateModified: json["date_modified"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "company_user_id": companyUserId,
        "user_name": userName,
        "mobile_no": mobileNo,
        "email_id": emailId,
        "user_id": userId,
        "image": image,
        "company_ids": companyIds,
        "is_active": isActive,
        "date_added": dateAdded,
        "date_modified": dateModified,
      };
}
