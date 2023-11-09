import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../api/const_apis.dart';
import '../api_model/getmycurrentppackages.dart';
import '../api_model/setting_api/get_all_subscriptions.dart';

class Subscription extends GetxController {
  late GetAllSubscriptions subscri;
  late Getmycurrentpackage currantpackag;
  RxBool subscribdata = false.obs;
  RxBool currentpackage = false.obs;
  subscription() async {
    Get.context!.loaderOverlay.show();

    await get_subscriptions().then((value) async {
      subscri = value;
      subscribdata.value = true;
      await get_currantpackages().then((value) {
        currantpackag = value;
        currentpackage.value = true;
        Get.context!.loaderOverlay.hide();
      }).onError((error, stackTrace) {
        print(error);
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
