// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.success,
    required this.message,
    required this.expenseTypes,
  });

  bool success;
  String message;
  List<ExpenseType> expenseTypes;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    message: json["message"],
    expenseTypes: List<ExpenseType>.from(json["expense_types"].map((x) => ExpenseType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "expense_types": List<dynamic>.from(expenseTypes.map((x) => x.toJson())),
  };
}

class ExpenseType {
  ExpenseType({
    required this.expenseTypeId,
    required this.expenseTitle,
    required this.dateAdded,
  });

  String expenseTypeId;
  String expenseTitle;
  DateTime dateAdded;

  factory ExpenseType.fromJson(Map<String, dynamic> json) => ExpenseType(
    expenseTypeId: json["expense_type_id"],
    expenseTitle: json["expense_title"],
    dateAdded: DateTime.parse(json["date_added"]),
  );

  Map<String, dynamic> toJson() => {
    "expense_type_id": expenseTypeId,
    "expense_title": expenseTitle,
    "date_added": dateAdded.toIso8601String(),
  };
}
