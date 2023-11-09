import 'dart:convert';
import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/api_model/setting_api/get_all_subscriptions.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../api/const_apis.dart';
import '../getx controller/summarycontroller.dart';
import '../helper.dart';
import '../mybusiness_screens/settings_screens/upgradeplan.dart';
import '../sharedpref.dart';

class subscription_widget1 extends StatefulWidget {
  final Datum about;

  subscription_widget1({
    Key? key,
    required this.about,
  }) : super(key: key);

  @override
  State<subscription_widget1> createState() => _subscription_widget1State();
}

class _subscription_widget1State extends State<subscription_widget1> {
  int cur = 1;
  Razorpay razorpay = Razorpay();
  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Container(
        height: screenheight(context, dividedby: 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: screenwidth(context, dividedby: 1.3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          cur = 1;
                        });
                      },
                      child: Container(
                        height: screenheight(context, dividedby: 4.5),
                        // width: screenwidth(context, dividedby: 2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: (cur == 1) ? Color(0xffF1BC5C) : Colors.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    screenwidth(context, dividedby: 16)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenheight(context, dividedby: 30),
                                ),
                                Text(
                                  'Pay Monthly',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff294472),
                                  ),
                                ),
                                Text(
                                  "₹${widget.about.monthlyOfferPrice}",
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      color: Color(0xff294472),
                                      fontSize:
                                          screenwidth(context, dividedby: 16),
                                      fontWeight: FontWeight.bold),
                                ),
                                (cur == 1)
                                    ? Icon(
                                        Icons.task_alt_outlined,
                                        color: Color(0xff294472),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          cur = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: (cur == 2) ? Color(0xffF1BC5C) : Colors.white,
                        ),
                        height: screenheight(context, dividedby: 4.5),
                        // width: screenwidth(context, dividedby: 2),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    screenwidth(context, dividedby: 16)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenheight(context, dividedby: 30),
                                ),
                                Text(
                                  'Pay Yearly',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff294472),
                                  ),
                                ),
                                Text(
                                  "₹${widget.about.yearlyOfferPrice}",
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      color: Color(0xff294472),
                                      fontSize:
                                          screenwidth(context, dividedby: 16),
                                      fontWeight: FontWeight.bold),
                                ),
                                (cur == 2)
                                    ? Icon(
                                        Icons.task_alt_outlined,
                                        color: Color(0xff294472),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight(context, dividedby: 35),
            ),
            InkWell(
              onTap: () async {
                // context.loaderOverlay.show();
                Get.back();
                Map<String, dynamic> parameter = {
                  'package_id': widget.about.packageId,
                  'company_id': saveuser()!.company.companyId,
                  'user_id': saveuser()!.company.userId,
                  'package_type': cur.toString(),
                  "packge_price": cur == 1
                      ? widget.about.monthlyOfferPrice
                      : widget.about.yearlyOfferPrice
                };
                await prebuypackageapi(parameter: parameter)
                    .then((value) async {
                  // context.loaderOverlay.hide();
                  if (value.status == 0) {
                    Fluttertoast.showToast(msg: value.message.toString());
                  } else
                  // if(value.status == 1)
                  {
                    var options = {
                      // 'key': 'rzp_live_dY9Bqdnartqeb7', //original
                      'key': 'rzp_test_lUis0piS4tOia5',
                      'amount': cur == 1
                          ? num.parse(widget.about.monthlyOfferPrice) * 100
                          : num.parse(widget.about.yearlyOfferPrice) * 100,
                      'name': 'LezrApp',
                      // 'description': 'Fine T-Shirt',
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      // 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                        handleExternalWalletSelected);
                    razorpay.open(options);
                  }
//                   else if(value.status == 2){
// Get.to(UpgradePlanScreen());
//                   }
                }).onError((error, stackTrace) {
                  print("Error....$error");
                });

                // Navigator.pop(context);
              },
              child: Container(
                height: screenheight(context, dividedby: 22),
                width: screenwidth(context, dividedby: 3.5),
                decoration: BoxDecoration(
                  color: Color(0xff294472),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('PROCEED',
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  abcd() {
    return showAlertDialog(context, "Payment Processing Failed");
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    log(response.error.toString());
    Fluttertoast.showToast(msg: "payment faild");
    abcd();
  }

  Future<void> handlePaymentSuccessResponse(
      PaymentSuccessResponse response) async {
    Get.context!.loaderOverlay.show();
    Summarycontroller _summary = Get.put(Summarycontroller());
    Map<String, dynamic> parameter = {
      'package_id': widget.about.packageId,
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'package_type': cur.toString(),
      "packge_price": cur == 1
          ? widget.about.monthlyOfferPrice
          : widget.about.yearlyOfferPrice
    };
    await postbuypackage(parameter: parameter).then((value) async {
      // FirebaseMessaging messaging = FirebaseMessaging.instance;
      saveuserapi(
         // devicetocken: kweb() ? "":  (await messaging.getToken()).toString(),
              mobileno: saveuser()!.mobileno)
          .then((value) async {
        Get.delete();
        SharedPref.deleteAll();
        Get.snackbar("Success!", value.message, backgroundColor: Colors.white);
        await SharedPref.save(
            value: jsonEncode(value.toJson()), prefKey: PrefKey.saveuser);

        Future.delayed(
          Duration(seconds: 3),
          () {
            _summary.get_summarydetailsforhome();
            Get.context!.loaderOverlay.hide();
          },
        );

        log(value.toString());
      }).onError((error, stackTrace) {
        // Get.snackbar("Comapany!", value.message,
        //     backgroundColor: Colors.white);
        Get.snackbar("Not Found!", "Company Not Found!",
            backgroundColor: Colors.white);
      });

      Fluttertoast.showToast(msg: value.message);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    // showAlertDialog(
    //     context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(
    BuildContext context,
    String title,
  ) {
    // set up the buttons
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        Get.back();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      // content: Text(message),
      actions: [
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}
