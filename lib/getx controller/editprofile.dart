import 'package:get/get.dart';

import '../api/const_apis.dart';
import '../api_model/type_model.dart';

class Editprofile extends GetxController{

  late Categary categori;
RxBool show = false.obs;
  businesstype(){
    get_products().then((value) {

      categori = value;
      show.value = true;
      update();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}