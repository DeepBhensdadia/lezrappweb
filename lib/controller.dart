import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  late Uint8List exportedImage;
  RxBool state = false.obs;
  RxBool reminder = true.obs;
  RxBool enable = false.obs;
}