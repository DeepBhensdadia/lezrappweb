import 'dart:convert';

import 'package:get/get.dart';

import '../../api/const_apis.dart';
import '../../api_model/totalcreditreport.dart';

class TransactionConroller extends GetxController {
  String customtype = "0";
  RxList alltransaction = [].obs;
  RxList customertransaction = [].obs;
  RxList suppliertransaction = [].obs;
  RxList alltransactionisnotdeleted = [].obs;
  RxList customertransactionisnotdeleted = [].obs;
  RxList suppliertransactionisnotdeleted = [].obs;
  int allpage = 0;
  int customerpage = 0;
  int supplierpage = 0;
  String expense_type_id = "";
  String queryText = "";
  String sorty_order = "";
  String from_date = "";
  String to_date = "";
  RxBool isloadingdata = false.obs;
  getpages(customertypeid) async {
    isloadingdata.value = true;
    var params = "&customer_type_id=" + customertypeid;

    if (customertypeid == "0") {
      params += "&offset=" + allpage.toString();
    } else if (customertypeid == "1") {
      params += "&offset=" + customerpage.toString();
    } else {
      params += "&offset=" + supplierpage.toString();
    }

    if (expense_type_id.isNotEmpty) {
      params += "&expense_type_id=" + expense_type_id;
    }
    if (queryText.isNotEmpty) {
      params += "&search=" + queryText;
    }
    if (sorty_order.isNotEmpty) {
      params += "&sorty_order=" + sorty_order;
    }
    if (from_date.isNotEmpty) {
      params += "&from_date=" + from_date.toString();
    }
    if (to_date.isNotEmpty) {
      params += "&to_date=" + to_date.toString();
    }
    await get_transaction(params).then((value) {
      if (customertypeid == "0") {
        alltransaction = alltransaction + value.transactions;
        value.transactions.forEach((element) {
          if (element.isDelete == 0) {
            alltransactionisnotdeleted.add(element);
          }

        });
        update();
      } else if (customertypeid == "1") {
        customertransaction = customertransaction + value.transactions;
        value.transactions.forEach((element) {
          if (element.isDelete == 0) {
            customertransactionisnotdeleted.add(element);
          }

        });

        update();
      } else if(customertypeid == "2") {
        suppliertransaction = suppliertransaction + value.transactions;
        value.transactions.forEach((element) {
          if (element.isDelete == 0) {
            suppliertransactionisnotdeleted.add(element);
          }

        });
        update();
      }
      isloadingdata.value = false;

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      isloadingdata.value = false;

      print("error --> $error");
      print("error --> $stackTrace");
    });
  }

  getpages2(customertypeid) async {
    isloadingdata.value = true;

    var params = "&customer_type_id=" + customertypeid;

    if (customertypeid == "0") {
      params += "&offset=" + allpage.toString();
    } else if (customertypeid == "1") {
      params += "&offset=" + customerpage.toString();
    } else {
      params += "&offset=" + supplierpage.toString();
    }

    if (expense_type_id.isNotEmpty) {
      params += "&expense_type_id=" + expense_type_id;
    }
    if (queryText.isNotEmpty) {
      params += "&search=" + queryText;
    }
    if (sorty_order.isNotEmpty) {
      params += "&sorty_order=" + sorty_order;
    }
    if (from_date.isNotEmpty) {
      params += "&from_date=" + from_date.toString();
    }
    if (to_date.isNotEmpty) {
      params += "&to_date=" + to_date.toString();
    }
    await get_transaction(params).then((value) {
      if (customertypeid == "0") {
        allpage = 0;
        alltransaction.clear();
        alltransaction = alltransaction + value.transactions;
        update();
      } else if (customertypeid == "1") {
        customerpage = 0;
        customertransaction.clear();
        customertransaction = customertransaction + value.transactions;
        update();
      } else {
        supplierpage = 0;
        suppliertransaction.clear();
        suppliertransaction = suppliertransaction + value.transactions;
        update();
      }
      isloadingdata.value = false;

      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      isloadingdata.value = false;

      print("error --> $error");
      print("error --> $stackTrace");
    });
  }


}
