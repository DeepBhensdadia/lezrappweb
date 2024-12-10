// To parse this JSON data, do
//
//     final todaystransaction = todaystransactionFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

import '../api/const_apis.dart';

Todaystransaction todaystransactionFromJson(String str) => Todaystransaction.fromJson(json.decode(str));

String todaystransactionToJson(Todaystransaction data) => json.encode(data.toJson());

class Todaystransaction {
  bool? success;
  List<Transaction> transactions;
  String? message;

  Todaystransaction({
    this.success,
   required this.transactions,
    this.message,
  });

  factory Todaystransaction.fromJson(Map<String, dynamic> json) => Todaystransaction(
    success: json["success"],
    transactions: json["transactions"] != null ? List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))):[],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "transactions": List<dynamic>.from(transactions!.map((x) => x.toJson())),
    "message": message,
  };
}

class Transaction {
  String? transactionId;
  String? customerId;
  String? companyName;
  String? userName;
  String? customerTypeId;
  String? customerName;
  String? customerMobileNo;
  String? remark;
  String? transactionDate;
  String? transactionDateFormatted;
  DateTime? dueDate;
  String? dueDateFormatted;
  int? amount;
  String? transactionType;
  String? transactionType2;

  Transaction({
    this.transactionId,
    this.customerId,
    this.companyName,
    this.userName,
    this.customerTypeId,
    this.customerName,
    this.customerMobileNo,
    this.remark,
    this.transactionDate,
    this.transactionDateFormatted,
    this.dueDate,
    this.dueDateFormatted,
    this.amount,
    this.transactionType,
    this.transactionType2,
  });
  getusername(){
    return userName == "false" ? "Admin" : userName;
  }
  getAmount(){
    return getformettedamount(text: "${amount} ${transactionType}") ;
  }

  getAmountColor(){
    return transactionType =="Due"? Colors.red : Colors.green;
  }
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transaction_id"],
    customerId: json["customer_id"],
    companyName: json["company_name"],
    userName: json["user_name"],
    customerTypeId: json["customer_type_id"],
    customerName: json["customer_name"],
    customerMobileNo: json["customer_mobile_no"],
    remark: json["remark"],
    transactionDate: json["transaction_date"],
    transactionDateFormatted: json["transaction_date_formatted"],
    dueDate: DateTime.parse(json["due_date"]),
    dueDateFormatted: json["due_date_formatted"],
    amount: json["amount"],
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "customer_id": customerId,
    "company_name": companyName,
    "user_name": userName,
    "customer_type_id": customerTypeId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "remark": remark,
    "transaction_date": transactionDate,
    "transaction_date_formatted": transactionDateFormatted,
    "due_date": "${dueDate?.year.toString().padLeft(4, '0')}-${dueDate?.month.toString().padLeft(2, '0')}-${dueDate?.day.toString().padLeft(2, '0')}",
    "due_date_formatted": dueDateFormatted,
    "amount": amount,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}
