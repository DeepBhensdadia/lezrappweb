// To parse this JSON data, do
//
//     final salesbynewandoldchartmodel = salesbynewandoldchartmodelFromJson(jsonString);

import 'dart:convert';

Salesbynewandoldchartmodel salesbynewandoldchartmodelFromJson(String str) => Salesbynewandoldchartmodel.fromJson(json.decode(str));

String salesbynewandoldchartmodelToJson(Salesbynewandoldchartmodel data) => json.encode(data.toJson());

class Salesbynewandoldchartmodel {
  bool success;
  String message;
  List<int> data;

  Salesbynewandoldchartmodel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Salesbynewandoldchartmodel.fromJson(Map<String, dynamic> json) => Salesbynewandoldchartmodel(
    success: json["success"],
    message: json["message"],
    data: List<int>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
