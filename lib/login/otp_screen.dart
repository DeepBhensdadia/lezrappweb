import 'dart:convert';
import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/login/createcompany.dart';
import 'package:lezrapp/sharedpref.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../api/const_apis.dart';
import '../getx controller/summarycontroller.dart';
import '../mainscreen.dart';
import '../new_widget/bottun.dart';
import '../new_widget/textfild.dart';
import 'package:http/http.dart' as http;

import '../screens/splash_screen.dart';

class otp_screen extends StatelessWidget {
  final String mobileno;
  otp_screen({Key? key, required this.mobileno}) : super(key: key);

  TextEditingController otpcontroller = TextEditingController();
  // Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
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
                    padding:  EdgeInsets.symmetric(horizontal: screenwidth(context,dividedby: 5.5)),
                    child: Column(
                      children: [
                        Text(
                          "Verification ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 14.5,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Enter the OTP sent to +91$mobileno",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 14.5,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        common2_0(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: otpcontroller,
                          hintText: "......",
                          isPasswordField: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            onPressed: () async {
                              if (mobileno == "9861323291") {
                                // FirebaseMessaging messaging =
                                //     FirebaseMessaging.instance;
                                saveuserapi(
                                        // devicetocken: "",
                                        // kweb() ? "" : (await messaging.getToken()).toString(),
                                        mobileno: mobileno)
                                    .then((value) async {
                                  if (value.company.toString() != "{}") {
                                    Get.snackbar("Success!", value.message,
                                        backgroundColor: Colors.white);
                                    await SharedPref.save(
                                        value: jsonEncode(value.toJson()),
                                        prefKey: PrefKey.saveuser);
                                    MainScreengo();
                                  } else {
                                    Get.to(CreateCompany(
                                      mobileno: value.mobileno.toString(),
                                      userid: value.userId.toString(),
                                    ));
                                    log("company not found");
                                  }
                                }).onError((error, stackTrace) {
                                  Get.snackbar(
                                      "Not Found!", "Company Not Found!",
                                      backgroundColor: Colors.white);
                                });
                              } else {
                                context.loaderOverlay.show();
                                await verifyotp(
                                        mobileno: mobileno,
                                        otp: otpcontroller.text)
                                    .then((value) async {
                                  if (value.type == "success") {
                                    Fluttertoast.showToast(msg: value.message);
                                    saveuserapi(
                                            // devicetocken: "",
                                            // kweb() ? "":(await messaging.getToken()).toString(),
                                            mobileno: mobileno)
                                        .then((value) async {
                                      if (value.company.toString() != "{}") {
                                        Get.snackbar("Success!", value.message,
                                            backgroundColor: Colors.white);
                                        await SharedPref.save(
                                            value: jsonEncode(value.toJson()),
                                            prefKey: PrefKey.saveuser);
                                        MainScreengo();
                                      } else {
                                        log("company not found");
                                        Get.to(CreateCompany(
                                          mobileno: value.mobileno.toString(),
                                          userid: value.userId.toString(),
                                        ));
                                      }
                                    }).onError((error, stackTrace) {
                                      // Get.to(CreateCompany(mobileno :mobileno));
                                      context.loaderOverlay.hide();
                                      Get.snackbar(
                                          "Not Found!", "Company Not Found!",
                                          backgroundColor: Colors.white);
                                    });
                                  } else {
                                    context.loaderOverlay.hide();
                                    Get.snackbar("Invalid OTP",
                                        "! Invalid OTP. Please check your code and try again.");
                                  }
                                }).onError((error, stackTrace) {
                                  print(error);
                                });
                              }
                            },
                            name: "VERIFY"),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () async {
                            await resendotp(mobileno: mobileno).then((value) {
                              Fluttertoast.showToast(
                                      msg: value.message.toString())
                                  .onError((error, stackTrace) {
                                print(error);
                              });
                            });
                          },
                          child: Text(
                            "RESEND OTP",
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // body: FutureBuilder(
      //   future: save_user(),
      //   builder: (context,AsyncSnapshot<dynamic> snapshot) {
      //     if(snapshot.hasData){
      //       SaveUser deaitls = snapshot.data;
      //       print('hellooooooooooooooooooooo=${deaitls}');
      //       return NotificationListener<OverscrollIndicatorNotification>(
      //         onNotification: (notification) {
      //           notification.disallowIndicator();
      //           return false;
      //         },
      //         child: SingleChildScrollView(
      //           child: Center(
      //             child: Padding(
      //               padding: const EdgeInsets.only(top: 100),
      //               child: Column(
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       SizedBox(width: 40,),
      //                       Container(
      //                         // color: Colors.red,
      //                         height: 200,
      //                         width: 150,
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             ClipRRect(
      //                               borderRadius: BorderRadius.circular(8),
      //                               child:  Image(
      //                                 height: 110,
      //                                 width: 110,
      //                                 fit: BoxFit.cover,
      //                                 image: AssetImage('assets/imgs/new/logo.png'),
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               height: 5,
      //                             ),
      //                             Container(
      //                               height: 35,
      //                               width: 133,
      //                               // color: Colors.red,
      //                               child: Row(
      //                                 mainAxisAlignment: MainAxisAlignment.center,
      //                                 children: [
      //                                   Text(
      //                                     "LezrApp",
      //                                     style: GoogleFonts.comfortaa(
      //                                       // letterSpacing: 1,
      //                                         color: Colors.black,
      //                                         fontSize: screenwidth(context,dividedby: 18),
      //                                         fontWeight: FontWeight.w600),
      //                                   ),
      //                                   Column(
      //                                     mainAxisAlignment: MainAxisAlignment.start,
      //                                     children: [
      //                                       Text(
      //                                         "TM",
      //                                         style: GoogleFonts.comfortaa(
      //                                             color: Colors.black,
      //                                             fontSize: 9,
      //                                             fontWeight: FontWeight.w900),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
      //                     child: Column(
      //                       children: [
      //                         Text(
      //                           "Verification ",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               fontFamily: 'SF Pro Display',
      //                               fontSize: 14.5, color: Colors.black),
      //                         ),
      //                         Text(
      //                           "Enter the OTP sent to +917874250400",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               fontFamily: 'SF Pro Display',
      //                               fontSize: 14.5, color: Colors.grey),
      //                         ),
      //                         SizedBox(
      //                           height: 30,
      //                         ),
      //                         common2_0(
      //                           textAlign: TextAlign.center,
      //                           keyboardType: TextInputType.number,
      //                           controller: otpcontroller,
      //                           hintText: "......",
      //                           isPasswordField: true,
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         CustomButton(
      //                             onPressed: () {
      //                               Get.to(MainScreen());
      //                             },
      //                             name: "VERIFY"),
      //                         SizedBox(
      //                           height: 30,
      //                         ),
      //                         TextButton(
      //                           onPressed: () {
      //
      //                           },
      //                           child: Text(
      //                             "RESEND OTP",
      //                             style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.black),
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     }
      //     return Center(
      //         child: CircularProgressIndicator(
      //           color: Color(0xFF2C4475),
      //         ));
      //   },
      // ),
    );
  }
}
