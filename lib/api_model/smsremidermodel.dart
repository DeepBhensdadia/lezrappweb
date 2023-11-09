// To parse this JSON data, do
//
//     final smsremider = smsremiderFromJson(jsonString);

import 'dart:convert';

Smsremider smsremiderFromJson(String str) => Smsremider.fromJson(json.decode(str));

String smsremiderToJson(Smsremider data) => json.encode(data.toJson());

class Smsremider {
  bool success;
  String message;

  Smsremider({
  required  this.success,
  required  this.message,
  });

  factory Smsremider.fromJson(Map<String, dynamic> json) => Smsremider(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
