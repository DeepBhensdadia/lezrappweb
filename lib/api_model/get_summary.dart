// To parse this JSON data, do
//
//     final getSummary = getSummaryFromJson(jsonString);

import 'dart:convert';

GetSummary getSummaryFromJson(String str) =>
    GetSummary.fromJson(json.decode(str));

String getSummaryToJson(GetSummary data) => json.encode(data.toJson());

class GetSummary {
  bool success;
  String message;
  Summery summery;
  int isUserActive;
  String businessCardUrl;
  String totalCustomer;
  String totalFlagged;
  String totalSupplier;
  int todaysReminder;
  String myPoints;

  GetSummary({
    required this.success,
    required this.message,
    required this.summery,
    required this.isUserActive,
    required this.businessCardUrl,
    required this.totalCustomer,
    required this.totalFlagged,
    required this.totalSupplier,
    required this.todaysReminder,
    required this.myPoints,
  });

  factory GetSummary.fromJson(Map<String, dynamic> json) => GetSummary(
        success: json["success"],
        message: json["message"],
        summery: Summery.fromJson(json["summery"]),
        isUserActive: json["is_user_active"],
        businessCardUrl: json["business_card_url"],
        totalCustomer: json["total_customer"],
        totalFlagged: json["total_flagged"],
        totalSupplier: json["total_supplier"],
        todaysReminder: json["todays_reminder"],
        myPoints: json["my_points"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "summery": summery.toJson(),
        "is_user_active": isUserActive,
        "business_card_url": businessCardUrl,
        "total_customer": totalCustomer,
        "total_flagged": totalFlagged,
        "total_supplier": totalSupplier,
        "todays_reminder": todaysReminder,
        "my_points": myPoints,
      };
}

class Summery {
  int totalCustomerCredit;
  int totalCustomerDebit;
  String totalReceivalbleColor;
  double totalReceivalble;
  double salePer;
  String totalExpense;
  double expensePer;
  String rank;
  dynamic salesPerformance;
  dynamic paymentPerformance;
  dynamic expensePerformance;
  double purchasePer;
  int totalSupplierCredit;
  int totalSupplierDebit;
  String totalPayableColor;
  int totalPayable;
  double totalCustomerCreditPer;
  int aveOfAllPayable;
  double aveOfAllPayablePer;
  int aveOfAllPayable10User;
  double aveOfAllPayable10UserPer;
  double totalSupplierCreditPer;
  int aveOfAllReceivable;
  double aveOfAllReceivablePer;
  int aveOfAllReceivable10User;
  int aveOfAllReceivable10UserPer;
  int saleExpenseGap;
  double saleExpenseGapPer;
  double saleExpenseGapAllUserPer;
  int saleExpenseGapAllUser;
  int saleExpenseGap10User;
  double saleExpenseGap10UserPer;

  Summery({
    required this.totalCustomerCredit,
    required this.totalCustomerDebit,
    required this.totalReceivalbleColor,
    required this.totalReceivalble,
    required this.salePer,
    required this.totalExpense,
    required this.expensePer,
    required this.rank,
    required this.salesPerformance,
    required this.paymentPerformance,
    required this.expensePerformance,
    required this.purchasePer,
    required this.totalSupplierCredit,
    required this.totalSupplierDebit,
    required this.totalPayableColor,
    required this.totalPayable,
    required this.totalCustomerCreditPer,
    required this.aveOfAllPayable,
    required this.aveOfAllPayablePer,
    required this.aveOfAllPayable10User,
    required this.aveOfAllPayable10UserPer,
    required this.totalSupplierCreditPer,
    required this.aveOfAllReceivable,
    required this.aveOfAllReceivablePer,
    required this.aveOfAllReceivable10User,
    required this.aveOfAllReceivable10UserPer,
    required this.saleExpenseGap,
    required this.saleExpenseGapPer,
    required this.saleExpenseGapAllUserPer,
    required this.saleExpenseGapAllUser,
    required this.saleExpenseGap10User,
    required this.saleExpenseGap10UserPer,
  });

  factory Summery.fromJson(Map<String, dynamic> json) => Summery(
        totalCustomerCredit: json["TotalCustomerCredit"],
        totalCustomerDebit: json["TotalCustomerDebit"],
        totalReceivalbleColor: json["TotalReceivalbleColor"],
        totalReceivalble: json["TotalReceivalble"]?.toDouble(),
        salePer: json["sale_per"]?.toDouble(),
        totalExpense:
            json["total_expense"] == false ? "" : json["total_expense"],
        expensePer: json["expense_per"]?.toDouble(),
        rank: json["rank"] != false  ? json["rank"] : "",
        salesPerformance: json["sales_performance"] != 0 ? Performance.fromJson(json["sales_performance"]) :{},
        paymentPerformance:json["payment_performance"] != 0 ? Performance.fromJson(json["payment_performance"]) : {},
        expensePerformance:json["expense_performance"] != 0 ? Performance.fromJson(json["expense_performance"]) : {},
        purchasePer: json["purchase_per"]?.toDouble(),
        totalSupplierCredit: json["TotalSupplierCredit"],
        totalSupplierDebit: json["TotalSupplierDebit"],
        totalPayableColor: json["TotalPayableColor"],
        totalPayable: json["TotalPayable"],
        totalCustomerCreditPer: json["TotalCustomerCreditPer"]?.toDouble(),
        aveOfAllPayable: json["ave_of_all_payable"],
        aveOfAllPayablePer: json["ave_of_all_payable_per"]?.toDouble(),
        aveOfAllPayable10User: json["ave_of_all_payable_10_user"],
        aveOfAllPayable10UserPer:
            json["ave_of_all_payable_10_user_per"]?.toDouble(),
        totalSupplierCreditPer: json["TotalSupplierCreditPer"]?.toDouble(),
        aveOfAllReceivable: json["ave_of_all_receivable"],
        aveOfAllReceivablePer: json["ave_of_all_receivable_per"]?.toDouble(),
        aveOfAllReceivable10User: json["ave_of_all_receivable_10_user"],
        aveOfAllReceivable10UserPer: json["ave_of_all_receivable_10_user_per"],
        saleExpenseGap: json["sale_expense_gap"],
        saleExpenseGapPer: json["sale_expense_gap_per"]?.toDouble(),
        saleExpenseGapAllUserPer:
            json["sale_expense_gap_all_user_per"]?.toDouble(),
        saleExpenseGapAllUser: json["sale_expense_gap_all_user"],
        saleExpenseGap10User: json["sale_expense_gap_10_user"],
        saleExpenseGap10UserPer:
            json["sale_expense_gap_10_user_per"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "TotalCustomerCredit": totalCustomerCredit,
        "TotalCustomerDebit": totalCustomerDebit,
        "TotalReceivalbleColor": totalReceivalbleColor,
        "TotalReceivalble": totalReceivalble,
        "sale_per": salePer,
        "total_expense": totalExpense,
        "expense_per": expensePer,
        "rank": rank,
        "sales_performance": salesPerformance.toJson(),
        "payment_performance": paymentPerformance.toJson(),
        "expense_performance": expensePerformance.toJson(),
        "purchase_per": purchasePer,
        "TotalSupplierCredit": totalSupplierCredit,
        "TotalSupplierDebit": totalSupplierDebit,
        "TotalPayableColor": totalPayableColor,
        "TotalPayable": totalPayable,
        "TotalCustomerCreditPer": totalCustomerCreditPer,
        "ave_of_all_payable": aveOfAllPayable,
        "ave_of_all_payable_per": aveOfAllPayablePer,
        "ave_of_all_payable_10_user": aveOfAllPayable10User,
        "ave_of_all_payable_10_user_per": aveOfAllPayable10UserPer,
        "TotalSupplierCreditPer": totalSupplierCreditPer,
        "ave_of_all_receivable": aveOfAllReceivable,
        "ave_of_all_receivable_per": aveOfAllReceivablePer,
        "ave_of_all_receivable_10_user": aveOfAllReceivable10User,
        "ave_of_all_receivable_10_user_per": aveOfAllReceivable10UserPer,
        "sale_expense_gap": saleExpenseGap,
        "sale_expense_gap_per": saleExpenseGapPer,
        "sale_expense_gap_all_user_per": saleExpenseGapAllUserPer,
        "sale_expense_gap_all_user": saleExpenseGapAllUser,
        "sale_expense_gap_10_user": saleExpenseGap10User,
        "sale_expense_gap_10_user_per": saleExpenseGap10UserPer,
      };
}

class Performance {
  String label;
  int rating;
  double progress;

  Performance({
    required this.label,
    required this.rating,
    required this.progress,
  });

  factory Performance.fromJson(Map<String, dynamic> json) => Performance(
        label: json["label"],
        rating: json["rating"],
        progress: json["progress"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "rating": rating,
        "progress": progress,
      };
}
