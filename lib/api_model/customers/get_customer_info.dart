import 'dart:convert';

import 'package:flutter/material.dart';

GetAllCinfo getAllCinfoFromJson(String str) => GetAllCinfo.fromJson(json.decode(str));

String getAllCinfoToJson(GetAllCinfo data) => json.encode(data.toJson());

class GetAllCinfo {
  bool success;
  String message;
  DateTime date;
  int totalCustomer;
  List<Customer_info> customers;

  GetAllCinfo({
    required this.success,
    required this.message,
    required this.date,
    required this.totalCustomer,
    required this.customers,
  });

  factory GetAllCinfo.fromJson(Map<String, dynamic> json) => GetAllCinfo(
    success: json["success"],
    message: json["message"],
    date: DateTime.parse(json["date"]),
    totalCustomer: json["total_customer"],
    customers: List<Customer_info>.from(json["customers"].map((x) => Customer_info.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "date": date.toIso8601String(),
    "total_customer": totalCustomer,
    "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
  };
}

class Customer_info {
  String customerId;
  String customerTypeId;
  String customerName;
  String customerName2;
  String customerMobileNo;
  String customerGstin;
  double totalAmount;
  String transactionType1;
  String transactionType;
  String transactionType2;
  String customerEmail;
  String customerAddress;
  String userId;
  String customerPhoto;
  String customerRemark;
  String companyId;
  String customerCode;
  String msgLink;
  String msgText;
  int isActive;
  int isFavorite;
  int isDelete;
  DateTime dateModified;
  String dateAdded;

  Customer_info({
    required this.customerId,
    required this.customerTypeId,
    required this.customerName,
    required this.customerName2,
    required this.customerMobileNo,
    required this.customerGstin,
    required this.totalAmount,
    required this.transactionType1,
    required this.transactionType,
    required this.transactionType2,
    required this.customerEmail,
    required this.customerAddress,
    required this.userId,
    required this.customerPhoto,
    required this.customerRemark,
    required this.companyId,
    required this.customerCode,
    required this.msgLink,
    required this.msgText,
    required this.isActive,
    required this.isFavorite,
    required this.isDelete,
    required this.dateModified,
    required this.dateAdded,
  });
gettypecolor(){
  return transactionType == "Due" ? Colors.red : Colors.green ;
}
  factory Customer_info.fromJson(Map<String, dynamic> json) => Customer_info(
    customerId: json["customer_id"],
    customerTypeId: json["customer_type_id"],
    customerName: json["customer_name"],
    customerName2: json["customer_name2"],
    customerMobileNo: json["customer_mobile_no"],
    customerGstin: json["customer_gstin"],
    totalAmount: json["total_amount"].toDouble(),
    transactionType1: json["transaction_type_1"],
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
    customerEmail: json["customer_email"],
    customerAddress: json["customer_address"],
    userId: json["user_id"],
    customerPhoto: json["customer_photo"],
    customerRemark: json["customer_remark"],
    companyId: json["company_id"],
    customerCode: json["customer_code"],
    msgLink: json["msg_link"],
    msgText: json["msg_text"],
    isActive: json["is_active"],
    isFavorite: json["is_favorite"],
    isDelete: json["is_delete"],
    dateModified: DateTime.parse(json["date_modified"]),
    dateAdded: json["date_added"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "customer_type_id": customerTypeId,
    "customer_name": customerName,
    "customer_name2": customerName2,
    "customer_mobile_no": customerMobileNo,
    "customer_gstin": customerGstin,
    "total_amount": totalAmount,
    "transaction_type_1": transactionType1,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
    "customer_email": customerEmail,
    "customer_address": customerAddress,
    "user_id": userId,
    "customer_photo": customerPhoto,
    "customer_remark": customerRemark,
    "company_id": companyId,
    "customer_code": customerCode,
    "msg_link": msgLink,
    "msg_text": msgText,
    "is_active": isActive,
    "is_favorite": isFavorite,
    "is_delete": isDelete,
    "date_modified": dateModified.toIso8601String(),
    "date_added": dateAdded,
  };
}