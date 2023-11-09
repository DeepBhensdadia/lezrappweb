import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../api/const_apis.dart';
import '../../api_model/customers/get_customers_api.dart';

class Transactionadd extends GetxController {
  TextEditingController account = TextEditingController();
  Customer? customeridtest;
  List<Customer> post = [];
  List<Customer> filteredElements = [];
  List<Customer> postcustomer = [];
  List<Customer> postsupplire = [];

  get_allcustomer(customerid) async {
    Get.context!.loaderOverlay.show();
    await get_allcustomerserch().then((value) {
      log(value.toString());
      for(var element in value.customers){
        if (element.customerId == customerid) {
          customeridtest = element;
          account.text = element.customerName;
        } else {
          if (element.customerTypeId == "1") {
            postcustomer.add(element);

          } else if (element.customerTypeId == "2") {
            postsupplire.add(element);

          }
        }
      };
      post.addAll(value.customers);
      update();
      Get.context!.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
