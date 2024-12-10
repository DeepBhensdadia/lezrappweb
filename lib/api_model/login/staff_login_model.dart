// To parse this JSON data, do
//
//     final sLogin = sLoginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SLogin sLoginFromJson(String str) => SLogin.fromJson(json.decode(str));

String sLoginToJson(SLogin data) => json.encode(data.toJson());

class SLogin {
  SLogin({
    required this.success,
    required this.backup,
    required this.message,
    required this.user,
    required this.company,
    required this.mobileno,
    required this.userId,
  });

  bool success;
  bool backup;
  String message;
  String mobileno;
  dynamic user;
  dynamic company;
  dynamic userId;

  SLogin copyWith({
    bool? success,
    bool? backup,
    String? message,
    String? mobileno,
    dynamic user,
    dynamic company,
    int? userId,
  }) =>
      SLogin(
        success: success ?? this.success,
        message: message ?? this.message,
        mobileno: mobileno ?? this.mobileno,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        company: company ?? this.company,
        backup: backup ?? this.backup,
      );

  factory SLogin.fromJson(Map<String, dynamic> json) => SLogin(
        success: json["success"],
        backup: json["backup"] != null ? json["backup"] : false,
        message: json["message"],
        mobileno: json["mobileno"] != null ? json["mobileno"] : "",
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        company:
            json["company"] != null ? Company.fromJson(json["company"]) : {},
        userId: json["user_id"] != null ? json["user_id"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "backup": backup,
        "message": message,
        "mobileno": mobileno,
        "user": user != null ? user.toJson() : user,
        "company": company.toJson(),
        "userId": userId
      };
}

class Company {
  Company({
    required this.companyId,
    required this.auth,
    required this.companyName,
    required this.companyEmail,
    required this.companyGstin,
    required this.companyMobileNo,
    required this.companyAddress,
    required this.companyDescription,
    required this.companyPhoto,
    required this.businessType,
    required this.companyPhoto2,
    required this.companyWebsite,
    required this.currency,
    required this.bankName,
    required this.acNo,
    required this.ifscCode,
    required this.userId,
    required this.themeId,
    required this.sendSms,
    required this.allowNotification,
    required this.isPinset,
    required this.pinPassword,
    required this.notificationTime,
    required this.sendSmsOnPayment,
    required this.reminderType,
    required this.sendSmsOnPurchase,
    required this.smsPaymentText,
    required this.smsPurchaseText,
    required this.companyTypeId,
    required this.myPoints,
    required this.bonusAdded,
    required this.businessRank,
    required this.isSubscribe,
    required this.isActive,
    required this.dateModified,
    required this.dateAdded,
    required this.isPrimaryAccount,
    required this.isNew,
    required this.isPrivacy,
  });

  final String companyId;
  final String auth;
  final String companyName;
  final String companyEmail;
  final String companyGstin;
  final String companyMobileNo;
  final String companyAddress;
  final String companyDescription;
  final String companyPhoto;
  final String businessType;
  final String companyPhoto2;
  final String companyWebsite;
  final String currency;
  final String bankName;
  final String acNo;
  final String ifscCode;
  final String userId;
  final String themeId;
  final String sendSms;
  final String allowNotification;
  final String isPinset;
  final String pinPassword;
  final String notificationTime;
  final String sendSmsOnPayment;
  final String reminderType;
  final String sendSmsOnPurchase;
  final String smsPaymentText;
  final String smsPurchaseText;
  final String companyTypeId;
  final String myPoints;
  final bool bonusAdded;
  final String businessRank;
  final bool isSubscribe;
  final bool isActive;
  final DateTime dateModified;
  final DateTime dateAdded;
  final String isPrimaryAccount;
  final String isNew;
  final String isPrivacy;

  Company copyWith({
    String? companyId,
    String? auth,
    String? companyName,
    String? companyEmail,
    String? companyGstin,
    String? companyMobileNo,
    String? companyAddress,
    String? companyDescription,
    String? companyPhoto,
    String? businessType,
    String? companyPhoto2,
    String? companyWebsite,
    String? currency,
    String? bankName,
    String? acNo,
    String? ifscCode,
    String? userId,
    String? themeId,
    String? sendSms,
    String? allowNotification,
    String? isPinset,
    String? pinPassword,
    String? notificationTime,
    String? sendSmsOnPayment,
    String? reminderType,
    String? sendSmsOnPurchase,
    String? smsPaymentText,
    String? smsPurchaseText,
    String? companyTypeId,
    String? myPoints,
    bool? bonusAdded,
    String? businessRank,
    bool? isSubscribe,
    bool? isActive,
    DateTime? dateModified,
    DateTime? dateAdded,
    String? isPrimaryAccount,
    String? isNew,
    String? isPrivacy,
  }) =>
      Company(
        companyId: companyId ?? this.companyId,
        auth: auth ?? this.auth,
        companyName: companyName ?? this.companyName,
        companyEmail: companyEmail ?? this.companyEmail,
        companyGstin: companyGstin ?? this.companyGstin,
        companyMobileNo: companyMobileNo ?? this.companyMobileNo,
        companyAddress: companyAddress ?? this.companyAddress,
        companyDescription: companyDescription ?? this.companyDescription,
        companyPhoto: companyPhoto ?? this.companyPhoto,
        businessType: businessType ?? this.businessType,
        companyPhoto2: companyPhoto2 ?? this.companyPhoto2,
        companyWebsite: companyWebsite ?? this.companyWebsite,
        currency: currency ?? this.currency,
        bankName: bankName ?? this.bankName,
        acNo: acNo ?? this.acNo,
        ifscCode: ifscCode ?? this.ifscCode,
        userId: userId ?? this.userId,
        themeId: themeId ?? this.themeId,
        sendSms: sendSms ?? this.sendSms,
        allowNotification: allowNotification ?? this.allowNotification,
        isPinset: isPinset ?? this.isPinset,
        pinPassword: pinPassword ?? this.pinPassword,
        notificationTime: notificationTime ?? this.notificationTime,
        sendSmsOnPayment: sendSmsOnPayment ?? this.sendSmsOnPayment,
        reminderType: reminderType ?? this.reminderType,
        sendSmsOnPurchase: sendSmsOnPurchase ?? this.sendSmsOnPurchase,
        smsPaymentText: smsPaymentText ?? this.smsPaymentText,
        smsPurchaseText: smsPurchaseText ?? this.smsPurchaseText,
        companyTypeId: companyTypeId ?? this.companyTypeId,
        myPoints: myPoints ?? this.myPoints,
        bonusAdded: bonusAdded ?? this.bonusAdded,
        businessRank: businessRank ?? this.businessRank,
        isSubscribe: isSubscribe ?? this.isSubscribe,
        isActive: isActive ?? this.isActive,
        dateModified: dateModified ?? this.dateModified,
        dateAdded: dateAdded ?? this.dateAdded,
        isPrimaryAccount: isPrimaryAccount ?? this.isPrimaryAccount,
        isNew: isNew ?? this.isNew,
        isPrivacy: isPrivacy ?? this.isPrivacy,
      );

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyId: json["company_id"],
        auth: json["auth"],
        companyName: json["company_name"],
        companyEmail: json["company_email"],
        companyGstin: json["company_gstin"],
        companyMobileNo: json["company_mobile_no"],
        companyAddress: json["company_address"],
        companyDescription: json["company_description"],
        companyPhoto: json["company_photo"],
        businessType: json["business_type"],
        companyPhoto2: json["company_photo_2"],
        companyWebsite: json["company_website"],
        currency: json["currency"],
        bankName: json["bank_name"],
        acNo: json["ac_no"],
        ifscCode: json["ifsc_code"],
        userId: json["user_id"],
        themeId: json["theme_id"],
        sendSms: json["send_sms"],
        allowNotification: json["allow_notification"],
        isPinset: json["is_pinset"],
        pinPassword: json["pin_password"],
        notificationTime: json["notification_time"],
        sendSmsOnPayment: json["send_sms_on_payment"],
        reminderType: json["reminder_type"],
        sendSmsOnPurchase: json["send_sms_on_purchase"],
        smsPaymentText: json["sms_payment_text"],
        smsPurchaseText: json["sms_purchase_text"],
        companyTypeId: json["company_type_id"],
        myPoints: json["my_points"],
        bonusAdded: json["bonus_added"],
        businessRank: json["business_rank"],
        isSubscribe: json["is_subscribe"],
        isActive: json["is_active"],
        dateModified: DateTime.parse(json["date_modified"]),
        dateAdded: DateTime.parse(json["date_added"]),
        isPrimaryAccount: json["is_primary_account"],
        isNew: json["is_new"],
        isPrivacy: json["is_privacy"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "auth": auth,
        "company_name": companyName,
        "company_email": companyEmail,
        "company_gstin": companyGstin,
        "company_mobile_no": companyMobileNo,
        "company_address": companyAddress,
        "company_description": companyDescription,
        "company_photo": companyPhoto,
        "business_type": businessType,
        "company_photo_2": companyPhoto2,
        "company_website": companyWebsite,
        "currency": currency,
        "bank_name": bankName,
        "ac_no": acNo,
        "ifsc_code": ifscCode,
        "user_id": userId,
        "theme_id": themeId,
        "send_sms": sendSms,
        "allow_notification": allowNotification,
        "is_pinset": isPinset,
        "pin_password": pinPassword,
        "notification_time": notificationTime,
        "send_sms_on_payment": sendSmsOnPayment,
        "reminder_type": reminderType,
        "send_sms_on_purchase": sendSmsOnPurchase,
        "sms_payment_text": smsPaymentText,
        "sms_purchase_text": smsPurchaseText,
        "company_type_id": companyTypeId,
        "my_points": myPoints,
        "bonus_added": bonusAdded,
        "business_rank": businessRank,
        "is_subscribe": isSubscribe,
        "is_active": isActive,
        "date_modified": dateModified.toIso8601String(),
        "date_added": dateAdded.toIso8601String(),
        "is_primary_account": isPrimaryAccount,
        "is_new": isNew,
        "is_privacy": isPrivacy,
      };
}

class User {
  User({
    required this.companyUserId,
    required this.userName,
    required this.mobileNo,
    required this.emailId,
    required this.userId,
    required this.image,
    required this.companyIds,
    required this.isActive,
    required this.dateAdded,
    required this.dateModified,
  });

  final String companyUserId;
  final String userName;
  final String mobileNo;
  final String emailId;
  final String userId;
  final String image;
  final String companyIds;
  final bool isActive;
  final DateTime dateAdded;
  final DateTime dateModified;

  factory User.fromJson(Map<String, dynamic> json) => User(
        companyUserId: json["company_user_id"] ?? "",
        userName: json["user_name"] ?? "",
        mobileNo: json["mobile_no"] ?? "",
        emailId: json["email_id"] ?? "",
        userId: json["user_id"] ?? "",
        image: json["image"] ?? "",
        companyIds: json["company_ids"] ?? "",
        isActive: json["is_active"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateModified: DateTime.parse(json["date_modified"]),
      );

  Map<String, dynamic> toJson() => {
        "company_user_id": companyUserId,
        "user_name": userName,
        "mobile_no": mobileNo,
        "email_id": emailId,
        "user_id": userId,
        "image": image,
        "company_ids": companyIds,
        "is_active": isActive,
        "date_added": dateAdded.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
      };
}
