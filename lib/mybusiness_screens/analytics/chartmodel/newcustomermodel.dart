// To parse this JSON data, do
//
//     final newcustomerchartmodel = newcustomerchartmodelFromJson(jsonString);

import 'dart:convert';

Newcustomerchartmodel newcustomerchartmodelFromJson(String str) => Newcustomerchartmodel.fromJson(json.decode(str));

String newcustomerchartmodelToJson(Newcustomerchartmodel data) => json.encode(data.toJson());

class Newcustomerchartmodel {
  bool success;
  String message;
  List<String> months;
  List<List<dynamic>> data;
  List<int> record;

  Newcustomerchartmodel({
    required this.success,
    required this.message,
    required this.months,
    required this.data,
    required this.record,
  });

  factory Newcustomerchartmodel.fromJson(Map<String, dynamic> json) => Newcustomerchartmodel(
    success: json["success"],
    message: json["message"],
    months: List<String>.from(json["months"].map((x) => x)),
    data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    record: List<int>.from(json["record"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "months": List<dynamic>.from(months.map((x) => x)),
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "record": List<dynamic>.from(record.map((x) => x)),
  };
}
