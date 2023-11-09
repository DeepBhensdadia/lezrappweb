// To parse this JSON data, do
//
//     final deletexpencedata = deletexpencedataFromJson(jsonString);

import 'dart:convert';

Deletexpencedata deletexpencedataFromJson(String str) => Deletexpencedata.fromJson(json.decode(str));

String deletexpencedataToJson(Deletexpencedata data) => json.encode(data.toJson());

class Deletexpencedata {
  bool? success;
  String? message;

  Deletexpencedata({
    this.success,
    this.message,
  });

  factory Deletexpencedata.fromJson(Map<String, dynamic> json) => Deletexpencedata(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success ?? "",
    "message": message ?? "",
  };
}
