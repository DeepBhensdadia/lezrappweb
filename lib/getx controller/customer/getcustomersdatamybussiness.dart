import 'dart:convert';

import 'package:get/get.dart';


import '../../api/const_apis.dart';
import '../../api_model/customers/get_customers_api.dart';
import '../summarycontroller.dart';

class getcutomerdataall extends GetxController {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
 RxBool isdataloading = false.obs;
  List<Customer> postall = <Customer>[];
  int pageall = 0;
  String serchtextcustomall = "";
  void changeTypeFavourite({required int index, required bool value}) {
    postall[index].setIsFavourite = value ? 1 : 0;
    update();
  }
  getpagesall() async {
    isdataloading.value = true;
    await get_allsearch( serchtextcustomall, pageall.toString()).then((value) {
      if(pageall == 0){
        postall.clear();
      }
      postall.addAll(value.customers);
      update();

      _summarycontroller.get_summarydetails();
      isdataloading.value = false;
      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      isdataloading.value = false;
      print("error --> $error");
    });
  }

}

class getcutomerdatamybusi extends GetxController {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
 RxBool isdataloading = false.obs;
  List<Customer> postcustom = <Customer>[];
  int pagecustom = 0;
  String serchtextcustom = "";
  void changeTypeFavourite({required int index, required bool value}) {
    postcustom[index].setIsFavourite = value ? 1 : 0;
    update();
  }
  getpagescustom(customertypeid) async {
    isdataloading.value = true;
    await get_allcustomer(customertypeid, serchtextcustom, pagecustom.toString()).then((value) {
      if(pagecustom == 0){
        postcustom.clear();
      }
      postcustom.addAll(value.customers);
      update();
      _summarycontroller.get_summarydetails();
      isdataloading.value = false;
      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      isdataloading.value = false;
      print("error --> $error");
    });
  }

}

class getsuppliredatamybusi extends GetxController {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  RxBool isdataloading = false.obs;
  List<Customer> post = <Customer>[];
  int page = 0;
  String serchtext = "";
  void changeTypeFavourite({required int index, required bool value}) {
    post[index].setIsFavourite = value ? 1 : 0;
    update();
  }
  getpages(customertypeid) async {
    isdataloading.value = true;
    await get_allcustomer(customertypeid, serchtext, page.toString()).then((value) {
      if(page == 0){
        post.clear();
      }
      post.addAll(value.customers);
update();
      _summarycontroller.get_summarydetails();
isdataloading.value = false;
      print(jsonEncode(value));
    }).onError((error, stackTrace) {
      print("error --> $error");
    });
  }

}
