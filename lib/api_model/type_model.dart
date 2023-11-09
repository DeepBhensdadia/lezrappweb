// To parse this JSON data, do
//
//     final categary = categaryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Categary categaryFromJson(String str) => Categary.fromJson(json.decode(str));

String categaryToJson(Categary data) => json.encode(data.toJson());

class Categary {
  Categary({
    required this.success,
    required this.message,
    required this.businessTypes,
  });

  final bool success;
  final String message;
  final List<BusinessType> businessTypes;

  factory Categary.fromJson(Map<String, dynamic> json) => Categary(
    success: json["success"],
    message: json["message"],
    businessTypes: List<BusinessType>.from(json["business_types"].map((x) => BusinessType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "business_types": List<dynamic>.from(businessTypes.map((x) => x.toJson())),
  };
}

class BusinessType {
  BusinessType({
    required this.businessTypeId,
    required this.businessType,
    required this.isActive,
    required this.dateModified,
    required this.dateAdded,
  });

  final String businessTypeId;
  final String businessType;
  final String isActive;
  final Date dateModified;
  final Date dateAdded;

  factory BusinessType.fromJson(Map<String, dynamic> json) => BusinessType(
    businessTypeId: json["business_type_id"],
    businessType: json["business_type"],
    isActive: json["is_active"],
    dateModified: dateValues.map[json["date_modified"]]!,
    dateAdded: dateValues.map[json["date_added"]]!,
  );

  Map<String, dynamic> toJson() => {
    "business_type_id": businessTypeId,
    "business_type": businessType,
    "is_active": isActive,
    "date_modified": dateValues.reverse[dateModified],
    "date_added": dateValues.reverse[dateAdded],
  };
}

enum Date { THE_00000000000000 }

final dateValues = EnumValues({
  "0000-00-00 00:00:00": Date.THE_00000000000000
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
