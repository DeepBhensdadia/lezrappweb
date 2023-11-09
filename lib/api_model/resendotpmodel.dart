// To parse this JSON data, do
//
//     final resendotpmodel = resendotpmodelFromJson(jsonString);

import 'dart:convert';

Resendotpmodel resendotpmodelFromJson(String str) => Resendotpmodel.fromJson(json.decode(str));

String resendotpmodelToJson(Resendotpmodel data) => json.encode(data.toJson());

class Resendotpmodel {
  String? message;
  String? type;

  Resendotpmodel({
    this.message,
    this.type,
  });

  factory Resendotpmodel.fromJson(Map<String, dynamic> json) => Resendotpmodel(
    message: json["message"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "type": type,
  };
}
