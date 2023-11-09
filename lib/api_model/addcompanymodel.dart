// To parse this JSON data, do
//
//     final addcompanymodel = addcompanymodelFromJson(jsonString);

import 'dart:convert';

Addcompanymodel addcompanymodelFromJson(String str) => Addcompanymodel.fromJson(json.decode(str));

String addcompanymodelToJson(Addcompanymodel data) => json.encode(data.toJson());

class Addcompanymodel {
  bool? success;
  String? message;
  String? message123;
  String? message12323;
  int? companyId;
  String? userId;

  Addcompanymodel({
     this.success,
     this.message,
     this.message123,
     this.message12323,
     this.companyId,
     this.userId,
  });

  factory Addcompanymodel.fromJson(Map<String, dynamic> json) => Addcompanymodel(
    success: json["success"],
    message: json["message"].toString(),
    message123: json["message123"].toString(),
    message12323: json["message12323"].toString(),
    companyId: json["company_id"],
    userId: json["user_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "message123": message123,
    "message12323": message12323,
    "company_id": companyId,
    "user_id": userId,
  };
}
