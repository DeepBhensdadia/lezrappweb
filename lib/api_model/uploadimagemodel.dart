// To parse this JSON data, do
//
//     final uploadimagemodelclass = uploadimagemodelclassFromJson(jsonString);

import 'dart:convert';

Uploadimagemodelclass uploadimagemodelclassFromJson(String str) => Uploadimagemodelclass.fromJson(json.decode(str));

String uploadimagemodelclassToJson(Uploadimagemodelclass data) => json.encode(data.toJson());

class Uploadimagemodelclass {
  bool success;
  String message;
  int transactionImageId;
  String image;

  Uploadimagemodelclass({
    required this.success,
    required this.message,
    required this.transactionImageId,
    required this.image,
  });

  factory Uploadimagemodelclass.fromJson(Map<String, dynamic> json) => Uploadimagemodelclass(
    success: json["success"],
    message: json["message"],
    transactionImageId: json["transaction_image_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "transaction_image_id": transactionImageId,
    "image": image,
  };
}
