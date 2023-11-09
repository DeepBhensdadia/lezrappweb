// To parse this JSON data, do
//
//     final deletestaffmodel = deletestaffmodelFromJson(jsonString);

import 'dart:convert';

Deletestaffmodel deletestaffmodelFromJson(String str) => Deletestaffmodel.fromJson(json.decode(str));

String deletestaffmodelToJson(Deletestaffmodel data) => json.encode(data.toJson());

class Deletestaffmodel {
  bool success;
  String message;
  List<dynamic> data;

  Deletestaffmodel({
   required this.success,
   required this.message,
   required this.data,
  });

  factory Deletestaffmodel.fromJson(Map<String, dynamic> json) => Deletestaffmodel(
    success: json["success"],
    message: json["message"],
    data:json["data"] != null ? List<dynamic>.from(json["data"].map((x) => x)) : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
