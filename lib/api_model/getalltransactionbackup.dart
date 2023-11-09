// To parse this JSON data, do
//
//     final getalltransactionbackup = getalltransactionbackupFromJson(jsonString);

import 'dart:convert';

Getalltransactionbackup getalltransactionbackupFromJson(String str) => Getalltransactionbackup.fromJson(json.decode(str));

String getalltransactionbackupToJson(Getalltransactionbackup data) => json.encode(data.toJson());

class Getalltransactionbackup {
  bool? success;
  String? message;
  dynamic totalTransaction;
  List<Transaction>? transactions;

  Getalltransactionbackup({
    this.success,
    this.message,
    this.totalTransaction,
    this.transactions,
  });

  factory Getalltransactionbackup.fromJson(Map<String, dynamic> json) => Getalltransactionbackup(
    success: json["success"],
    message: json["message"],
    totalTransaction: json["total_transaction"],
    transactions:json["transactions"] != null ?  List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "total_transaction": totalTransaction,
    "transactions": List<dynamic>.from(transactions!.map((x) => x.toJson())),
  };
}

class Transaction {
  String? transactionId;
  String? transactionType2;
  String? transactionType;
  String? customerPhoto;
  String? customerName2;
  dynamic totalAmount;
  String? transactionTransactionType2;
  dynamic amount;
  dynamic userName;
  int? companyUserId;
  String? companyName;
  String? customerName;
  String? dueDate;
  String? customerTypeId;
  String? dueDateFormatted;
  String? remark;
  String? customerId;
  bool? isAttachment;
  String? userId;
  String? signatureFileName;
  String? companyId;
  int? isDelete;
  List<TransactionImage>? transactionImages;
  List<TransactionComment>? transactionComments;
  String? transactionDate;
  String? transactionDateFormatted;
  String? dateModified;
  String? dateAdded;
  List<TransactionTracking>? transactionTracking;

  Transaction({
    this.transactionId,
    this.transactionType2,
    this.transactionType,
    this.customerPhoto,
    this.customerName2,
    this.totalAmount,
    this.transactionTransactionType2,
    this.amount,
    this.userName,
    this.companyUserId,
    this.companyName,
    this.customerName,
    this.dueDate,
    this.customerTypeId,
    this.dueDateFormatted,
    this.remark,
    this.customerId,
    this.isAttachment,
    this.userId,
    this.signatureFileName,
    this.companyId,
    this.isDelete,
    this.transactionImages,
    this.transactionComments,
    this.transactionDate,
    this.transactionDateFormatted,
    this.dateModified,
    this.dateAdded,
    this.transactionTracking,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transaction_id"].toString(),
    transactionType2: json["transaction_type2"].toString(),
    transactionType: json["transaction_type"].toString(),
    customerPhoto: json["customer_photo"].toString(),
    customerName2: json["customer_name2"].toString(),
    totalAmount: json["total_amount"],
    transactionTransactionType2: json["transaction_type_2"].toString(),
    amount: json["amount"],
    userName: json["user_name"].toString(),
    companyUserId: json["company_user_id"],
    companyName: json["company_name"].toString(),
    customerName: json["customer_name"].toString(),
    dueDate: json["due_date"].toString(),
    customerTypeId: json["customer_type_id"].toString(),
    dueDateFormatted: json["due_date_formatted"].toString(),
    remark: json["remark"].toString(),
    customerId: json["customer_id"].toString(),
    isAttachment: json["is_attachment"],
    userId: json["user_id"].toString(),
    signatureFileName: json["signature_file_name"].toString(),
    companyId: json["company_id"].toString(),
    isDelete: json["is_delete"],
    transactionImages:json["transaction_images"] != null ? List<TransactionImage>.from(json["transaction_images"].map((x) => TransactionImage.fromJson(x))) : [],
    transactionComments:json["transaction_comments"] != null ? List<TransactionComment>.from(json["transaction_comments"].map((x) => TransactionComment.fromJson(x))) : [],
    transactionDate: json["transaction_date"].toString(),
    transactionDateFormatted: json["transaction_date_formatted"].toString(),
    dateModified: json["date_modified"].toString(),
    dateAdded: json["date_added"].toString(),
    transactionTracking:json["transaction_tracking"] != null ?  List<TransactionTracking>.from(json["transaction_tracking"].map((x) => TransactionTracking.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "transaction_type2": transactionType2,
    "transaction_type": transactionType,
    "customer_photo": customerPhoto,
    "customer_name2": customerName2,
    "total_amount": totalAmount,
    "transaction_type_2": transactionTransactionType2,
    "amount": amount,
    "user_name": userName,
    "company_user_id": companyUserId,
    "company_name": companyName,
    "customer_name": customerName,
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
    "transaction_images": List<dynamic>.from(transactionImages!.map((x) => x.toJson())),
    "transaction_comments": List<dynamic>.from(transactionComments!.map((x) => x.toJson())),
    "transaction_date": transactionDate,
    "transaction_date_formatted": transactionDateFormatted,
    "date_modified": dateModified,
    "date_added": dateAdded,
    "transaction_tracking": List<dynamic>.from(transactionTracking!.map((x) => x.toJson())),
  };
}

class TransactionComment {
  String? transactionCommentId;
  String? commentFileName;
  String? commentDescription;
  String? dateAdded;

  TransactionComment({
    this.transactionCommentId,
    this.commentFileName,
    this.commentDescription,
    this.dateAdded,
  });

  factory TransactionComment.fromJson(Map<String, dynamic> json) => TransactionComment(
    transactionCommentId: json["transaction_comment_id"].toString(),
    commentFileName: json["comment_file_name"].toString(),
    commentDescription: json["comment_description"].toString(),
    dateAdded: json["date_added"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "transaction_comment_id": transactionCommentId,
    "comment_file_name": commentFileName,
    "comment_description": commentDescription,
    "date_added": dateAdded,
  };
}

class TransactionImage {
  String? transactionImageId;
  String? imageFileName;

  TransactionImage({
    this.transactionImageId,
    this.imageFileName,
  });

  factory TransactionImage.fromJson(Map<String, dynamic> json) => TransactionImage(
    transactionImageId: json["transaction_image_id"].toString(),
    imageFileName: json["image_file_name"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "transaction_image_id": transactionImageId,
    "image_file_name": imageFileName,
  };
}

class TransactionTracking {
  String? transactionTrackingId;
  String? transactionId;
  String? companyId;
  String? companyUserId;
  String? amount;
  String? dateAdded;

  TransactionTracking({
    this.transactionTrackingId,
    this.transactionId,
    this.companyId,
    this.companyUserId,
    this.amount,
    this.dateAdded,
  });

  factory TransactionTracking.fromJson(Map<String, dynamic> json) => TransactionTracking(
    transactionTrackingId: json["transaction_tracking_id"].toString(),
    transactionId: json["transaction_id"].toString(),
    companyId: json["company_id"].toString(),
    companyUserId: json["company_user_id"].toString(),
    amount: json["amount"].toString(),
    dateAdded: json["date_added"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "transaction_tracking_id": transactionTrackingId,
    "transaction_id": transactionId,
    "company_id": companyId,
    "company_user_id": companyUserId,
    "amount": amount,
    "date_added": dateAdded,
  };
}
