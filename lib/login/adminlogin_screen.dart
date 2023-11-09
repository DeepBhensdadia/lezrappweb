import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/login/otp_screen.dart';
import '../api/const_apis.dart';
import '../helper.dart';
import '../new_widget/bottun.dart';
import '../new_widget/textfild.dart';
import '../screens/splash_screen.dart';

class adminlogin_screen extends StatelessWidget {
  adminlogin_screen({Key? key}) : super(key: key);

  TextEditingController phonenumbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Iconwithnamelogo()
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: screenwidth(context,dividedby: 5.5),vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        "We will send you One Time Password on "
                               "\n your phone number.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 14.5,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          CommonTextField2(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            controller: phonenumbercontroller,
                            hintText: "Enter Mobile Number",
                            // mexnumber: 10,

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Icon(
                              Icons.phone_outlined,
                              size: 25,
                              color: Color(0xff294472),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(

                          onPressed: () async {

                         await   CompanyLoginsendotp(
                                    mobileno: phonenumbercontroller.text)
                                .then((value) {
                              Get.snackbar( "Success!",value.message);
                             if(phonenumbercontroller.text != "7600015403"){
                               sendotp(mobileno: phonenumbercontroller.text)
                                   .then((value) {
                                 Get.to(
                                   otp_screen(
                                       mobileno: phonenumbercontroller.text),
                                 );
                               }).onError((error, stackTrace) {
                                 print(error);
                               });
                             }
                              Get.to(
                                otp_screen(
                                    mobileno: phonenumbercontroller.text),
                              );
                            }).onError((error, stackTrace) {
                              log(error.toString());
                            });
                          },
                          name: "CONTINUE",)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
