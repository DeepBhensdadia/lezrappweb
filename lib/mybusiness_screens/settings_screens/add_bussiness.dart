import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../Const.dart';
import '../../Widget/customertextfield_controller.dart';
import '../../api/const_apis.dart';
import '../../api_model/type_model.dart';
import '../../getx controller/editprofile.dart';

class add_Business extends StatefulWidget {
  add_Business({Key? key}) : super(key: key);

  @override
  State<add_Business> createState() => _add_BusinessState();
}

class _add_BusinessState extends State<add_Business> {
  TextEditingController mobailcontrol = TextEditingController();
  TextEditingController business = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController btype = TextEditingController();
  TextEditingController bdescription = TextEditingController();
  Editprofile editprofile = Get.put(Editprofile());
  add_company() async {
    context.loaderOverlay.show();
    Map<String, dynamic> parameter = {
     'company_name': business.text,
     'company_type_id': btype.text,
     'company_email': mail.text,
      'is_subscribe':"1",
     'company_address': locationcontroller.text,
     'company_mobileno': mobailcontrol.text,
     'company_description': bdescription.text,
     'user_id': saveuser()!.company.userId.toString(),
    };
    await ADD_COMPANY(parameter: parameter).then((value) {
      Fluttertoast.showToast(msg: value.message!);
      Get.back();
      log(value.toString());
      context..loaderOverlay.hide();
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();

      print(error);
    });
  }
  @override
  void initState() {
    editprofile.businesstype();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff294472),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: 60,
            color: const Color(0xff294472),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'New Business'.tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: GetBuilder<Editprofile>(builder: (controller) {
            return  Container(
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      select_textfild(
                          controller: mobailcontrol,
                          labelText: 'Mobile Number'.tr,
                          number: TextInputType.name,
                          maxlength: 100),
                      select_textfild(
                          controller: business,
                          labelText: 'Business Name'.tr,
                          number: TextInputType.name,
                          maxlength: 100),
                      select_textfild(
                          controller: mail,
                          labelText: 'Email'.tr,
                          number: TextInputType.name,
                          maxlength: 100),
                      select_textfild(
                          controller: locationcontroller,
                          labelText: 'Location'.tr,
                          number: TextInputType.name,
                          maxlength: 100),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Row(
                          children: [
                            Text(
                              'Select Business Type'.tr,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: custom,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                     controller.show.isTrue ? Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: DropdownButtonFormField<BusinessType>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.ac_unit,
                              color: custom,
                            ),
                            hintText: '-Business Type-',
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xff294472), width: 0.5),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // value: controller.categori.businessTypes
                          //     .firstWhere((element) =>
                          // element.businessType ==
                          //     saveuser()?.company.businessType),
                          items: controller.categori.businessTypes
                              .map(
                                (e) => DropdownMenuItem<BusinessType>(
                              value: e,
                              child: Container(
                                width: 200,
                                child: Text(
                                  e.businessType,
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      // overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          )
                              .toList(),
                          onChanged: (value) {
                            btype.text = value!.businessTypeId;
                            // card.businesstypetext(value!.businessType);
                          },
                        ),
                     ):SizedBox(height: 20,),
                      select_textfild(
                          controller: bdescription,
                          labelText: 'Business Description'.tr,
                          number: TextInputType.name,
                          maxlength: 100),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child: InkWell(
                          onTap: () {
                            add_company();

                          },
                          child: Ink(
                            height: 40,
                            child: Center(
                              child: Text(
                                'SELECT'.tr,
                                style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.white),
                              ),
                            ),
                            color: Color(0xff294472),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },)



          ),
        ),
      ),
    );
  }
}


class select_textfild extends StatelessWidget {
  select_textfild({Key? key,
    required this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
    this.isPasswordField = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;

  textfild textcontroller = Get.put(textfild());
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(valueListenable: isFieldEmpty, builder: (context, value, child) =>
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                      labelText,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Color(0xff294472),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    TextField(
                      keyboardType: number,
                      maxLength: maxlength,
                      autocorrect: true,
                      autofocus: true,
                      // maxLengthEnforcement: MaxLengthEnforcement.none,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                        color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                      controller: controller,
                      cursorColor: Colors.black87,
                      cursorHeight: 30,
                      cursorWidth: 1.5,
                      onChanged: (value) {
                        if ( value.isEmpty) {
                          isFieldEmpty.value = true;
                        } else  {
                          isFieldEmpty.value = false;
                          // isFieldEmpty.value = false;/
                        }
                      },
                      decoration:  InputDecoration(
                          counterText: '',
                          // hintText: labelText,
                          hintStyle: TextStyle(
                              fontFamily: 'SF Pro Display',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff294472),width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2,
                              color:value ? Colors.red : Colors.green ,

                            ),
                          )),
                      // border: InputBorder.none,
                      // fillColor: Colors.purple,
                      // focusedBorder: OutlineInputBorder(borderSide: )
                    ),
                  ],
                ),
              ),
            ),
        ),

      ],
    );
  }
}
