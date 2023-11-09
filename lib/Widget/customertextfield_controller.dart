import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class textfild extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController emaicontrollerl = TextEditingController();
  TextEditingController gstincontroller = TextEditingController();
  TextEditingController remarkcontroller = TextEditingController();

  TextEditingController namecontroller_1 = TextEditingController();
  TextEditingController phonecontroller_1 = TextEditingController();
  TextEditingController addresscontroller_1 = TextEditingController();
  TextEditingController emaicontrollerl_1 = TextEditingController();
  TextEditingController gstincontroller_1 = TextEditingController();
  TextEditingController remarkcontroller_1 = TextEditingController();

  var regExp1 =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
          .obs;
}
