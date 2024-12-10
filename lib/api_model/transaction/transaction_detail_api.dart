// To parse this JSON data, do
//
//     final getTransactionDetail = getTransactionDetailFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../api/const_apis.dart';

GetTransactionDetail getTransactionDetailFromJson(String str) => GetTransactionDetail.fromJson(json.decode(str));

String getTransactionDetailToJson(GetTransactionDetail data) => json.encode(data.toJson());

class GetTransactionDetail {
  bool success;
  String message;
  Transactiondetai transaction;
  List<TransactionTrackingdetai> transactionTracking;

  GetTransactionDetail({
    required this.success,
    required this.message,
    required this.transaction,
    required this.transactionTracking,
  });

  factory GetTransactionDetail.fromJson(Map<String, dynamic> json) => GetTransactionDetail(
    success: json["success"],
    message: json["message"],
    transaction: Transactiondetai.fromJson(json["transaction"]),
    transactionTracking: json["transaction_tracking"] != null ? List<TransactionTrackingdetai>.from(json["transaction_tracking"].map((x) => TransactionTrackingdetai.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "transaction": transaction.toJson(),
    "transaction_tracking": List<dynamic>.from(transactionTracking.map((x) => x.toJson())),
  };
}

class Transactiondetai {
  String transactionId;
  String transactionType;
  String transactionType2;
  String customerPhoto;
  String customerName;
  String customerName2;
  String customerMobileNo;
  String customerEmail;
  String customerAddress;
  String companyUserId;
  String customerTypeId;
  String amount;
  DateTime dueDate;
  String dueDateFormatted;
  String remark;
  String customerId;
  String userId;
  String signatureFileName;
  String companyId;
  DateTime dateModified;
  List<TransactionImagedetai> transactionImages;
  List<TransactionCommentdetai> transactionComments;
  String isDelete;
  DateTime transactionDate;
  String transactionDateFormatted;
  DateTime dateAdded;

  Transactiondetai({
    required this.transactionId,
    required this.transactionType,
    required this.transactionType2,
    required this.customerPhoto,
    required this.customerName,
    required this.customerName2,
    required this.customerMobileNo,
    required this.customerEmail,
    required this.customerAddress,
    required this.companyUserId,
    required this.customerTypeId,
    required this.amount,
    required this.dueDate,
    required this.dueDateFormatted,
    required this.remark,
    required this.customerId,
    required this.userId,
    required this.signatureFileName,
    required this.companyId,
    required this.dateModified,
    required this.transactionImages,
    required this.transactionComments,
    required this.isDelete,
    required this.transactionDate,
    required this.transactionDateFormatted,
    required this.dateAdded,
  });
  getamount(){
    return getformettedamount(text: '${amount} ${transactionType}');
  }
gettypecolor(){
    return transactionType == "Due" ? Colors.red : Colors.green;
}
  factory Transactiondetai.fromJson(Map<String, dynamic> json) => Transactiondetai(
    transactionId: json["transaction_id"]??"",
    transactionType: json["transaction_type"]??"",
    transactionType2: json["transaction_type_2"]??"",
    customerPhoto: json["customer_photo"]??"",
    customerName: json["customer_name"]??"",
    customerName2: json["customer_name2"]??"",
    customerMobileNo: json["customer_mobile_no"]??"",
    customerEmail: json["customer_email"]??"",
    customerAddress: json["customer_address"]??"",
    companyUserId: json["company_user_id"]??"",
    customerTypeId: json["customer_type_id"]??"",
    amount: json["amount"]??"",
    dueDate: json["due_date"] != null ? DateTime.parse(json["due_date"] )  :DateTime.now(),
    dueDateFormatted: json["due_date_formatted"]??"",
    remark: json["remark"]??"",
    customerId: json["customer_id"]??"",
    userId: json["user_id"]??"",
    signatureFileName: json["signature_file_name"]??"",
    companyId: json["company_id"]??"",
    dateModified: DateTime.parse(json["date_modified"]),
    transactionImages:json["transaction_images"] != null ? List<TransactionImagedetai>.from(json["transaction_images"].map((x) => TransactionImagedetai.fromJson(x))) : [],
    transactionComments: json["transaction_comments"] != null ? List<TransactionCommentdetai>.from(json["transaction_comments"].map((x) => TransactionCommentdetai.fromJson(x))) : [],
    isDelete: json["is_delete"]??"",
    transactionDate: DateTime.parse(json["transaction_date"]),
    transactionDateFormatted: json["transaction_date_formatted"]??"",
    dateAdded: DateTime.parse(json["date_added"]),
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
    "customer_photo": customerPhoto,
    "customer_name": customerName,
    "customer_name2": customerName2,
    "customer_mobile_no": customerMobileNo,
    "customer_email": customerEmail,
    "customer_address": customerAddress,
    "company_user_id": companyUserId,
    "customer_type_id": customerTypeId,
    "amount": amount,
    "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    "due_date_formatted": dueDateFormatted,
    "remark": remark,
    "customer_id": customerId,
    "user_id": userId,
    "signature_file_name": signatureFileName,
    "company_id": companyId,
    "date_modified": dateModified.toIso8601String(),
    "transaction_images": List<dynamic>.from(transactionImages.map((x) => x.toJson())),
    "transaction_comments": List<dynamic>.from(transactionComments.map((x) => x.toJson())),
    "is_delete": isDelete,
    "transaction_date": transactionDate.toIso8601String(),
    "transaction_date_formatted": transactionDateFormatted,
    "date_added": dateAdded.toIso8601String(),
  };
}

class TransactionCommentdetai {
  String transactionCommentId;
  String commentFileName;
  String commentDescription;
  String companyId;
  String companyUserId;
  String userId;
  String userName;
  String dateAdded;

  TransactionCommentdetai({
    required this.transactionCommentId,
    required this.commentFileName,
    required this.commentDescription,
    required this.companyId,
    required this.companyUserId,
    required this.userId,
    required this.userName,
    required this.dateAdded,
  });

  factory TransactionCommentdetai.fromJson(Map<String, dynamic> json) => TransactionCommentdetai(
    transactionCommentId: json["transaction_comment_id"]??"",
    commentFileName: json["comment_file_name"]??"",
    commentDescription: json["comment_description"]??"",
    companyId: json["company_id"]??"",
    companyUserId: json["company_user_id"]??"",
    userId: json["user_id"]??"",
    userName: json["user_name"]??"",
    dateAdded: json["date_added"]??"",
  );

  Map<String, dynamic> toJson() => {
    "transaction_comment_id": transactionCommentId,
    "comment_file_name": commentFileName,
    "comment_description": commentDescription,
    "company_id": companyId,
    "company_user_id": companyUserId,
    "user_id": userId,
    "user_name": userName,
    "date_added": dateAdded,
  };
}

class TransactionImagedetai {
  String transactionImageId;
  String imageFileName;

  TransactionImagedetai({
    required this.transactionImageId,
    required this.imageFileName,
  });

  factory TransactionImagedetai.fromJson(Map<String, dynamic> json) => TransactionImagedetai(
    transactionImageId: json["transaction_image_id"]??"",
    imageFileName: json["image_file_name"]??"",
  );

  Map<String, dynamic> toJson() => {
    "transaction_image_id": transactionImageId,
    "image_file_name": imageFileName,
  };
}

class TransactionTrackingdetai {
  String transactionTrackingId;
  String companyId;
  String companyUserId;
  String amount;
  dynamic userName;
  String dateAdded;

  TransactionTrackingdetai({
    required this.transactionTrackingId,
    required this.companyId,
    required this.companyUserId,
    required this.amount,
    required this.userName,
    required this.dateAdded,
  });

  factory TransactionTrackingdetai.fromJson(Map<String, dynamic> json) => TransactionTrackingdetai(
    transactionTrackingId: json["transaction_tracking_id"]??"",
    companyId: json["company_id"]??"",
    companyUserId: json["company_user_id"]??"",
    amount: json["amount"] ?? "",
    userName: json["user_name"].toString(),
    dateAdded: json["date_added"]??"",
  );

  Map<String, dynamic> toJson() => {
    "transaction_tracking_id": transactionTrackingId,
    "company_id": companyId,
    "company_user_id": companyUserId,
    "amount": amount,
    "user_name": userName,
    "date_added": dateAdded,
  };
}
