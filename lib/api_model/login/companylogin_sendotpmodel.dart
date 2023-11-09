// To parse this JSON data, do
//
//     final companyloginsendingotp = companyloginsendingotpFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Companyloginsendingotp companyloginsendingotpFromJson(String str) => Companyloginsendingotp.fromJson(json.decode(str));

String companyloginsendingotpToJson(Companyloginsendingotp data) => json.encode(data.toJson());

class Companyloginsendingotp {
  bool success;
  String message;
  int otp;

  Companyloginsendingotp({
    required this.success,
    required this.message,
    required this.otp,
  });

  factory Companyloginsendingotp.fromJson(Map<String, dynamic> json) => Companyloginsendingotp(
    success: json["success"],
    message: json["message"],
    otp: json["otp"] ?? 05,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "otp": otp,
  };
}
