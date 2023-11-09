// To parse this JSON data, do
//
//     final rankList = rankListFromJson(jsonString);

import 'dart:convert';

RankList rankListFromJson(String str) => RankList.fromJson(json.decode(str));

String rankListToJson(RankList data) => json.encode(data.toJson());

class RankList {
  bool success;
  List<MyCompanyRank> toppers;
  List<MyCompanyRank> companies;
  MyCompanyRank myCompanyRank;
  String message;

  RankList({
    required this.success,
    required this.toppers,
    required this.companies,
    required this.myCompanyRank,
    required this.message,
  });

  factory RankList.fromJson(Map<String, dynamic> json) => RankList(
    success: json["success"],
    toppers: List<MyCompanyRank>.from(json["toppers"].map((x) => MyCompanyRank.fromJson(x))),
    companies: List<MyCompanyRank>.from(json["companies"].map((x) => MyCompanyRank.fromJson(x))),
    myCompanyRank: MyCompanyRank.fromJson(json["myCompanyRank"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "toppers": List<dynamic>.from(toppers.map((x) => x.toJson())),
    "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
    "myCompanyRank": myCompanyRank.toJson(),
    "message": message,
  };
}

class MyCompanyRank {
  String companyId;
  String userId;
  Currency currency;
  int rowNumber;
  String companyName;
  String companyPhoto;
  String myPoints;
  bool itsme;
  bool? display;

  MyCompanyRank({
    required this.companyId,
    required this.userId,
    required this.currency,
    required this.rowNumber,
    required this.companyName,
    required this.companyPhoto,
    required this.myPoints,
    required this.itsme,
    this.display,
  });

  factory MyCompanyRank.fromJson(Map<String, dynamic> json) => MyCompanyRank(
    companyId: json["company_id"],
    userId: json["user_id"],
    currency: currencyValues.map[json["currency"]]!,
    rowNumber: json["row_number"],
    companyName: json["company_name"],
    companyPhoto: json["company_photo"],
    myPoints: json["my_points"],
    itsme: json["itsme"],
    display: json["display"],
  );

  Map<String, dynamic> toJson() => {
    "company_id": companyId,
    "user_id": userId,
    "currency": currencyValues.reverse[currency],
    "row_number": rowNumber,
    "company_name": companyName,
    "company_photo": companyPhoto,
    "my_points": myPoints,
    "itsme": itsme,
    "display": display,
  };
}

enum Currency { RS }

final currencyValues = EnumValues({
  "Rs": Currency.RS
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
