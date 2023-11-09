// To parse this JSON data, do
//
//     final getmycurrentpackage = getmycurrentpackageFromJson(jsonString);

import 'dart:convert';

Getmycurrentpackage getmycurrentpackageFromJson(String str) => Getmycurrentpackage.fromJson(json.decode(str));

String getmycurrentpackageToJson(Getmycurrentpackage data) => json.encode(data.toJson());

class Getmycurrentpackage {
  bool success;
  String message;
  Data data;

  Getmycurrentpackage({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Getmycurrentpackage.fromJson(Map<String, dynamic> json) => Getmycurrentpackage(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String companyPackageId;
  String companyId;
  String userId;
  DateTime startDate;
  DateTime endDate;
  String packageType;
  String startDate1;
  String endDate2;
  int remainingDays;
  bool packageExpired;
  String packageName;
  String minUser;
  String minBusiness;
  String allowWebversion;
  String allowBusinessGame;
  String totalSms;
  String smsUsed;
  String packgePrice;
  String dateAdded;
  String dateModified;

  Data({
    required this.companyPackageId,
    required this.companyId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.packageType,
    required this.startDate1,
    required this.endDate2,
    required this.remainingDays,
    required this.packageExpired,
    required this.packageName,
    required this.minUser,
    required this.minBusiness,
    required this.allowWebversion,
    required this.allowBusinessGame,
    required this.totalSms,
    required this.smsUsed,
    required this.packgePrice,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    companyPackageId: json["company_package_id"],
    companyId: json["company_id"],
    userId: json["user_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    packageType: json["package_type"],
    startDate1: json["start_date1"],
    endDate2: json["end_date2"],
    remainingDays: json["remaining_days"],
    packageExpired: json["package_expired"],
    packageName: json["package_name"],
    minUser: json["min_user"],
    minBusiness: json["min_business"],
    allowWebversion: json["allow_webversion"],
    allowBusinessGame: json["allow_business_game"],
    totalSms: json["total_sms"],
    smsUsed: json["sms_used"],
    packgePrice: json["packge_price"],
    dateAdded: json["date_added"],
    dateModified: json["date_modified"],
  );

  Map<String, dynamic> toJson() => {
    "company_package_id": companyPackageId,
    "company_id": companyId,
    "user_id": userId,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "package_type": packageType,
    "start_date1": startDate1,
    "end_date2": endDate2,
    "remaining_days": remainingDays,
    "package_expired": packageExpired,
    "package_name": packageName,
    "min_user": minUser,
    "min_business": minBusiness,
    "allow_webversion": allowWebversion,
    "allow_business_game": allowBusinessGame,
    "total_sms": totalSms,
    "sms_used": smsUsed,
    "packge_price": packgePrice,
    "date_added": dateAdded,
    "date_modified": dateModified,
  };
}
