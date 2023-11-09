import 'package:get/get.dart';

import '../api/const_apis.dart';
import '../api_model/totalcreditreport.dart';

class Totalcreditallbhai extends GetxController {
  late Totalcreditreport credit;
  RxBool show = false.obs;

  customerdata() {
    Totalcreditall("1").then((value) {
      credit = value;

      show.value = true;      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class Totalcreditcustomer extends GetxController {
  late Totalcreditreport credit;
  RxBool show = false.obs;

  customerdata() {
    Totalcredit("1", "1").then((value) {
      credit = value;

      show.value = true;      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class Totalcreditsupplier extends GetxController {
  late Totalcreditreport credit;
  RxBool show = false.obs;

  customerdata() {
    Totalcredit("2", "1").then((value) {
      credit = value;

      show.value = true;      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class Totaldebitallbhai extends GetxController {
  late Totalcreditreport credit;
  RxBool show = false.obs;

  customerdata() {
    Totalcreditall("-1").then((value) {
      credit = value;

      show.value = true;
      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class Totaldebitcustomer extends GetxController {
  late Totalcreditreport credit;
  RxBool show = false.obs;

  customerdata() {
    Totalcredit("1", "-1").then((value) {
      credit = value;

      show.value = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class Totaldebitsupplier extends GetxController {
  late Totalcreditreport credit;
  RxBool show = false.obs;

  customerdata() {
    Totalcredit("2", "-1").then((value) {
      credit = value;

      show.value = true;      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
