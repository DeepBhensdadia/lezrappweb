// To parse this JSON data, do
//
//     final allCustomer = allCustomerFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final allCustomer = allCustomerFromJson(jsonString);

import 'dart:convert';

AllCustomer allCustomerFromJson(String str) =>
    AllCustomer.fromJson(json.decode(str));

String allCustomerToJson(AllCustomer data) => json.encode(data.toJson());

class AllCustomer {
  bool success;
  String message;
  String date;
  int totalCustomer;
  List<Customer> customers;

  AllCustomer({
    required this.success,
    required this.message,
    required this.date,
    required this.totalCustomer,
    this.customers = const [],
  });

  factory AllCustomer.fromJson(Map<String, dynamic> json) => AllCustomer(
        success: json["success"],
        message: json["message"],
        date: json["date"],
        totalCustomer: json["total_customer"],
        customers: json["customers"] != null
            ? List<Customer>.from(
                json["customers"].map((x) => Customer.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "date": date,
        "total_customer": totalCustomer,
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
      };
}

class Customer {
  String customerId;
  String customerTypeId;
  String customerName;
  String customerName2;
  String customerMobileNo;
  String customerGstin;
  dynamic totalAmount;
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
  String dateModified;
  String dateAdded;

  Customer({
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
    this.isFavorite = 0,
    required this.isDelete,
    required this.dateModified,
    required this.dateAdded,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        customerTypeId: json["customer_type_id"],
        customerName: json["customer_name"],
        customerName2: json["customer_name2"],
        customerMobileNo: json["customer_mobile_no"],
        customerGstin: json["customer_gstin"],
        totalAmount: json["total_amount"],
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
        dateModified: json["date_modified"],
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
        "date_modified": dateModified,
        "date_added": dateAdded,
      };

  bool get getIsFavourite => isFavorite == 1 ? true : false;

  set setIsFavourite(int value) => isFavorite = value;
}

/* flagged */

GetAllFlag getAllFlagFromJson(String str) =>
    GetAllFlag.fromJson(json.decode(str));

String getAllFlagToJson(GetAllFlag data) => json.encode(data.toJson());

class GetAllFlag {
  bool success;
  bool confirm;
  String message;

  GetAllFlag({
    required this.success,
    required this.confirm,
    required this.message,
  });

  factory GetAllFlag.fromJson(Map<String, dynamic> json) => GetAllFlag(
        success: json["success"],
        confirm: json["confirm"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "confirm": confirm,
        "message": message,
      };
}

/* info */

// To parse this JSON data, do
//
//     final getAllCinfo = getAllCinfoFromJson(jsonString);
