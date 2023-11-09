// To parse this JSON data, do
//
//     final sendotp = sendotpFromJson(jsonString);

import 'dart:convert';

Sendotp sendotpFromJson(String str) => Sendotp.fromJson(json.decode(str));

String sendotpToJson(Sendotp data) => json.encode(data.toJson());

class Sendotp {
  String requestId;
  String type;

  Sendotp({
    required this.requestId,
    required this.type,
  });

  factory Sendotp.fromJson(Map<String, dynamic> json) => Sendotp(
    requestId: json["request_id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "request_id": requestId,
    "type": type,
  };
}
