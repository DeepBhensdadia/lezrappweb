// To parse this JSON data, do
//
//     final prebuypackagemodel = prebuypackagemodelFromJson(jsonString);

import 'dart:convert';

Prebuypackagemodel prebuypackagemodelFromJson(String str) => Prebuypackagemodel.fromJson(json.decode(str));

String prebuypackagemodelToJson(Prebuypackagemodel data) => json.encode(data.toJson());

class Prebuypackagemodel {
  dynamic amountPerDay;
  Plan? buyPlan;
  String? buyPlanAmount;
  int? buyPlanType;
  CompanyPackage? companyPackage;
  String? currentPackgePrice;
  Plan? currentPlan;
  int? deductedAmount;
  String? message;
  int? remainingDays;
  int? status;
  bool? success;
  int? totalPayAmount;

  Prebuypackagemodel({
    this.amountPerDay,
    this.buyPlan,
    this.buyPlanAmount,
    this.buyPlanType,
    this.companyPackage,
    this.currentPackgePrice,
    this.currentPlan,
    this.deductedAmount,
    this.message,
    this.remainingDays,
    this.status,
    this.success,
    this.totalPayAmount,
  });

  factory Prebuypackagemodel.fromJson(Map<String, dynamic> json) => Prebuypackagemodel(
    amountPerDay: json["amount_per_day"],
    buyPlan:json["buy_plan"] != null ?  Plan.fromJson(json["buy_plan"]) : Plan(),
    buyPlanAmount: json["buy_plan_amount"] != null ? json["buy_plan_amount"].toString() : "",
    buyPlanType: json["buy_plan_type"] != null ? json["buy_plan_type"] : 1,
    companyPackage: json["company_package"] != null ?  CompanyPackage.fromJson(json["company_package"]) : CompanyPackage(),
    currentPackgePrice: json["current_packge_price"] != null ? json["current_packge_price"].toString() : "",
    currentPlan: json["current_plan"] != null ? Plan.fromJson(json["current_plan"]) : Plan(),
    deductedAmount: json["deducted_amount"]!= null ? json["deducted_amount"] : 0,
    message: json["message"] != null ? json["message"].toString() : "",
    remainingDays: json["remaining_days"] != null ? json["remaining_days"] : 0,
    status: json["status"] != null ?  json["status"] : 0,
    success: json["success"] != null ?  json["success"] : false,
    totalPayAmount: json["total_pay_amount"] != null ?json["total_pay_amount"] : 0,
  );

  Map<String, dynamic> toJson() => {
    "amount_per_day": amountPerDay,
    "buy_plan": buyPlan?.toJson(),
    "buy_plan_amount": buyPlanAmount,
    "buy_plan_type": buyPlanType,
    "company_package": companyPackage?.toJson(),
    "current_packge_price": currentPackgePrice,
    "current_plan": currentPlan?.toJson(),
    "deducted_amount": deductedAmount,
    "message": message,
    "remaining_days": remainingDays,
    "status": status,
    "success": success,
    "total_pay_amount": totalPayAmount,
  };
}

class Plan {
  String? allowBusinessGame;
  String? allowWebversion;
  String? dateAdded;
  String? dateModified;
  String? isActive;
  String? isTrial;
  String? level;
  String? minBusiness;
  String? minUser;
  String? monthlyOfferPrice;
  String? monthlyPrice;
  String? monthlySms;
  String? packageId;
  String? packageName;
  String? yearlyOfferPrice;
  String? yearlyPrice;

  Plan({
    this.allowBusinessGame,
    this.allowWebversion,
    this.dateAdded,
    this.dateModified,
    this.isActive,
    this.isTrial,
    this.level,
    this.minBusiness,
    this.minUser,
    this.monthlyOfferPrice,
    this.monthlyPrice,
    this.monthlySms,
    this.packageId,
    this.packageName,
    this.yearlyOfferPrice,
    this.yearlyPrice,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    allowBusinessGame: json["allow_business_game"],
    allowWebversion: json["allow_webversion"],
    dateAdded: json["date_added"],
    dateModified: json["date_modified"],
    isActive: json["is_active"],
    isTrial: json["is_trial"],
    level: json["level"],
    minBusiness: json["min_business"],
    minUser: json["min_user"],
    monthlyOfferPrice: json["monthly_offer_price"],
    monthlyPrice: json["monthly_price"],
    monthlySms: json["monthly_sms"],
    packageId: json["package_id"],
    packageName: json["package_name"],
    yearlyOfferPrice: json["yearly_offer_price"],
    yearlyPrice: json["yearly_price"],
  );

  Map<String, dynamic> toJson() => {
    "allow_business_game": allowBusinessGame,
    "allow_webversion": allowWebversion,
    "date_added": dateAdded,
    "date_modified": dateModified,
    "is_active": isActive,
    "is_trial": isTrial,
    "level": level,
    "min_business": minBusiness,
    "min_user": minUser,
    "monthly_offer_price": monthlyOfferPrice,
    "monthly_price": monthlyPrice,
    "monthly_sms": monthlySms,
    "package_id": packageId,
    "package_name": packageName,
    "yearly_offer_price": yearlyOfferPrice,
    "yearly_price": yearlyPrice,
  };
}

class CompanyPackage {
  String? allowBusinessGame;
  String? allowWebversion;
  String? companyId;
  String? companyPackageId;
  String? dateAdded;
  String? dateModified;
  DateTime? endDate;
  String? minBusiness;
  String? minUser;
  String? packageExpired;
  String? packageId;
  String? packageName;
  String? packageType;
  String? packgePrice;
  String? smsUsed;
  DateTime? startDate;
  String? totalSms;
  String? userId;

  CompanyPackage({
    this.allowBusinessGame,
    this.allowWebversion,
    this.companyId,
    this.companyPackageId,
    this.dateAdded,
    this.dateModified,
    this.endDate,
    this.minBusiness,
    this.minUser,
    this.packageExpired,
    this.packageId,
    this.packageName,
    this.packageType,
    this.packgePrice,
    this.smsUsed,
    this.startDate,
    this.totalSms,
    this.userId,
  });

  factory CompanyPackage.fromJson(Map<String, dynamic> json) => CompanyPackage(
    allowBusinessGame: json["allow_business_game"],
    allowWebversion: json["allow_webversion"],
    companyId: json["company_id"],
    companyPackageId: json["company_package_id"],
    dateAdded: json["date_added"],
    dateModified: json["date_modified"],
    endDate: DateTime.parse(json["end_date"]),
    minBusiness: json["min_business"],
    minUser: json["min_user"],
    packageExpired: json["package_expired"],
    packageId: json["package_id"],
    packageName: json["package_name"],
    packageType: json["package_type"],
    packgePrice: json["packge_price"],
    smsUsed: json["sms_used"],
    startDate: DateTime.parse(json["start_date"]),
    totalSms: json["total_sms"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "allow_business_game": allowBusinessGame,
    "allow_webversion": allowWebversion,
    "company_id": companyId,
    "company_package_id": companyPackageId,
    "date_added": dateAdded,
    "date_modified": dateModified,
    "end_date": "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
    "min_business": minBusiness,
    "min_user": minUser,
    "package_expired": packageExpired,
    "package_id": packageId,
    "package_name": packageName,
    "package_type": packageType,
    "packge_price": packgePrice,
    "sms_used": smsUsed,
    "start_date": "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
    "total_sms": totalSms,
    "user_id": userId,
  };
}
