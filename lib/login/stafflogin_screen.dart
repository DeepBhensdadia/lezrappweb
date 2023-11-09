import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/mainscreen.dart';
import '../Const.dart';
import '../api/const_apis.dart';
import '../getx controller/summarycontroller.dart';
import '../helper.dart';
import '../new_widget/bottun.dart';
import '../new_widget/textfild.dart';
import 'package:http/http.dart' as http;

import '../screens/splash_screen.dart';
import '../sharedpref.dart';

class stafflogin_screen extends StatefulWidget {
  stafflogin_screen({Key? key}) : super(key: key);

  @override
  State<stafflogin_screen> createState() => _stafflogin_screenState();
}

class _stafflogin_screenState extends State<stafflogin_screen> {
  TextEditingController Usernamecontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

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

                    Iconwithnamelogo()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 70, 50, 0),
                  child: Column(
                    children: [
                      Stack(children: [
                        CommonTextField2(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          controller: Usernamecontroller,
                          hintText: "Mobile No",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 18),
                          child: Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Color(0xff294472),
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(children: [
                        common2_0(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          controller: Passwordcontroller,
                          hintText: "Password",
                          isPasswordField: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 18),
                          child: Icon(
                            Icons.lock,
                            size: 30,
                            color: Color(0xff294472),
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          onPressed: () {
                            stafflogin(
                                    mobileno: Usernamecontroller.text,
                                    password: Passwordcontroller.text)
                                .then((value) async {
                              Get.snackbar( "Success!",value.message);
                              await SharedPref.save(
                                  value: jsonEncode(value.toJson()),
                                  prefKey: PrefKey.saveuser);
                              MainScreengo();
                            }).onError((error, stackTrace) {
                              print(error);
                            });
                          },
                          name: "LOGIN")
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
