// To parse this JSON data, do
//
//     final slaseandpurchasemodelclass = slaseandpurchasemodelclassFromJson(jsonString);

import 'dart:convert';

Slaseandpurchasemodelclass slaseandpurchasemodelclassFromJson(String str) => Slaseandpurchasemodelclass.fromJson(json.decode(str));

String slaseandpurchasemodelclassToJson(Slaseandpurchasemodelclass data) => json.encode(data.toJson());

class Slaseandpurchasemodelclass {
  String message;
  bool success;
  List<Summery> summery;

  Slaseandpurchasemodelclass({
    required this.message,
    required this.success,
    required this.summery,
  });

  factory Slaseandpurchasemodelclass.fromJson(Map<String, dynamic> json) => Slaseandpurchasemodelclass(
    message: json["message"],
    success: json["success"],
    summery: List<Summery>.from(json["summery"].map((x) => Summery.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "summery": List<dynamic>.from(summery.map((x) => x.toJson())),
  };
}

class Summery {
  String month;
  double payable;
  double purchase;
  double purchasePayment;
  double receivable;
  double sales;
  double salesPayment;
  String transactionDate;

  Summery({
    required this.month,
    required this.payable,
    required this.purchase,
    required this.purchasePayment,
    required this.receivable,
    required this.sales,
    required this.salesPayment,
    required this.transactionDate,
  });

  factory Summery.fromJson(Map<String, dynamic> json) => Summery(
    month: json["month"],
    payable: json["payable"]?.toDouble(),
    purchase: json["purchase"]?.toDouble(),
    purchasePayment: json["purchase_payment"]?.toDouble(),
    receivable: json["receivable"]?.toDouble(),
    sales: json["sales"]?.toDouble(),
    salesPayment: json["sales_payment"]?.toDouble(),
    transactionDate: json["transaction_date"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "payable": payable,
    "purchase": purchase,
    "purchase_payment": purchasePayment,
    "receivable": receivable,
    "sales": sales,
    "sales_payment": salesPayment,
    "transaction_date": transactionDate,
  };
}
