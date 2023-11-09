// To parse this JSON data, do
//
//     final addtranctiondata = addtranctiondataFromJson(jsonString);

import 'dart:convert';

Addtranctiondata addtranctiondataFromJson(String str) => Addtranctiondata.fromJson(json.decode(str));

String addtranctiondataToJson(Addtranctiondata data) => json.encode(data.toJson());

class Addtranctiondata {
  bool? success;
  String? message;
  int? transactionId;

  Addtranctiondata({
    this.success,
    this.message,
    this.transactionId,
  });

  factory Addtranctiondata.fromJson(Map<String, dynamic> json) => Addtranctiondata(
    success: json["success"]??false,
    message: json["message"]??"",
    transactionId: json["transaction_id"]??0,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "transaction_id": transactionId,
  };
}
