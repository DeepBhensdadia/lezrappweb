import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:screenshot/screenshot.dart';

class CardContrller extends GetxController{
  ScreenshotController screenshotController = ScreenshotController();
  String Bussinessname = saveuser()!.company.companyName ;
   String busitype = saveuser()?.company.businessType ;
   String location = saveuser()!.company.companyAddress ;
   String phonenumer = saveuser()!.company.companyMobileNo ;
   String Ownname = saveuser()!.company.companyName ;
   String emailuser = saveuser()!.company. companyEmail;

  void updatebussinessnameText(String newText) {
    print("chaneg");
    Bussinessname = newText;
    update();
  }
  void businesstypetext(String newText) {
    print("chaneg");
    busitype = newText;
    update();
  }
  void locationtext(String newText) {
    print("chaneg");
    location = newText;
    update();
  }
  void phonenumbertext(String newText) {
    print("chaneg");
    phonenumer = newText;
    update();
  }
  void ownnametext(String newText) {
    print("chaneg");
    Ownname = newText;
    update();
  }
  void Useremail(String newText) {
    print("chaneg");
    emailuser = newText;
    update();
  }
}