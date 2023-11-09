// To parse this JSON data, do
//
//     final purchasepaymentsupplierchart = purchasepaymentsupplierchartFromJson(jsonString);

import 'dart:convert';

Purchasepaymentsupplierchart purchasepaymentsupplierchartFromJson(String str) => Purchasepaymentsupplierchart.fromJson(json.decode(str));

String purchasepaymentsupplierchartToJson(Purchasepaymentsupplierchart data) => json.encode(data.toJson());

class Purchasepaymentsupplierchart {
  bool success;
  String message;
  List<String> months;
  List<int> paidAmount;
  List<int> payableAmount;
  List<List<dynamic>> data;

  Purchasepaymentsupplierchart({
    required this.success,
    required this.message,
    required this.months,
    required this.paidAmount,
    required this.payableAmount,
    required this.data,
  });

  factory Purchasepaymentsupplierchart.fromJson(Map<String, dynamic> json) => Purchasepaymentsupplierchart(
    success: json["success"],
    message: json["message"],
    months: List<String>.from(json["months"].map((x) => x)),
    paidAmount: List<int>.from(json["paid_amount"].map((x) => x)),
    payableAmount: List<int>.from(json["payable_amount"].map((x) => x)),
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
