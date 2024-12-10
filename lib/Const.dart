import 'dart:async';
import 'dart:math';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/const_apis.dart';
import 'controller.dart';
import 'getx controller/summarycontroller.dart';
import 'mybusiness_screens/settings_screens/subscriptions_screens.dart';


import 'dart:io';

final custom = Color(0xff28375B);
final yellowcustomer = Color(0xffF1BC5E);
Summarycontroller _summarycontroller = Get.put(Summarycontroller());
Controller c = Get.put(Controller());

cleartext(abc) {
  abc.phonecontroller_1.clear();
  abc.addresscontroller_1.clear();
  abc.emaicontrollerl_1.clear();
  abc.gstincontroller_1.clear();
  abc.remarkcontroller_1.clear();
  abc.namecontroller_1.clear();
}
MainScreengo(){

  _summarycontroller.staff.value = saveuser()?.user != null ? true :false ;
  c.state.value = saveuser()?.company.isPinset == "1" ? true :false;
  c.reminder.value = saveuser()?.company.allowNotification == "1" ? true :false ;
  c.enable.value = saveuser()?.company.isPrivacy == "1" ? true :false ;


  _summarycontroller.get_summarydetailsforhome();
}
Widget noresult() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/imgs/no-result.png"),
        Text(
          "No Result",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        )
      ],
    ),
  );
}


fontStyleHeading(){
 return  TextStyle(
      fontFamily:
      'SF Pro Display',
      color: custom,
      fontSize: 18,
      fontWeight:
      FontWeight
          .w600);
}

circulerprogress() {
  return FutureBuilder(
    future: Future.delayed(Duration(seconds: 5)),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
            child: CircularProgressIndicator(
          color: custom,
        ));
      } else {
         return noresult();
      }
    },
  );
}

Future<void> showSuccessPopup(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
elevation: 0,
        child: Container(
          width: 250,
          height: 200,
          child: Image.asset(height: 200,width: 200,"assets/gif/success12345.gif"),
        ),
      );
    },
  );
  await Future.delayed(Duration(seconds: 3));

  Get.back();
}

Future<void> plzwait(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
    elevation: 0,
        child: Container(
          width: 250,
          height: 200,
          child: Center(child: Container(
            decoration: BoxDecoration(            color: custom,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircularProgressIndicator(color: Colors.white,),
              SizedBox(height: 15,),
              Text("Please Wait...",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
            ],),
          )),
        ),
      );
    },
  );
}

planexpireshowdialogbox(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(

      // backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            color: custom,
            width: double.maxFinite,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: EasyRichText(
                      textAlign: TextAlign.center,
                      "Renew Your\n Subscription",
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'Your\n Subscription',
                          style: TextStyle(
                              color: yellowcustomer,
                              height: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                      defaultStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "LezrApp is now running in read-only Mode. To continue your work, buy a subscription today.",
                    style: TextStyle(color: Colors.white, fontSize: 14,height: 1.2),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  // CupertinoButton(
                  //   color: yellowcustomer,
                  //   onPressed: () {
                  //     Get.to(subscriptions_screens());
                  //   },
                  //   child: Text(
                  //     "BUY NOW",
                  //     style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                  SizedBox(
                    height: 25,
                  ),

                  Text(
                    "- Team LezrApp",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          IconButton(onPressed: () {
Get.back();
          }, icon: Icon(Icons.clear,color: Colors.white,))
        ],
      ),
    ),
  );
}

String generateCaptchaCode(int length) {
  final random = Random();
  const characters =
      'abcdefghijklmnopqrstuvwxyz0123456789';

  String captchaCode = '';

  for (int i = 0; i < length; i++) {
    final index = random.nextInt(characters.length);
    captchaCode += characters[index];
  }

  return captchaCode;
}

// alertbox(
//     {context,
//     required String titletext,
//     required String contain,
//     required String confirmbutton,
//     required void Function() ontap}) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
//         content: Container(
//           height: 120,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     titletext,
//                     style: GoogleFonts.notoSans(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ],
//               ),
//               Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 10, 50, 16),
//                   child: Text(contain,
//                       style: GoogleFonts.notoSans(
//                           color: Colors.grey,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500))),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       child: Text(
//                         'CANCEL'.tr,
//                         style: GoogleFonts.notoSans(
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff294472),
//                             fontSize: 15),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: ontap,
//                       child: Text(
//                         confirmbutton,
//                         style: GoogleFonts.notoSans(
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff294472),
//                             fontSize: 15),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

Nodatafound() {
  return Column(
    children: [
      Container(
        height: 200,
        child: Center(
          child: Stack(
            children: [
              Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/user_profile/notfound.jpeg')),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 150, 0, 0),
                child: Container(
                  color: Colors.white,
                  height: 40,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
      Text(
        'No Result Found'.tr,
        style: GoogleFonts.comfortaa(
            color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20),
      ),
    ],
  );
}


class StripeContainer extends StatelessWidget {
  final Widget child;

  StripeContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0, -4.0),
          end: Alignment(1.0, 4.0),
          colors: List.generate(66, (index) {
            if (index % 4 == 0 || index % 4 == 1) {
              return Colors.transparent;
            } else {
              return Colors.grey;
            }
          }),
          stops: () {
            final List<double> stops = [];
            double i = 0;
            double increment = 0.05;
            while (i < 1) {
              stops.add(i);
              i += increment;
              if (i >= 1) {
                stops.add(1);
                break;
              }
              increment = increment == 0.05 ? 0.01 : 0.05;
              stops.add(i);
            }
            return stops;
          }(),
        ),
      ),
      child: child,
    );
  }
}