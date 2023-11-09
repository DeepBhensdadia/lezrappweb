// To parse this JSON data, do
//
//     final getAlltutorials = getAlltutorialsFromJson(jsonString);

import 'dart:convert';

GetAlltutorials getAlltutorialsFromJson(String str) => GetAlltutorials.fromJson(json.decode(str));

String getAlltutorialsToJson(GetAlltutorials data) => json.encode(data.toJson());

class GetAlltutorials {
  bool success;
  String message;
  List<Datum> data;

  GetAlltutorials({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAlltutorials.fromJson(Map<String, dynamic> json) => GetAlltutorials(
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
  String tutorialId;
  String title;
  String description;
  String ytId;
  String image;
  String isActive;
  String sortOrder;
  DateTime dateAdded;
  DateTime dateModified;

  Datum({
    required this.tutorialId,
    required this.title,
    required this.description,
    required this.ytId,
    required this.image,
    required this.isActive,
    required this.sortOrder,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    tutorialId: json["tutorial_id"],
    title: json["title"],
    description: json["description"],
    ytId: json["yt_id"],
    image: json["image"],
    isActive: json["is_active"],
    sortOrder: json["sort_order"],
    dateAdded: DateTime.parse(json["date_added"]),
    dateModified: DateTime.parse(json["date_modified"]),
  );

  Map<String, dynamic> toJson() => {
    "tutorial_id": tutorialId,
    "title": title,
    "description": description,
    "yt_id": ytId,
    "image": image,
    "is_active": isActive,
    "sort_order": sortOrder,
    "date_added": dateAdded.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
  };
}
