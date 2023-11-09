// To parse this JSON data, do
//
//     final whatsappsendremider = whatsappsendremiderFromJson(jsonString);

import 'dart:convert';

Whatsappsendremider whatsappsendremiderFromJson(String str) => Whatsappsendremider.fromJson(json.decode(str));

String whatsappsendremiderToJson(Whatsappsendremider data) => json.encode(data.toJson());

class Whatsappsendremider {
  bool? success;
  String? message;
  Company? company;
  String? imageUrl;
  String? shareLink;

  Whatsappsendremider({
    this.success,
    this.message,
    this.company,
    this.imageUrl,
    this.shareLink,
  });

  factory Whatsappsendremider.fromJson(Map<String, dynamic> json) => Whatsappsendremider(
    success: json["success"],
    message: json["message"],
    company: Company.fromJson(json["company"]),
    imageUrl: json["image_url"],
    shareLink: json["share_link"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "company": company!.toJson(),
    "image_url": imageUrl,
    "share_link": shareLink,
  };
}

class Company {
  String? companyId;
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
  String? dateModified;
  String? dateAdded;

  Company({
    this.companyId,
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
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    companyId: json["company_id"],
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
  );

  Map<String, dynamic> toJson() => {
    "company_id": companyId,
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
  };
}
