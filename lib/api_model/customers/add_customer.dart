// To parse this JSON data, do
//
//     final addCustomerdata = addCustomerdataFromJson(jsonString);

import 'dart:convert';

AddCustomerdata addCustomerdataFromJson(String str) => AddCustomerdata.fromJson(json.decode(str));

String addCustomerdataToJson(AddCustomerdata data) => json.encode(data.toJson());

class AddCustomerdata {
  bool success;
  bool confirm;
  String message;
  int customerId;

  AddCustomerdata({
    required this.success,
    required this.confirm,
    required this.message,
    required this.customerId,
  });

  factory AddCustomerdata.fromJson(Map<String, dynamic> json) => AddCustomerdata(
    success: json["success"],
    confirm: json["confirm"],
    message: json["message"],
    customerId: json["customer_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "confirm": confirm,
    "message": message,
    "customer_id": customerId,
  };
}


UpdateCustomerdata updateCustomerdataFromJson(String str) => UpdateCustomerdata.fromJson(json.decode(str));

String updateCustomerdataToJson(UpdateCustomerdata data) => json.encode(data.toJson());

class UpdateCustomerdata {
  bool success;
  bool confirm;
  String message;
  String customerId;

  UpdateCustomerdata({
    required this.success,
    required this.confirm,
    required this.message,
    required this.customerId,
  });

  factory UpdateCustomerdata.fromJson(Map<String, dynamic> json) => UpdateCustomerdata(
    success: json["success"],
    confirm: json["confirm"],
    message: json["message"],
    customerId: json["customer_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "confirm": confirm,
    "message": message,
    "customer_id": customerId,
  };
}
