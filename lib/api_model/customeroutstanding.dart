// To parse this JSON data, do
//
//     final customeroutstanding = customeroutstandingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Customeroutstanding customeroutstandingFromJson(String str) => Customeroutstanding.fromJson(json.decode(str));

String customeroutstandingToJson(Customeroutstanding data) => json.encode(data.toJson());

class Customeroutstanding {
  final bool success;
  final String message;
  final List<Customer> customers;

  Customeroutstanding({
    required this.success,
    required this.message,
    required this.customers,
  });

  factory Customeroutstanding.fromJson(Map<String, dynamic> json) => Customeroutstanding(
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
  final String customerTypeId;
  final String customerAddress;
  final String transactionType;
  final String transactionType2;

  Customer({
    required this.customerId,
    required this.customerName,
    required this.customerMobileNo,
    required this.amount,
    required this.customerTypeId,
    required this.customerAddress,
    required this.transactionType,
    required this.transactionType2,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    customerMobileNo: json["customer_mobile_no"],
    amount: json["amount"],
    customerTypeId: json["customer_type_id"],
    customerAddress: json["customer_address"],
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "amount": amount,
    "customer_type_id": customerTypeId,
    "customer_address": customerAddress,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}
