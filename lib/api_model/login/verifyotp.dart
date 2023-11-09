// To parse this JSON data, do
//
//     final vrotp = vrotpFromJson(jsonString);

import 'dart:convert';

Vrotp vrotpFromJson(String str) => Vrotp.fromJson(json.decode(str));

String vrotpToJson(Vrotp data) => json.encode(data.toJson());

class Vrotp {
  String message;
  String type;

  Vrotp({
    required this.message,
    required this.type,
  });

  factory Vrotp.fromJson(Map<String, dynamic> json) => Vrotp(
    message: json["message"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "type": type,
  };
}
