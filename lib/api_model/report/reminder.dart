// To parse this JSON data, do
//
//     final getReminder = getReminderFromJson(jsonString);

import 'dart:convert';

GetReminder getReminderFromJson(String str) => GetReminder.fromJson(json.decode(str));

String getReminderToJson(GetReminder data) => json.encode(data.toJson());

class GetReminder {
  bool success;
  String message;
  List<TodaysTransaction> todaysTransactions;
  List<dynamic> upcommingTransactions;
  List<PastTransaction> pastTransactions;

  GetReminder({
    required this.success,
    required this.message,
    required this.todaysTransactions,
    required this.upcommingTransactions,
    required this.pastTransactions,
  });

  factory GetReminder.fromJson(Map<String, dynamic> json) => GetReminder(
    success: json["success"],
    message: json["message"],
    todaysTransactions: List<TodaysTransaction>.from(json["todays_transactions"].map((x) => TodaysTransaction.fromJson(x))),
    upcommingTransactions: List<dynamic>.from(json["upcomming_transactions"].map((x) => x)),
    pastTransactions: List<PastTransaction>.from(json["past_transactions"].map((x) => PastTransaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "todays_transactions": List<dynamic>.from(todaysTransactions.map((x) => x.toJson())),
    "upcomming_transactions": List<dynamic>.from(upcommingTransactions.map((x) => x)),
    "past_transactions": List<dynamic>.from(pastTransactions.map((x) => x.toJson())),
  };
}

class PastTransaction {
  String transactionId;
  String customerId;
  String customerTypeId;
  String customerName;
  String customerMobileNo;
  DateTime dueDate;
  String dueDateFormatted;
  double amount;
  String transactionType;
  String transactionType2;

  PastTransaction({
    required this.transactionId,
    required this.customerId,
    required this.customerTypeId,
    required this.customerName,
    required this.customerMobileNo,
    required this.dueDate,
    required this.dueDateFormatted,
    required this.amount,
    required this.transactionType,
    required this.transactionType2,
  });

  factory PastTransaction.fromJson(Map<String, dynamic> json) => PastTransaction(
    transactionId: json["transaction_id"],
    customerId: json["customer_id"],
    customerTypeId: json["customer_type_id"],
    customerName: json["customer_name"],
    customerMobileNo: json["customer_mobile_no"],
    dueDate: DateTime.parse(json["due_date"]),
    dueDateFormatted: json["due_date_formatted"],
    amount: json["amount"]?.toDouble(),
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "customer_id": customerId,
    "customer_type_id": customerTypeId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    "due_date_formatted": dueDateFormatted,
    "amount": amount,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}

class TodaysTransaction {
  String transactionId;
  String customerId;
  String customerTypeId;
  String customerName;
  String customerMobileNo;
  DateTime dueDate;
  String dueDateFormatted;
  int amount;
  String transactionType;
  String transactionType2;

  TodaysTransaction({
    required this.transactionId,
    required this.customerId,
    required this.customerTypeId,
    required this.customerName,
    required this.customerMobileNo,
    required this.dueDate,
    required this.dueDateFormatted,
    required this.amount,
    required this.transactionType,
    required this.transactionType2,
  });

  factory TodaysTransaction.fromJson(Map<String, dynamic> json) => TodaysTransaction(
    transactionId: json["transaction_id"],
    customerId: json["customer_id"],
    customerTypeId: json["customer_type_id"],
    customerName: json["customer_name"],
    customerMobileNo: json["customer_mobile_no"],
    dueDate: DateTime.parse(json["due_date"]),
    dueDateFormatted: json["due_date_formatted"],
    amount: json["amount"],
    transactionType: json["transaction_type"],
    transactionType2: json["transaction_type_2"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "customer_id": customerId,
    "customer_type_id": customerTypeId,
    "customer_name": customerName,
    "customer_mobile_no": customerMobileNo,
    "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    "due_date_formatted": dueDateFormatted,
    "amount": amount,
    "transaction_type": transactionType,
    "transaction_type_2": transactionType2,
  };
}





// // To parse this JSON data, do
// //
// //     final getReminder = getReminderFromJson(jsonString);
//
// import 'dart:convert';
//
// GetReminder getReminderFromJson(String str) => GetReminder.fromJson(json.decode(str));
//
// String getReminderToJson(GetReminder data) => json.encode(data.toJson());
//
// class GetReminder {
//   bool success;
//   String message;
//   List<PastTransaction> todaysTransactions;
//   List<PastTransaction> upcommingTransactions;
//   List<PastTransaction> pastTransactions;
//
//   GetReminder({
//     required this.success,
//     required this.message,
//     required this.todaysTransactions,
//     required this.upcommingTransactions,
//     required this.pastTransactions,
//   });
//
//   factory GetReminder.fromJson(Map<String, dynamic> json) => GetReminder(
//     success: json["success"],
//     message: json["message"],
//     todaysTransactions: json["todays_transactions"] != null ? List<PastTransaction>.from(json["todays_transactions"].map((x) => x)) : [],
//     upcommingTransactions:json["upcomming_transactions"] != null ? List<PastTransaction>.from(json["upcomming_transactions"].map((x) => x)) : [],
//     pastTransactions: json["past_transactions"] != null ? List<PastTransaction>.from(json["past_transactions"].map((x) => PastTransaction.fromJson(x))) : [],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "todays_transactions": List<dynamic>.from(todaysTransactions.map((x) => x)),
//     "upcomming_transactions": List<dynamic>.from(upcommingTransactions.map((x) => x)),
//     "past_transactions": List<dynamic>.from(pastTransactions.map((x) => x.toJson())),
//   };
// }
//
// class PastTransaction {
//   String transactionId;
//   String customerId;
//   String customerTypeId;
//   String customerName;
//   String customerMobileNo;
//   String dueDate;
//   String dueDateFormatted;
//   int amount;
//   TransactionType transactionType;
//   TransactionType transactionType2;
//
//   PastTransaction({
//     required this.transactionId,
//     required this.customerId,
//     required this.customerTypeId,
//     required this.customerName,
//     required this.customerMobileNo,
//     required this.dueDate,
//     required this.dueDateFormatted,
//     required this.amount,
//     required this.transactionType,
//     required this.transactionType2,
//   });
//
//   factory PastTransaction.fromJson(Map<String, dynamic> json) => PastTransaction(
//     transactionId: json["transaction_id"],
//     customerId: json["customer_id"],
//     customerTypeId: json["customer_type_id"],
//     customerName: json["customer_name"],
//     customerMobileNo: json["customer_mobile_no"],
//     dueDate: json["due_date"],
//     dueDateFormatted: json["due_date_formatted"],
//     amount: json["amount"],
//     transactionType: transactionTypeValues.map[json["transaction_type"]]!,
//     transactionType2: transactionTypeValues.map[json["transaction_type_2"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "transaction_id": transactionId,
//     "customer_id": customerId,
//     "customer_type_id": customerTypeId,
//     "customer_name": customerNameValues.reverse[customerName],
//     "customer_mobile_no": customerMobileNo,
//     "due_date": dueDate,
//     "due_date_formatted": dueDateFormatted,
//     "amount": amount,
//     "transaction_type": transactionTypeValues.reverse[transactionType],
//     "transaction_type_2": transactionTypeValues.reverse[transactionType2],
//   };
// }
//
// enum CustomerName { ARJUN, PRAYAG, AARIZ, APPLE_COMPANY, ABHISHEK }
//
// final customerNameValues = EnumValues({
//   "Aariz": CustomerName.AARIZ,
//   "Abhishek": CustomerName.ABHISHEK,
//   "Apple Company": CustomerName.APPLE_COMPANY,
//   "Arjun": CustomerName.ARJUN,
//   "Prayag": CustomerName.PRAYAG
// });
//
// enum TransactionType { DUE }
//
// final transactionTypeValues = EnumValues({
//   "Due": TransactionType.DUE
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
