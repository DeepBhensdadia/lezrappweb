// To parse this JSON data, do
//
//     final getAllFlag = getAllFlagFromJson(jsonString);

import 'dart:convert';

GetAllFlag getAllFlagFromJson(String str) => GetAllFlag.fromJson(json.decode(str));

String getAllFlagToJson(GetAllFlag data) => json.encode(data.toJson());

class GetAllFlag {
  bool success;
  String message;
  DateTime date;
  int totalCustomer;
  List<Customer> customers;

  GetAllFlag({
    required this.success,
    required this.message,
    required this.date,
    required this.totalCustomer,
    required this.customers,
  });

  factory GetAllFlag.fromJson(Map<String, dynamic> json) => GetAllFlag(
    success: json["success"],
    message: json["message"],
    date: DateTime.parse(json["date"]),
    totalCustomer: json["total_customer"],
    customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "date": date.toIso8601String(),
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
  CustomerGstin customerGstin;
  int totalAmount;
  TransactionType transactionType1;
  TransactionType transactionType;
  TransactionType transactionType2;
  CustomerEmail customerEmail;
  CustomerAddress customerAddress;
  String userId;
  String customerPhoto;
  CustomerRemark customerRemark;
  String companyId;
  String customerCode;
  String msgLink;
  String msgText;
  int isActive;
  int isFavorite;
  int isDelete;
  DateTime dateModified;
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
    required this.isFavorite,
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
    customerGstin: customerGstinValues.map[json["customer_gstin"]]!,
    totalAmount: json["total_amount"],
    transactionType1: transactionTypeValues.map[json["transaction_type_1"]]!,
    transactionType: transactionTypeValues.map[json["transaction_type"]]!,
    transactionType2: transactionTypeValues.map[json["transaction_type_2"]]!,
    customerEmail: customerEmailValues.map[json["customer_email"]]!,
    customerAddress: customerAddressValues.map[json["customer_address"]]!,
    userId: json["user_id"],
    customerPhoto: json["customer_photo"],
    customerRemark: customerRemarkValues.map[json["customer_remark"]]!,
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
    "customer_gstin": customerGstinValues.reverse[customerGstin],
    "total_amount": totalAmount,
    "transaction_type_1": transactionTypeValues.reverse[transactionType1],
    "transaction_type": transactionTypeValues.reverse[transactionType],
    "transaction_type_2": transactionTypeValues.reverse[transactionType2],
    "customer_email": customerEmailValues.reverse[customerEmail],
    "customer_address": customerAddressValues.reverse[customerAddress],
    "user_id": userId,
    "customer_photo": customerPhoto,
    "customer_remark": customerRemarkValues.reverse[customerRemark],
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

enum CustomerAddress { EMPTY, SURAT }

final customerAddressValues = EnumValues({
  "": CustomerAddress.EMPTY,
  "surat": CustomerAddress.SURAT
});

enum CustomerEmail { EMPTY, PRAYAGDALAL1111_GMAIL_COM, ABHI_GMAIL_COM }

final customerEmailValues = EnumValues({
  "abhi@gmail.com": CustomerEmail.ABHI_GMAIL_COM,
  "": CustomerEmail.EMPTY,
  "prayagdalal1111@gmail.com": CustomerEmail.PRAYAGDALAL1111_GMAIL_COM
});

enum CustomerGstin { EMPTY, THE_566636363635363, THE_565656565656565 }

final customerGstinValues = EnumValues({
  "": CustomerGstin.EMPTY,
  "565656565656565": CustomerGstin.THE_565656565656565,
  "566636363635363": CustomerGstin.THE_566636363635363
});

enum CustomerRemark { EMPTY, JEURHR, THE_2666565656 }

final customerRemarkValues = EnumValues({
  "": CustomerRemark.EMPTY,
  "jeurhr": CustomerRemark.JEURHR,
  "2666565656": CustomerRemark.THE_2666565656
});

enum TransactionType { DUE, ADV }

final transactionTypeValues = EnumValues({
  "Adv": TransactionType.ADV,
  "Due": TransactionType.DUE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
