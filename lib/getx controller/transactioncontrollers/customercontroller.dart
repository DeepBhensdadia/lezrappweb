import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../api/const_apis.dart';
import '../../api_model/customers/get_customer_info.dart';
import '../../api_model/transaction/get_transaction.dart';

class Customertransactioncontroller extends GetxController {
  late GetAllCinfo information;
  List<Transaction> transaction = <Transaction>[];
  List<Transaction> transactionnotdeleted = <Transaction>[];
  RxBool show = false.obs;

  String from_date = "";
  String to_date = "";
  RxBool isloadingdata = false.obs;
  bool finish = false;
  int page = 0;
  gettransaction(customerId) async {
    show.value = false;
    // Get.context!.loaderOverlay.show();
    var params = "&offset=$page";
    if (from_date.isNotEmpty) {
      params += "&from_date=" + from_date.toString();
    }
    if (to_date.isNotEmpty) {
      params += "&to_date=" + to_date.toString();
    }
    await get_transactioncustomer(customerId, params).then((value) async {
      if (value.transactions.isEmpty)
        // show.value = true;
        print(value.toString());
      if (value.transactions.isNotEmpty) {
        value.transactions.forEach((element) {
          transaction.add(element);
        });
        value.transactions.forEach((element) {
          if (element.isDelete == 0) {
            transactionnotdeleted.add(element);
          }
        });

        update();
        // Get.context!.loaderOverlay.hide();
      } else {
        finish = true;
        update();
        // Get.context!.loaderOverlay.hide();
      }
      await get_customer_info(customerId).then((value) {
        information = value;
        // Fluttertoast.showToast(msg: value.message);
        show.value = true;
      }).onError((error, stackTrace) {
        // Get.context!.loaderOverlay.hide();
        print(error);
      });
      // Fluttertoast.showToast(msg: value.message);
      update();
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // Get.context!.loaderOverlay.hide();
      print(error);
    });
  }

  getcustomerdata(customerId) async {
    Get.context!.loaderOverlay.show();
    await get_customer_info(customerId).then((value) {
      information = value;
      // Fluttertoast.showToast(msg: value.message);
      show.value = true;
      update();
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      // Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
}
