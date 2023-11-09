// To parse this JSON data, do
//
//     final salespaymentcustomerchart = salespaymentcustomerchartFromJson(jsonString);

import 'dart:convert';

Salespaymentcustomerchart salespaymentcustomerchartFromJson(String str) => Salespaymentcustomerchart.fromJson(json.decode(str));

String salespaymentcustomerchartToJson(Salespaymentcustomerchart data) => json.encode(data.toJson());

class Salespaymentcustomerchart {
  bool success;
  String message;
  List<String> months;
  List<int> paidAmount;
  List<double> payableAmount;
  List<List<dynamic>> data;

  Salespaymentcustomerchart({
    required this.success,
    required this.message,
    required this.months,
    required this.paidAmount,
    required this.payableAmount,
    required this.data,
  });

  factory Salespaymentcustomerchart.fromJson(Map<String, dynamic> json) => Salespaymentcustomerchart(
    success: json["success"],
    message: json["message"],
    months: List<String>.from(json["months"].map((x) => x)),
    paidAmount: List<int>.from(json["paid_amount"].map((x) => x)),
    payableAmount: List<double>.from(json["payable_amount"].map((x) => x?.toDouble())),
    data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "months": List<dynamic>.from(months.map((x) => x)),
    "paid_amount": List<dynamic>.from(paidAmount.map((x) => x)),
    "payable_amount": List<dynamic>.from(payableAmount.map((x) => x)),
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
