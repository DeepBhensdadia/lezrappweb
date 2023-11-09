import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../api/const_apis.dart';
import '../../api_model/getcomapnystaff.dart';

class Staffcontroller extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  List<User> staff = [];
  bool staffshow = false;
  getsataffusers() async {
    await get_all_userapi().then((value) {
      staff.addAll(value.users);
      staffshow = true;
      update();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  getsataffusers2() async {
    await get_all_userapi().then((value) {
      staff = value.users;
      update();
      Get.back();
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
