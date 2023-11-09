// To parse this JSON data, do
//
//     final totalcreditreport = totalcreditreportFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Totalcreditreport totalcreditreportFromJson(String str) => Totalcreditreport.fromJson(json.decode(str));

String totalcreditreportToJson(Totalcreditreport data) => json.encode(data.toJson());

class Totalcreditreport {
  final bool success;
  final String message;
  final List<Transaction> transactions;

  Totalcreditreport({
    required this.success,
    required this.message,
    required this.transactions,
  });

  factory Totalcreditreport.fromJson(Map<String, dynamic> json) => Totalcreditreport(
    success: json["success"],
    message: json["message"],
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Transaction {
  final String transactionId;
  final String customerId;
  final String customerTypeId;
  final String customerName;
  final String customerMobileNo;
  final String dueDate;
  final String remark;
  final String transactionDate;
  final String transactionDateFormatted;
  final String dueDateFormatted;
  final dynamic amount;
  final String transactionType;
  final String transactionType2;

  Transaction({
    required this.transactionId,
    required this.customerId,
    required this.customerTypeId,
    required this.customerName,
    required this.customerMobileNo,
    required this.dueDate,
    required this.remark,
    required this.transactionDate,
    required this.transactionDateFormatted,
    required this.dueDateFormatted,
    required this.amount,
    required this.transactionType,
    required this.transactionType2,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transaction_id"]??"",
    customerId: json["customer_id"]??"",
    customerTypeId: json["customer_type_id"]??"",
    customerName: json["customer_name"]??"",
    customerMobileNo: json["customer_mobile_no"]??"",
    dueDate: json["due_date"]??"",
    remark: json["remark"]??"",
    transactionDate: json["transaction_date"]??"",
    transactionDateFormatted: json["transaction_date_formatted"]??"",
    dueDateFormatted: json["due_date_formatted"]??"",
    amount: json["amount"],
    transactionType: json["transaction_type"]??"",
    transactionType2: json["transaction_type_2"]??"",
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "customer_id": customerId,
    "customer_type_id": customerTypeId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "due_date": dueDate,
    "remark": remark,
    "transaction_date": transactionDate,
    "transaction_date_formatted": transactionDateFormatted,
    "due_date_formatted": dueDateFormatted,
    "amount": amount,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}
