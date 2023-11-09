// To parse this JSON data, do
//
//     final addexpensedata = addexpensedataFromJson(jsonString);

import 'dart:convert';

Addexpensedata addexpensedataFromJson(String str) => Addexpensedata.fromJson(json.decode(str));

String addexpensedataToJson(Addexpensedata data) => json.encode(data.toJson());

class Addexpensedata {
  bool success;
  String message;
  int expenseId;

  Addexpensedata({
    required this.success,
    required this.message,
    required this.expenseId,
  });

  factory Addexpensedata.fromJson(Map<String, dynamic> json) => Addexpensedata(
    success: json["success"],
    message: json["message"],
    expenseId: int.parse(json["expense_id"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "expense_id": expenseId,
  };
}


Addexpensedatasave addexpensedatasaveFromJson(String str) => Addexpensedatasave.fromJson(json.decode(str));

String addexpensedatasaveToJson(Addexpensedatasave data) => json.encode(data.toJson());

class Addexpensedatasave {
  bool success;
  String message;
  int expenseId;

  Addexpensedatasave({
    required this.success,
    required this.message,
    required this.expenseId,
  });

  factory Addexpensedatasave.fromJson(Map<String, dynamic> json) => Addexpensedatasave(
    success: json["success"],
    message: json["message"],
    expenseId: json["expense_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "expense_id": expenseId,
  };
}

