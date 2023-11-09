// To parse this JSON data, do
//
//     final getAllSubscriptions = getAllSubscriptionsFromJson(jsonString);

import 'dart:convert';

GetAllSubscriptions getAllSubscriptionsFromJson(String str) => GetAllSubscriptions.fromJson(json.decode(str));

String getAllSubscriptionsToJson(GetAllSubscriptions data) => json.encode(data.toJson());

class GetAllSubscriptions {
  GetAllSubscriptions({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory GetAllSubscriptions.fromJson(Map<String, dynamic> json) => GetAllSubscriptions(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.packageId,
    required this.packageName,
    required this.minUser,
    required this.minBusiness,
    required this.allowWebversion,
    required this.allowBusinessGame,
    required this.monthlySms,
    required this.monthlyPrice,
    required this.monthlyOfferPrice,
    required this.yearlyPrice,
    required this.yearlyOfferPrice,
    required this.isActive,
    required this.dateModified,
    required this.dateAdded,
    required this.isTrial,
  });

  String packageId;
  String packageName;
  String minUser;
  String minBusiness;
  String allowWebversion;
  String allowBusinessGame;
  String monthlySms;
  String monthlyPrice;
  String monthlyOfferPrice;
  String yearlyPrice;
  String yearlyOfferPrice;
  String isActive;
  DateTime dateModified;
  String dateAdded;
  String isTrial;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    packageId: json["package_id"],
    packageName: json["package_name"],
    minUser: json["min_user"],
    minBusiness: json["min_business"],
    allowWebversion: json["allow_webversion"],
    allowBusinessGame: json["allow_business_game"],
    monthlySms: json["monthly_sms"],
    monthlyPrice: json["monthly_price"],
    monthlyOfferPrice: json["monthly_offer_price"],
    yearlyPrice: json["yearly_price"],
    yearlyOfferPrice: json["yearly_offer_price"],
    isActive: json["is_active"],
    dateModified: DateTime.parse(json["date_modified"]),
    dateAdded: json["date_added"],
    isTrial: json["is_trial"],
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "package_name": packageName,
    "min_user": minUser,
    "min_business": minBusiness,
    "allow_webversion": allowWebversion,
    "allow_business_game": allowBusinessGame,
    "monthly_sms": monthlySms,
    "monthly_price": monthlyPrice,
    "monthly_offer_price": monthlyOfferPrice,
    "yearly_price": yearlyPrice,
    "yearly_offer_price": yearlyOfferPrice,
    "is_active": isActive,
    "date_modified": dateModified.toIso8601String(),
    "date_added": dateAdded,
    "is_trial": isTrial,
  };
}



// To parse this JSON data, do
//
//     final lezrappVesion = lezrappVesionFromJson(jsonString);

LezrappVesion lezrappVesionFromJson(String str) => LezrappVesion.fromJson(json.decode(str));

String lezrappVesionToJson(LezrappVesion data) => json.encode(data.toJson());

class LezrappVesion {
  bool success;
  dynamic version;

  LezrappVesion({
    required this.success,
    required this.version,
  });

  factory LezrappVesion.fromJson(Map<String, dynamic> json) => LezrappVesion(
    success: json["success"],
    version: json["version"]!,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "version": version,
  };
}
