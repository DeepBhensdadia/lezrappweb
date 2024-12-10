// To parse this JSON data, do
//
//     final changecurrencyResponse = changecurrencyResponseFromJson(jsonString);

import 'dart:convert';

ChangecurrencyResponse changecurrencyResponseFromJson(String str) => ChangecurrencyResponse.fromJson(json.decode(str));

String changecurrencyResponseToJson(ChangecurrencyResponse data) => json.encode(data.toJson());

class ChangecurrencyResponse {
  bool? success;
  String? message;
  Profile? profile;

  ChangecurrencyResponse({
    this.success,
    this.message,
    this.profile,
  });

  factory ChangecurrencyResponse.fromJson(Map<String, dynamic> json) => ChangecurrencyResponse(
    success: json["success"],
    message: json["message"],
    profile:json["profile"] != null ?  Profile.fromJson(json["profile"]):null,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "profile": profile?.toJson(),
  };
}

class Profile {
  String? companyId;
  String? auth;
  String? companyName;
  String? companyEmail;
  String? companyGstin;
  String? companyMobileNo;
  String? companyAddress;
  String? companyDescription;
  String? companyPhoto;
  String? businessType;
  String? companyPhoto2;
  String? companyWebsite;
  String? currency;
  String? bankName;
  String? acNo;
  String? ifscCode;
  String? userId;
  String? themeId;
  String? sendSms;
  String? allowNotification;
  String? isPinset;
  String? pinPassword;
  String? notificationTime;
  String? sendSmsOnPayment;
  String? reminderType;
  String? sendSmsOnPurchase;
  String? smsPaymentText;
  String? smsPurchaseText;
  String? companyTypeId;
  String? myPoints;
  bool? bonusAdded;
  String? businessRank;
  bool? isSubscribe;
  bool? isActive;
  DateTime? dateModified;
  DateTime? dateAdded;
  String? isPrimaryAccount;
  String? isNew;
  String? isPrivacy;

  Profile({
    this.companyId,
    this.auth,
    this.companyName,
    this.companyEmail,
    this.companyGstin,
    this.companyMobileNo,
    this.companyAddress,
    this.companyDescription,
    this.companyPhoto,
    this.businessType,
    this.companyPhoto2,
    this.companyWebsite,
    this.currency,
    this.bankName,
    this.acNo,
    this.ifscCode,
    this.userId,
    this.themeId,
    this.sendSms,
    this.allowNotification,
    this.isPinset,
    this.pinPassword,
    this.notificationTime,
    this.sendSmsOnPayment,
    this.reminderType,
    this.sendSmsOnPurchase,
    this.smsPaymentText,
    this.smsPurchaseText,
    this.companyTypeId,
    this.myPoints,
    this.bonusAdded,
    this.businessRank,
    this.isSubscribe,
    this.isActive,
    this.dateModified,
    this.dateAdded,
    this.isPrimaryAccount,
    this.isNew,
    this.isPrivacy,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    "date_modified": dateModified?.toIso8601String(),
    "date_added": dateAdded?.toIso8601String(),
    "is_primary_account": isPrimaryAccount,
    "is_new": isNew,
    "is_privacy": isPrivacy,
  };
}
