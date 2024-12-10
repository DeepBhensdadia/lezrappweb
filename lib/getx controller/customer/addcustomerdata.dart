import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../Const.dart';
import '../../api/const_apis.dart';
import '../transactioncontrollers/customercontroller.dart';
import 'getcustomersdatamybussiness.dart';

class AddCustomerdata extends GetxController {
  getcutomerdatamybusi getcustomer_Conroller = Get.put(getcutomerdatamybusi());
  getsuppliredatamybusi getsupplire_Conroller =
      Get.put(getsuppliredatamybusi());
  Customertransactioncontroller customtransaction =
      Get.put(Customertransactioncontroller());
  TextEditingController namecontroller_1 = TextEditingController();
  TextEditingController phonecontroller_1 = TextEditingController();
  TextEditingController addresscontroller_1 = TextEditingController();
  TextEditingController emaicontrollerl_1 = TextEditingController();
  TextEditingController gstincontroller_1 = TextEditingController();
  TextEditingController remarkcontroller_1 = TextEditingController();
  adddata({required String customertypeid, var customerphotu}) async {
    Get.context!.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'is_favorite': "0",
      'customer_name': namecontroller_1.text,
      'customer_mobile_no': phonecontroller_1.text,
      'customer_gstin': gstincontroller_1.text,
      'company_user_id': '0',
      'customer_type_id': customertypeid,
      'customer_address': addresscontroller_1.text,
      'customer_remark': remarkcontroller_1.text,
      'customer_email': emaicontrollerl_1.text
    };
    if (customerphotu != null) {
      final bytes = await customerphotu!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['customer_photo'] = base64Image;
    }
    await Addcustomerdataname(parameter: parameter).then((value) {
            showSuccessPopup(Get.context!);
            Fluttertoast.showToast(msg: value.message);
            if (customertypeid == "1") {
              getcustomer_Conroller.pagecustom = 0;
              getcustomer_Conroller.getpagescustom("1");
            } else {
              getsupplire_Conroller.page = 0;
              getsupplire_Conroller.getpages("2");
            }

            log(value.toString());
            Get.context!..loaderOverlay.hide();
          }).onError((error, stackTrace) {
            Get.context!.loaderOverlay.hide();

            print(error);
          });
  }

  editdata(
      {required String customertypeid,
      required String CUSTOMEID,
      var customerphotu}) async {
    Get.context!.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'is_favorite': "0",
      'customer_name': namecontroller_1.text,
      'customer_mobile_no': phonecontroller_1.text,
      'customer_gstin': gstincontroller_1.text,
      'company_user_id': '0',
      'customer_type_id': customertypeid,
      'customer_address': addresscontroller_1.text,
      'customer_remark': remarkcontroller_1.text,
      'customer_email': emaicontrollerl_1.text,
      "customer_id": CUSTOMEID
    };
    if (customerphotu != null) {
      final bytes = await customerphotu!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['customer_photo'] = base64Image;
    }
    await updatecustomerdataname(parameter: parameter).then((value) {
      // showSuccessPopup(Get.context!);
      Fluttertoast.showToast(msg: value.message);
      if (customertypeid == "1") {
        getcustomer_Conroller.pagecustom = 0;
        getcustomer_Conroller.getpagescustom("1");
      } else {
        getsupplire_Conroller.page = 0;
        getsupplire_Conroller.getpages("2");
      }
      log(value.toString());
      Get.context!.loaderOverlay.hide();
      customtransaction.getcustomerdata(value.customerId);
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print(error);
    });
  }
}

class AddSuppliredata extends GetxController {
  getsuppliredatamybusi getcustomer_Conroller =
      Get.put(getsuppliredatamybusi());

  TextEditingController namecontroller_1 = TextEditingController();
  TextEditingController phonecontroller_1 = TextEditingController();
  TextEditingController addresscontroller_1 = TextEditingController();
  TextEditingController emaicontrollerl_1 = TextEditingController();
  TextEditingController gstincontroller_1 = TextEditingController();
  TextEditingController remarkcontroller_1 = TextEditingController();
  adddata({required String customertypeid, var customerphotu}) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'is_favorite': "0",
      'customer_name': namecontroller_1.text,
      'customer_mobile_no': phonecontroller_1.text,
      'customer_gstin': gstincontroller_1.text,
      'company_user_id': '0',
      'customer_type_id': customertypeid,
      'customer_address': addresscontroller_1.text,
      'customer_remark': remarkcontroller_1.text,
      'customer_email': emaicontrollerl_1.text
    };
    if (customerphotu != null) {
      final bytes = await customerphotu!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['customer_photo'] = base64Image;
    }
    await Addcustomerdataname(parameter: parameter).then((value) {
      showSuccessPopup(Get.context!);
      // Fluttertoast.showToast(msg: value.message);
      getcustomer_Conroller.page = 0;
      getcustomer_Conroller.getpages("2");
      log(value.toString());
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print(error);
    });
  }
}
