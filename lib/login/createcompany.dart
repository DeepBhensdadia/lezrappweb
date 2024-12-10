import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../Const.dart';
import '../api/const_apis.dart';
import '../api_model/login/staff_login_model.dart';
import '../api_model/type_model.dart';
import '../getx controller/editprofile.dart';
import '../helper.dart';
import '../mybusiness_screens/business_card/businesscard_screen.dart';
import '../sharedpref.dart';

class CreateCompany extends StatefulWidget {
  final String mobileno;
  final String userid;
  const CreateCompany({Key? key, required this.mobileno, required this.userid})
      : super(key: key);

  @override
  State<CreateCompany> createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  Editprofile edit = Get.put(Editprofile());

  TextEditingController B_Name = TextEditingController();
  TextEditingController Location = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Description = TextEditingController();
  TextEditingController bussinesstype = TextEditingController();
  bool value = false;
  Create_company() async {
    context.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      "user_id": widget.userid,
      'company_name': B_Name.text,
      'company_type_id': bussinesstype.text,
      'company_email': email.text,
      'company_address': Location.text,
      'company_mobileno': widget.mobileno,
      'company_description': Description.text,
      "is_subscribe": "0"
    };
    await SAVE_COMPANY(parameter: parameter).then((value) async {
      context.loaderOverlay.show();
      if (value.success != true) {
        Get.snackbar("Wrong!!", value.message, backgroundColor: Colors.white);
        Fluttertoast.showToast(msg: value.message.toString());
        context.loaderOverlay.hide();
      } else {
        saveuserapi(
                // devicetocken: kweb() ? "":(await messaging.getToken()).toString(),
                mobileno: widget.mobileno)
            .then((value) async {
          Get.snackbar("Success!", value.message,
              backgroundColor: Colors.white);
          await SharedPref.save(
              value: jsonEncode(value.toJson()), prefKey: PrefKey.saveuser);
          MainScreengo();
          context.loaderOverlay.hide();
        });
        print("object");
      }
      log(value.toString());
      context..loaderOverlay.hide();
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      print(error);
    });
  }

  @override
  void initState() {
    edit.businesstype();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<Editprofile>(
        builder: (controller) => controller.show.isFalse
            ? SizedBox()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.red,
                          height: 170,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  height: 110,
                                  width: 110,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/imgs/new/logo.png'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 35,
                                width: 120,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LezrApp",
                                      style: GoogleFonts.comfortaa(
                                          // letterSpacing: 1,
                                          color: Colors.black,
                                          fontSize: screenwidth(context,
                                              dividedby: 18),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "TM",
                                          style: GoogleFonts.comfortaa(
                                              color: Colors.black,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: screenwidth(context, dividedby: 1.2),
                      child: Text(
                        "Create LezrApp acoount with Phone Number +91 ${widget.mobileno} ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          cardcreatecomapnytextfield(
                              icon: Icon(
                                Icons.business,
                                color: Color(0xff294472),
                              ),
                              isPasswordField: true,
                              controller: B_Name,
                              labelText: 'Business Name'.tr,
                              number: TextInputType.name,
                              maxlength: 100),
                          cardcreatecomapnytextfield(
                              icon: Icon(
                                Icons.business,
                                color: Color(0xff294472),
                              ),
                              controller: Location,
                              labelText: 'Location'.tr,
                              number: TextInputType.name,
                              maxlength: 100),
                          cardcreatecomapnytextfield(
                              icon: Icon(
                                Icons.email,
                                color: Color(0xff294472),
                              ),
                              controller: email,
                              labelText: 'Email'.tr,
                              number: TextInputType.emailAddress,
                              maxlength: 100),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 15),
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
                          DropdownButtonFormField<BusinessType>(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.ac_unit,
                                color: custom,
                              ),
                              hintText: '-Business Type-',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff294472), width: 0.5),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            value: controller.categori.businessTypes.first,
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
                              bussinesstype.text = value!.businessTypeId;
                            },
                          ),
                          cardcreatecomapnytextfield(
                              icon: Icon(
                                Icons.description,
                                color: Color(0xff294472),
                              ),
                              controller: Description,
                              labelText: 'Description'.tr,
                              number: TextInputType.name,
                              maxlength: 100),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: custom,
                            // checkColor: custom,
                            value: value,
                            onChanged: (val) {
                              setState(() {
                                value = val ?? false;
                              });
                            },
                          ),
                          Text(
                            'I accept all the terms and condition of lezrApp',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (value == true) {
                          Create_company();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please check the terms and condotions");
                        }
                      },
                      child: Ink(
                        height: 60,
                        width: screenwidth(context, dividedby: 1.3),
                        decoration: BoxDecoration(
                          color: Color(0xff294472),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("SIGN UP",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xffE1BE71),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      )),
    );
  }
}
