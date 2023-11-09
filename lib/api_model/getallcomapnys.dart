// To parse this JSON data, do
//
//     final getcompanys = getcompanysFromJson(jsonString);

import 'dart:convert';

Getcompanys getcompanysFromJson(String str) => Getcompanys.fromJson(json.decode(str));

String getcompanysToJson(Getcompanys data) => json.encode(data.toJson());

class Getcompanys {
  bool? success;
  List<Company>? companies;
  String? message;

  Getcompanys({
    this.success,
    this.companies,
    this.message,
  });

  factory Getcompanys.fromJson(Map<String, dynamic> json) => Getcompanys(
    success: json["success"],
    companies:json["companies"] != null ? List<Company>.from(json["companies"].map((x) => Company.fromJson(x))) : [],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "companies": List<dynamic>.from(companies!.map((x) => x.toJson())),
    "message": message,
  };
}

class Company {
  String? companyId;
  String? companyName;
  String? isPrimaryAccount;

  Company({
    this.companyId,
    this.companyName,
    this.isPrimaryAccount,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    companyId: json["company_id"],
    companyName: json["company_name"],
    isPrimaryAccount: json["is_primary_account"],
  );

  Map<String, dynamic> toJson() => {
    "company_id": companyId,
    "company_name": companyName,
    "is_primary_account": isPrimaryAccount,
  };
}
