// To parse this JSON data, do
//
//     final allexpense = allexpenseFromJson(jsonString);

import 'dart:convert';

Allexpense allexpenseFromJson(String str) => Allexpense.fromJson(json.decode(str));

String allexpenseToJson(Allexpense data) => json.encode(data.toJson());

class Allexpense {
  bool success;
  String message;
  int totalExpense;
  List<Expense_all> expenses;

  Allexpense({
    required this.success,
    required this.message,
    required this.totalExpense,
    required this.expenses,
  });

  factory Allexpense.fromJson(Map<String, dynamic> json) => Allexpense(
    success: json["success"],
    message: json["message"],
    totalExpense: json["total_expense"],
    expenses: List<Expense_all>.from(json["expenses"].map((x) => Expense_all.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "total_expense": totalExpense,
    "expenses": List<dynamic>.from(expenses.map((x) => x.toJson())),
  };
}

class Expense_all {
  String expenseId;
  String expenseTypeId;
  String expenseTitle;
  String date;
  bool isAttachment;
  String companyUserId;
  String dateFormatted;
  String companyName;
  String userName;
  String amount;
  String remark;
  String companyId;
  String userId;
  List<Image> images;
  DateTime dateModified;
  DateTime dateAdded;

  Expense_all({
    required this.expenseId,
    required this.expenseTypeId,
    required this.expenseTitle,
    required this.date,
    required this.isAttachment,
    required this.companyUserId,
    required this.dateFormatted,
    required this.companyName,
    required this.userName,
    required this.amount,
    required this.remark,
    required this.companyId,
    required this.userId,
    required this.images,
    required this.dateModified,
    required this.dateAdded,
  });

  factory Expense_all.fromJson(Map<String, dynamic> json) => Expense_all(
    expenseId: json["expense_id"].toString(),
    expenseTypeId: json["expense_type_id"].toString(),
    expenseTitle: json["expense_title"].toString(),
    date: json["date"].toString(),
    isAttachment: json["is_attachment"],
    companyUserId: json["company_user_id"].toString(),
    dateFormatted: json["date_formatted"].toString(),
    companyName: json["company_name"].toString(),
    userName: json["user_name"] != false ? json["user_name"] :"",
    amount: json["amount"].toString(),
    remark: json["remark"].toString(),
    companyId: json["company_id"].toString(),
    userId: json["user_id"].toString(),
    images:List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    dateModified: DateTime.parse(json["date_modified"]),
    dateAdded: DateTime.parse(json["date_added"]),
  );

  Map<String, dynamic> toJson() => {
    "expense_id": expenseId,
    "expense_type_id": expenseTypeId,
    "expense_title": expenseTitle,
    "date": date,
    "is_attachment": isAttachment,
    "company_user_id": companyUserId,
    "date_formatted": dateFormattedValues.reverse[dateFormatted],
    "company_name": companyNameValues.reverse[companyName],
    "user_name": userName,
    "amount": amount,
    "remark": remark,
    "company_id": companyId,
    "user_id": userId,
    "images": List<dynamic>.from(images.map((x) => x)),
    "date_modified": dateModified.toIso8601String(),
    "date_added": dateAdded.toIso8601String(),
  };
}
class Image {
  String expenseImageId;
  String image;

  Image({
    required this.expenseImageId,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    expenseImageId: json["expense_image_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "expense_image_id": expenseImageId,
    "image": image,
  };
}
enum CompanyName { GNHUB }

final companyNameValues = EnumValues({
  "GNHUB": CompanyName.GNHUB
});

enum DateFormatted { THE_30_NOV_0001, THE_06_MAY_2023, THE_21_OCT_2022 }

final dateFormattedValues = EnumValues({
  "06 May, 2023": DateFormatted.THE_06_MAY_2023,
  "21 Oct, 2022": DateFormatted.THE_21_OCT_2022,
  "30 Nov, -0001": DateFormatted.THE_30_NOV_0001
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
