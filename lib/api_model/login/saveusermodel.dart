// To parse this JSON data, do
//
//     final saveusermodel = saveusermodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Saveusermodel saveusermodelFromJson(String str) => Saveusermodel.fromJson(json.decode(str));

String saveusermodelToJson(Saveusermodel data) => json.encode(data.toJson());

class Saveusermodel {
  bool success;
  String message;
  bool backup;
  dynamic mobileno;
  dynamic company;
  dynamic userId;

  Saveusermodel({
    required this.success,
    required this.message,
    required this.backup,
    required this.mobileno,
    required this.company,
    required this.userId,
  });

  factory Saveusermodel.fromJson(Map<String, dynamic> json) => Saveusermodel(
    success: json["success"],
    message: json["message"],
    backup: json["backup"],
    mobileno: json["mobileno"],
    company:  json["company"] != false ?Company.fromJson(json["company"]) : {},
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "backup": backup,
    "mobileno": mobileno,
    "company": company.toJson(),
    "user_id": userId,
  };
}

class Company {
  String companyId;
  String auth;
  String companyName;
  String companyEmail;
  String companyGstin;
  String companyMobileNo;
  String companyAddress;
  String companyDescription;
  String companyPhoto;
  String businessType;
  String companyPhoto2;
  String companyWebsite;
  String currency;
  String bankName;
  String acNo;
  String ifscCode;
  String userId;
  String themeId;
  String sendSms;
  String allowNotification;
  String isPinset;
  String pinPassword;
  String notificationTime;
  String sendSmsOnPayment;
  String reminderType;
  String sendSmsOnPurchase;
  String smsPaymentText;
  String smsPurchaseText;
  String companyTypeId;
  String myPoints;
  bool bonusAdded;
  String businessRank;
  bool isSubscribe;
  bool isActive;
  String dateModified;
  String dateAdded;
  String isPrimaryAccount;
  String isNew;
  String isPrivacy;

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
    dateModified: json["date_modified"],
    dateAdded: json["date_added"],
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
    "date_modified": dateModified,
    "date_added": dateAdded,
    "is_primary_account": isPrimaryAccount,
    "is_new": isNew,
    "is_privacy": isPrivacy,
  };
}
