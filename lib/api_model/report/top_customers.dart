// To parse this JSON data, do
//
//     final topCustomers = topCustomersFromJson(jsonString);

import 'dart:convert';

TopCustomers topCustomersFromJson(String str) => TopCustomers.fromJson(json.decode(str));

String topCustomersToJson(TopCustomers data) => json.encode(data.toJson());

class TopCustomers {
  bool success;
  String message;
  List<Top_Customer> customers;

  TopCustomers({
    required this.success,
    required this.message,
    required this.customers,
  });

  factory TopCustomers.fromJson(Map<String, dynamic> json) => TopCustomers(
    success: json["success"],
    message: json["message"],
    customers: List<Top_Customer>.from(json["customers"].map((x) => Top_Customer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
  };
}

class Top_Customer {
  String customerId;
  String customerTypeId;
  String customerName;
  String customerMobileNo;
  String customerAddress;
  dynamic amount;
  String transactionType;
  String transactionType2;

  Top_Customer({
    required this.customerId,
    required this.customerTypeId,
    required this.customerName,
    required this.customerMobileNo,
    required this.customerAddress,
    required this.amount,
    required this.transactionType,
    required this.transactionType2,
  });

  factory Top_Customer.fromJson(Map<String, dynamic> json) => Top_Customer(
    customerId: json["customer_id"],
    customerTypeId: json["customer_type_id"],
    customerName: json["customer_name"],
    customerMobileNo: json["customer_mobile_no"],
    customerAddress: json["customer_address"],
    amount: json["amount"],
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_type_id": customerTypeId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "customer_address": customerAddress,
    "amount": amount,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}
