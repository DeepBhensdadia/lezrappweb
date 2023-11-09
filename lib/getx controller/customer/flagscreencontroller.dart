import 'dart:convert';

import 'package:get/get.dart';

import '../../api/const_apis.dart';

import '../../api_model/customers/get_customers_api.dart';
import '../../api_model/totalcreditreport.dart';
import '../summarycontroller.dart';

class flagcontroller extends GetxController {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  List<Customer> allcustomer = <Customer>[];
  List<Customer> customer = <Customer>[];
  List<Customer> supplire = <Customer>[];
  int allpage = 0;
  int customerpage = 0;
  int supplierpage = 0;
  String queryText = "";

  // Other variables and methods...

  void changeTypeFavourite({required int index, required bool value,required String customertypeid}) {
    if (customertypeid == "0") {
      allcustomer[index].setIsFavourite = value ? 1 : 0;
      update();
    } else if (customertypeid == "1") {
      customer[index].setIsFavourite = value ? 1 : 0;
      update();
    } else if(customertypeid == "2") {
      supplire[index].setIsFavourite = value ? 1 : 0;
      update();
    }
  }

  getflagdata(customertypeid, queryText) async {
    var params = "&customer_type_id=" + customertypeid;

    if (customertypeid == "1") {
      params += "&offset=" + customerpage.toString();
    } else {
      params += "&offset=" + supplierpage.toString();
    }
    if (queryText.isNotEmpty) {
      params += "&search=" + queryText;
    }

    await get_allflag(para: params).then((value) {
      if (customertypeid == "0") {
        allcustomer.clear();
        allcustomer.addAll(value.customers);
        update();
      } else if (customertypeid == "1") {
        customer.clear();
        customer.addAll(value.customers);
        update();
      } else {
        supplire.clear();
        supplire.addAll(value.customers);
        update();
      }
      _summarycontroller.get_summarydetails();

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      print("error --> $error");
    });
  }
  getflagdatacustomid(customertypeid, queryText) async {
    var params = "&customer_type_id=" + customertypeid;

    if (customertypeid == "1") {
      params += "&offset=" + customerpage.toString();
    } else {
      params += "&offset=" + supplierpage.toString();
    }
    if (queryText.isNotEmpty) {
      params += "&search=" + queryText;
    }

    await get_allflag(para: params).then((value) {
      if (customertypeid == "0") {
        // allcustomer.clear();
        allcustomer.addAll(value.customers);
        update();
      } else if (customertypeid == "1") {
        // customer.clear();
        customer.addAll(value.customers);
        update();
      } else {
        // supplire.clear();
        supplire.addAll(value.customers);
        update();
      }
      _summarycontroller.get_summarydetails();

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      print("error --> $error");
    });
  }

  getflagdata2(queryText) async {
    var params = "&offset=" + allpage.toString();

    if (queryText.isNotEmpty) {
      params += "&search=" + queryText;
    }

    await get_allflag(para: params).then((value) {
      allcustomer.clear();
      allcustomer.addAll(value.customers);
      update();
      _summarycontroller.get_summarydetails();

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      print("error --> $error");
    });
  }
  getflagdata3(queryText) async {
    var params = "&offset=" + allpage.toString();

    if (queryText.isNotEmpty) {
      params += "&search=" + queryText;
    }

    await get_allflag(para: params).then((value) {
      allcustomer.addAll(value.customers);
      update();
      _summarycontroller.get_summarydetails();

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      print("error --> $error");
    });
  }
}
