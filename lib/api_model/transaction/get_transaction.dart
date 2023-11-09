

// To parse this JSON data, do
//
//     final getalltransaction = getalltransactionFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lezrapp/Const.dart';

Getalltransaction getalltransactionFromJson(String str) => Getalltransaction.fromJson(json.decode(str));

String getalltransactionToJson(Getalltransaction data) => json.encode(data.toJson());

class Getalltransaction {
  bool success;
  String message;
  int totalTransaction;
  List<Transaction> transactions;

  Getalltransaction({
    required this.success,
    required this.message,
    required this.totalTransaction,
    required this.transactions,
  });

  factory Getalltransaction.fromJson(Map<String, dynamic> json) => Getalltransaction(
    success: json["success"],
    message: json["message"],
    totalTransaction: json["total_transaction"],
    transactions:json["transactions"] != null ? List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "total_transaction": totalTransaction,
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Transaction {
  String transactionId;
  String transactionType2;
  String transactionType;
  String customerPhoto;
  String customerName2;
  dynamic totalAmount;
  String transactionTransactionType2;
  dynamic amount;
  String userName;
  int companyUserId;
  String companyName;
  String customerName;
  String dueDate;
  String customerTypeId;
  String dueDateFormatted;
  String remark;
  String customerId;
  bool isAttachment;
  String userId;
  String signatureFileName;
  String companyId;
  int isDelete;
  List<TransactionImage> transactionImages;
  List<TransactionComment> transactionComments;
  String transactionDate;
  String transactionDateFormatted;
  DateTime dateModified;
  DateTime dateAdded;
  List<TransactionTracking> transactionTracking;

  getColor() {
    return customerTypeId == "1" ?yellowcustomer :custom;
  }
  getUsername() {
    return userName.isNotEmpty? userName :"Admin";
  }
  getAmount(){
    return "₹ ${amount} ${transactionType}" ;
  }

  getAmountColor(){
   return transactionType =="Due"? Colors.red : Colors.green;
  }
  Transaction({
    required this.transactionId,
    required this.transactionType2,
    required this.transactionType,
    required this.customerPhoto,
    required this.customerName2,
    required this.totalAmount,
    required this.transactionTransactionType2,
    required this.amount,
    required this.userName,
    required this.companyUserId,
    required this.companyName,
    required this.customerName,
    required this.dueDate,
    required this.customerTypeId,
    required this.dueDateFormatted,
    required this.remark,
    required this.customerId,
    required this.isAttachment,
    required this.userId,
    required this.signatureFileName,
    required this.companyId,
    required this.isDelete,
    required this.transactionImages,
    required this.transactionComments,
    required this.transactionDate,
    required this.transactionDateFormatted,
    required this.dateModified,
    required this.dateAdded,
    required this.transactionTracking,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transaction_id"]??"",
    transactionType2: json["transaction_type2"]??"",
    transactionType: json["transaction_type"]??"",
    customerPhoto: json["customer_photo"]??"",
    customerName2: json["customer_name2"]??"",
    totalAmount: json["total_amount"],
    transactionTransactionType2: json["transaction_type_2"]??"",
    amount: json["amount"],
    userName: json["user_name"] != false ?  json["user_name"] : "",
    companyUserId: json["company_user_id"],
    companyName: json["company_name"]??"",
    customerName: json["customer_name"]??"",
    dueDate: json["due_date"]??"",
    customerTypeId: json["customer_type_id"]??"",
    dueDateFormatted: json["due_date_formatted"]??"",
    remark: json["remark"]??"",
    customerId: json["customer_id"]??"",
    isAttachment: json["is_attachment"],
    userId: json["user_id"]??"",
    signatureFileName: json["signature_file_name"]??"",
    companyId: json["company_id"]??"",
    isDelete: json["is_delete"],
    transactionImages: List<TransactionImage>.from(json["transaction_images"].map((x) => TransactionImage.fromJson(x))),
    transactionComments: List<TransactionComment>.from(json["transaction_comments"].map((x) => TransactionComment.fromJson(x))),
    transactionDate: json["transaction_date"]??"",
    transactionDateFormatted: json["transaction_date_formatted"]??"",
    dateModified: DateTime.parse(json["date_modified"]),
    dateAdded: DateTime.parse(json["date_added"]),
    transactionTracking: List<TransactionTracking>.from(json["transaction_tracking"].map((x) => TransactionTracking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "transaction_type2": transactionType2,
    "transaction_type": transactionType,
    "customer_photo": customerPhoto,
    "customer_name2": customerName2,
    "total_amount": totalAmount,
    "transaction_type_2":transactionTransactionType2,
    "amount": amount,
    "user_name": userName,
    "company_user_id": companyUserId,
    "company_name":companyName,
    "customer_name":customerName,
    "due_date": dueDate,
    "customer_type_id": customerTypeId,
    "due_date_formatted": dueDateFormatted,
    "remark": remark,
    "customer_id": customerId,
    "is_attachment": isAttachment,
    "user_id": userId,
    "signature_file_name": signatureFileName,
    "company_id": companyId,
    "is_delete": isDelete,
    "transaction_images": List<dynamic>.from(transactionImages.map((x) => x.toJson())),
    "transaction_comments": List<dynamic>.from(transactionComments.map((x) => x.toJson())),
    "transaction_date": transactionDate,
    "transaction_date_formatted": transactionDateFormatted,
    "date_modified": dateModified.toIso8601String(),
    "date_added": dateAdded.toIso8601String(),
    "transaction_tracking": List<dynamic>.from(transactionTracking.map((x) => x.toJson())),
  };
}

class TransactionComment {
  String transactionCommentId;
  String commentFileName;
  String commentDescription;
  String dateAdded;

  TransactionComment({
    required this.transactionCommentId,
    required this.commentFileName,
    required this.commentDescription,
    required this.dateAdded,
  });

  factory TransactionComment.fromJson(Map<String, dynamic> json) => TransactionComment(
    transactionCommentId: json["transaction_comment_id"],
    commentFileName: json["comment_file_name"],
    commentDescription: json["comment_description"],
    dateAdded: json["date_added"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_comment_id": transactionCommentId,
    "comment_file_name": commentFileName,
    "comment_description": commentDescription,
    "date_added": dateAdded,
  };
}

class TransactionImage {
  String transactionImageId;
  String imageFileName;

  TransactionImage({
    required this.transactionImageId,
    required this.imageFileName,
  });

  factory TransactionImage.fromJson(Map<String, dynamic> json) => TransactionImage(
    transactionImageId: json["transaction_image_id"]??"",
    imageFileName: json["image_file_name"]??"",
  );

  Map<String, dynamic> toJson() => {
    "transaction_image_id": transactionImageId,
    "image_file_name": imageFileName,
  };
}

class TransactionTracking {
  String transactionTrackingId;
  String transactionId;
  String companyId;
  String companyUserId;
  String amount;
  DateTime dateAdded;

  TransactionTracking({
    required this.transactionTrackingId,
    required this.transactionId,
    required this.companyId,
    required this.companyUserId,
    required this.amount,
    required this.dateAdded,
  });

  factory TransactionTracking.fromJson(Map<String, dynamic> json) => TransactionTracking(
    transactionTrackingId: json["transaction_tracking_id"]??"",
    transactionId: json["transaction_id"]??"",
    companyId: json["company_id"]??"",
    companyUserId: json["company_user_id"]??"",
    amount: json["amount"] ?? "",
    dateAdded: DateTime.parse(json["date_added"]),
  );

  Map<String, dynamic> toJson() => {
    "transaction_tracking_id": transactionTrackingId,
    "transaction_id": transactionId,
    "company_id": companyId,
    "company_user_id": companyUserId,
    "amount": amount,
    "date_added": dateAdded.toIso8601String(),
  };
}
