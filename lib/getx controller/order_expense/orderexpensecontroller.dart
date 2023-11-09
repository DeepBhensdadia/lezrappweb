import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/const_apis.dart';
import '../../api_model/totalcreditreport.dart';
import '../summarycontroller.dart';

class Orderexpensecontroller extends GetxController {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  RxList allexpense = [].obs;

  int allpage = 0;
  bool show = false;
  bool call = true;
  // String expense_type_id = "";
  String queryText = "";
  String sorty_order = "";
  String from_date ="";
  String  to_date = "";
  RxBool isAllDataLoaded = false.obs;
  @override





  getexpense() async {
    isAllDataLoaded.value = true;
    var params =
      "&offset=" + allpage.toString();

    // if (expense_type_id.isNotEmpty) {
    //   params += "&expense_type_id=" + expense_type_id;
    // }
    // if (queryText.isNotEmpty) {
    //   params += "&search=" + queryText;
    // }
    if (sorty_order.isNotEmpty) {
      params += "&sorty_order=" + sorty_order;
    }
    if (from_date.isNotEmpty) {
      params += "&from_date=" + from_date.toString();
    }
    if (to_date.isNotEmpty) {
      params += "&to_date=" + to_date.toString();
    }
    await get_expense(params).then((value) {
      isAllDataLoaded.value = false;
      allexpense.addAll(value.expenses);
      _summarycontroller.get_summarydetails();

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      isAllDataLoaded.value = false;

      print("error --> $error");
    });
  }
  getexpense2() async {
    isAllDataLoaded.value = true;

    var params =
      "&offset=" + allpage.toString();

    // if (expense_type_id.isNotEmpty) {
    //   params += "&expense_type_id=" + expense_type_id;
    // }
    // if (queryText.isNotEmpty) {
    //   params += "&search=" + queryText;
    // }
    if (sorty_order.isNotEmpty) {
      params += "&sorty_order=" + sorty_order;
    }
    if (from_date.isNotEmpty) {
      params += "&from_date=" + from_date.toString();
    }
    if (to_date.isNotEmpty) {
      params += "&to_date=" + to_date.toString();
    }
    await get_expense(params).then((value) {
      isAllDataLoaded.value = false;

      allexpense.clear();
      allexpense.addAll(value.expenses);
      _summarycontroller.get_summarydetails();
      Get.back();
      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      isAllDataLoaded.value = false;

      print("error --> $error");
    });
  }
}

