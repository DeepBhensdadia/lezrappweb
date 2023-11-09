// To parse this JSON data, do
//
//     final addstaffmodel = addstaffmodelFromJson(jsonString);

import 'dart:convert';

Addstaffmodel addstaffmodelFromJson(String str) => Addstaffmodel.fromJson(json.decode(str));

String addstaffmodelToJson(Addstaffmodel data) => json.encode(data.toJson());

class Addstaffmodel {
  bool? success;
  String? message;
  String? message123;
  String? message12323;
  List<dynamic>? data;

  Addstaffmodel({
    this.success,
    this.message,
    this.message123,
    this.message12323,
    this.data,
  });

  factory Addstaffmodel.fromJson(Map<String, dynamic> json) => Addstaffmodel(
    success: json["success"],
    message: json["message"],
    message123: json["message123"],
    message12323: json["message12323"],
    data:  json["data"] != null ? List<dynamic>.from(json["data"].map((x) => x)) : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "message123": message123,
    "message12323": message12323,
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
