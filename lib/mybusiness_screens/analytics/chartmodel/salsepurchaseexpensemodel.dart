// To parse this JSON data, do
//
//     final salespurchaseexpenseschart = salespurchaseexpenseschartFromJson(jsonString);

import 'dart:convert';

Salespurchaseexpenseschart salespurchaseexpenseschartFromJson(String str) => Salespurchaseexpenseschart.fromJson(json.decode(str));

String salespurchaseexpenseschartToJson(Salespurchaseexpenseschart data) => json.encode(data.toJson());

class Salespurchaseexpenseschart {
  bool success;
  String message;
  List<String> months;
  List<dynamic> sales;
  List<dynamic> purchases;
  List<dynamic> expenses;
  List<List<dynamic>> data;

  Salespurchaseexpenseschart({
    required this.success,
    required this.message,
    required this.months,
    required this.sales,
    required this.purchases,
    required this.expenses,
    required this.data,
  });

  factory Salespurchaseexpenseschart.fromJson(Map<String, dynamic> json) => Salespurchaseexpenseschart(
    success: json["success"],
    message: json["message"],
    months: List<String>.from(json["months"].map((x) => x)),
    sales: List<dynamic>.from(json["sales"].map((x) => x)),
    purchases: List<dynamic>.from(json["purchases"].map((x) => x)),
    expenses: List<dynamic>.from(json["expenses"].map((x) => x)),
    data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "months": List<dynamic>.from(months.map((x) => x)),
    "sales": List<dynamic>.from(sales.map((x) => x)),
    "purchases": List<dynamic>.from(purchases.map((x) => x)),
    "expenses": List<dynamic>.from(expenses.map((x) => x)),
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
