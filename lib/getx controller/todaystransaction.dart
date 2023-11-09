import 'package:get/get.dart';

import '../api/const_apis.dart';
import '../api_model/todaystransaction.dart';
import '../api_model/totalcreditreport.dart';

class todaystraalldata extends GetxController {
  late Todaystransaction credit;
  RxBool show = false.obs;

  customerdata() {
    todaystranall().then((value) {
      credit = value;

      show.value = true;
      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class todaystracustomer extends GetxController {
  late Todaystransaction credit;
  RxBool show = false.obs;

  customerdata() {
    todaystransaction("1",).then((value) {
      credit = value;

      show.value = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class todaystrasupplire extends GetxController {
  late Todaystransaction credit;
  RxBool show = false.obs;

  customerdata() {
    todaystransaction("2",).then((value) {
      credit = value;

      show.value = true;      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}