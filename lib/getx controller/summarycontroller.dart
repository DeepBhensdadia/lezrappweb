import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lezrapp/getx%20controller/subscription.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Dashboard/you_will/you_will.dart';
import '../api/const_apis.dart';
import '../api_model/get_summary.dart';
import '../api_model/getmycurrentppackages.dart';
import '../api_model/salseandpurchasemodel.dart';
import '../api_model/smschangedsetting.dart';
import '../mainscreen.dart';

class Summarycontroller extends GetxController {
  RxBool staff = false.obs;

  Subscription sub = Get.put(Subscription());

  RxBool change = false.obs;
  late Slaseandpurchasemodelclass salsepuchase;
  get_summarydetails() async {
    await get_summary().then((value) {
      summary = value;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  late Smschangesetting smschange;

  get_changesetting(String remideron,String issetpin,String smson,String isprivercy,) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      '':saveuser()!.company.auth,
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'reminder_on': remideron,
      'sms_on': smson,
      'is_setpin': issetpin,
      'is_privacy': isprivercy

    };
    await smschangesetting(parameter: parameter).then((value) async {
      smschange = value;
      Get.context!.loaderOverlay.hide();
      await get_summary().then((value) {
        Get.context!.loaderOverlay.hide();
        summary = value;
        update();
      }).onError((error, stackTrace) {
        Get.context!.loaderOverlay.hide();
        print(error);
      });
      // Fluttertoast.showToast(msg: value.message.toString());
      update();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
  bool summaryshow = false;
  late GetSummary summary;
  late Getmycurrentpackage currantpackag;
  get_summarydetailsforhome() async {
    await get_summary().then((value) async {
      summary = value;
      await get_currantpackages().then((value) {
        currantpackag = value;
        summaryshow = true ;
        Get.offAll(() => MainScreen());
      }).onError((error, stackTrace) {
        print(error);
      });

      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  get_salseandpurchase(year) async {
    // Get.context?.loaderOverlay.show();
    change.value = true;
    await salsepurchase(year).then((value) {
      salsepuchase = value;
      Get.to(
        you_will(),
      );
      // Fluttertoast.showToast(msg: value.message);
      change.value = false;
      // Get.context?.loaderOverlay.hide();
      update();
    }).onError((error, stackTrace) {
      print("bhai $error");
    });
  }
  get_salseandpurchasegohome(year) async {
    Get.context?.loaderOverlay.show();
    change.value = true;
    await salsepurchase(year).then((value) {
      salsepuchase = value;
      Get.to(
        you_will(),
      );
      // Fluttertoast.showToast(msg: value.message);
      change.value = false;
      Get.context?.loaderOverlay.hide();
      update();
    }).onError((error, stackTrace) {
      print("bhai $error");
    });
  }

  sendwatsappremider(setremider,customerid,phonenumber){
    Get.context!.loaderOverlay.show();
    sendwahatsapp(setremider,customerid).then((value) {
      shareOnWhatsApp(value.message.toString() + value.shareLink.toString(),phonenumber);
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      print("error..$error");
    });
  }
}


 void shareOnWhatsApp(String message,String phoneNumber) async {
   String encodedMessage = Uri.encodeComponent(message);
   String whatsappUrl = "whatsapp://send?text=$encodedMessage${phoneNumber.isNotEmpty ? "&phone=+91$phoneNumber":""}" ;
   if (await canLaunch(whatsappUrl)) {
     await launch(whatsappUrl);
   } else {
     print('WhatsApp is not installed.');
   }
 }