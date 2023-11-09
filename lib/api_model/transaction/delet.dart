// To parse this JSON data, do
//
//     final deleteTransactionDetail = deleteTransactionDetailFromJson(jsonString);

import 'dart:convert';

DeleteTransactionDetail deleteTransactionDetailFromJson(String str) => DeleteTransactionDetail.fromJson(json.decode(str));

String deleteTransactionDetailToJson(DeleteTransactionDetail data) => json.encode(data.toJson());

class DeleteTransactionDetail {
  bool success;
  String message;

  DeleteTransactionDetail({
    required this.success,
    required this.message,
  });

  factory DeleteTransactionDetail.fromJson(Map<String, dynamic> json) => DeleteTransactionDetail(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
