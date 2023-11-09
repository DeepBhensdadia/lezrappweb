// To parse this JSON data, do
//
//     final customeradvance = customeradvanceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Customeradvance customeradvanceFromJson(String str) => Customeradvance.fromJson(json.decode(str));

String customeradvanceToJson(Customeradvance data) => json.encode(data.toJson());

class Customeradvance {
  final bool success;
  final String message;
  final List<Customer> customers;

  Customeradvance({
    required this.success,
    required this.message,
    required this.customers,
  });

  factory Customeradvance.fromJson(Map<String, dynamic> json) => Customeradvance(
    success: json["success"],
    message: json["message"],
    customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
  };
}

class Customer {
  final String customerId;
  final String customerName;
  final String customerMobileNo;
  final dynamic amount;
  final String customerAddress;
  final String transactionType;
  final String transactionType2;

  Customer({
    required this.customerId,
    required this.customerName,
    required this.customerMobileNo,
    required this.amount,
    required this.customerAddress,
    required this.transactionType,
    required this.transactionType2,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    customerMobileNo: json["customer_mobile_no"],
    amount: json["amount"],
    customerAddress: json["customer_address"],
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "amount": amount,
    "customer_address": customerAddress,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}
