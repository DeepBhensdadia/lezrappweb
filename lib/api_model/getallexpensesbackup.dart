// To parse this JSON data, do
//
//     final getallexpensebackup = getallexpensebackupFromJson(jsonString);

import 'dart:convert';

Getallexpensebackup getallexpensebackupFromJson(String str) => Getallexpensebackup.fromJson(json.decode(str));

String getallexpensebackupToJson(Getallexpensebackup data) => json.encode(data.toJson());

class Getallexpensebackup {
  bool? success;
  String? message;
  dynamic totalExpense;
  List<Expense>? expenses;

  Getallexpensebackup({
    this.success,
    this.message,
    this.totalExpense,
    this.expenses,
  });

  factory Getallexpensebackup.fromJson(Map<String, dynamic> json) => Getallexpensebackup(
    success: json["success"],
    message: json["message"],
    totalExpense: json["total_expense"],
    expenses: List<Expense>.from(json["expenses"].map((x) => Expense.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "total_expense": totalExpense,
    "expenses": List<dynamic>.from(expenses!.map((x) => x.toJson())),
  };
}

class Expense {
  String? expenseId;
  String? expenseTypeId;
  String? expenseTitle;
  String? date;
  bool? isAttachment;
  String? companyUserId;
  String? dateFormatted;
  String? companyName;
  dynamic userName;
  String? amount;
  String? remark;
  String? companyId;
  String? userId;
  List<Imageexpencesbackup>? images;
  String? dateModified;
  String? dateAdded;

  Expense({
    this.expenseId,
    this.expenseTypeId,
    this.expenseTitle,
    this.date,
    this.isAttachment,
    this.companyUserId,
    this.dateFormatted,
    this.companyName,
    this.userName,
    this.amount,
    this.remark,
    this.companyId,
    this.userId,
    this.images,
    this.dateModified,
    this.dateAdded,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    expenseId: json["expense_id"].toString(),
    expenseTypeId: json["expense_type_id"].toString(),
    expenseTitle: json["expense_title"].toString(),
    date: json["date"].toString(),
    isAttachment: json["is_attachment"],
    companyUserId: json["company_user_id"].toString(),
    dateFormatted: json["date_formatted"].toString(),
    companyName: json["company_name"].toString(),
    userName: json["user_name"].toString(),
    amount: json["amount"].toString(),
    remark: json["remark"].toString(),
    companyId: json["company_id"].toString(),
    userId: json["user_id"].toString(),
    images: List<Imageexpencesbackup>.from(json["images"].map((x) => Imageexpencesbackup.fromJson(x))),
    dateModified: json["date_modified"].toString(),
    dateAdded: json["date_added"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "expense_id": expenseId,
    "expense_type_id": expenseTypeId,
    "expense_title": expenseTitle,
    "date": date,
    "is_attachment": isAttachment,
    "company_user_id": companyUserId,
    "date_formatted": dateFormatted,
    "company_name": companyName,
    "user_name": userName,
    "amount": amount,
    "remark": remark,
    "company_id": companyId,
    "user_id": userId,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "date_modified": dateModified,
    "date_added": dateAdded,
  };
}

class Imageexpencesbackup {
  String? expenseImageId;
  String? image;

  Imageexpencesbackup({
    this.expenseImageId,
    this.image,
  });

  factory Imageexpencesbackup.fromJson(Map<String, dynamic> json) => Imageexpencesbackup(
    expenseImageId: json["expense_image_id"].toString(),
    image: json["image"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "expense_image_id": expenseImageId,
    "image": image,
  };
}
