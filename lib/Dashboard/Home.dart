import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/Dashboard/you_will/you_will.dart';
import 'package:lezrapp/play/P_splash_screen.dart';
import 'package:lezrapp/scanner/page1.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Const.dart';
import '../Widget/homepage/Icons_withname.dart';
import 'package:http/http.dart' as http;
import '../Widget/homepage/Mybusiness.dart';
import '../Widget/homepage/custom_buttons.dart';
import '../Widget/homepage/custom_pageview.dart';
import '../Widget/homepage/fIrst_container.dart';
import '../Widget/homepage/home_textfield.dart';
import '../Widget/homepage/icons_row.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../api/const_apis.dart';
import '../api_model/get_summary.dart';
import '../controller.dart';
import '../getx controller/subscription.dart';
import '../getx controller/summarycontroller.dart';
import '../helper.dart';
import '../login/loginas_screen.dart';
import '../mybusiness_screens/settings_screens/subscriptions_screens.dart';
import '../scanner/datascanfirstpage.dart';
import '../screens/Transactions/transactions.dart';
import '../sharedpref.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  Controller settingbool = Get.put(Controller());
  @override
  void initState() {
    _summarycontroller.get_summarydetails();
    log(_summarycontroller.currantpackag.message);
    Controller settingbool = Get.put(Controller());
    super.initState();
    if (_summarycontroller.currantpackag.data.packageExpired == true)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        planexpireshowdialogbox(context);
      });
  }

  String rupeeSign = "\u20B9";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Color(0xffDEDEDE).withOpacity(0.1),
          body: GetBuilder<Summarycontroller>(
        builder: (controller) {
          return controller.summaryshow == true
              ? Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    First_Textfield(remider: controller.summary.todaysReminder),
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowIndicator();
                          return false;
                        },
                        child: SingleChildScrollView(
                          // physics: S,
                          child: Column(
                            children: [
                              const Icons_Row(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(28, 15, 18, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        First_Container(
                                          name: 'YOU WILL GET',
                                          rupees:
                                              '₹ ${controller.summary.summery.totalReceivalble.toStringAsFixed(2)}',
                                          onpress: () {
                                            String year =
                                                DateTime.now().year.toString();
                                            controller
                                                .get_salseandpurchasegohome(
                                                    year);
                                          },
                                        ),
                                        First_Container(
                                          name: 'YOU WILL PAY',
                                          rupees:
                                              '₹ ${controller.summary.summery.totalPayable.toStringAsFixed(2)}',
                                          onpress: () {
                                            String year =
                                                DateTime.now().year.toString();
                                            controller
                                                .get_salseandpurchasegohome(
                                                    year);
                                          },
                                        ),
                                      ],
                                    ),
                                    Icon_With_Name(
                                      Stringimage:
                                          'assets/new/l/transaction.png',
                                      name: 'View Transactions',
                                      onPressed: () {
                                        Get.to(
                                          () => Transactions(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 7,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              Customer_Pageview(),
                              Divider(
                                thickness: 7,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              My_Business(summary: controller.summary),
                              Divider(
                                thickness: 7,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Obx(
                                () => Visibility(
                                  visible: settingbool.enable.value == true
                                      ? false
                                      : true,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Container(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    width: 10,
                                                    color: yellowcustomer),
                                              ),
                                              color:
                                                  custom, // Make sure you define 'customColor' variable
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "My Rank",
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    yellowcustomer),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            controller.summary
                                                                .summery.rank,
                                                            style: TextStyle(
                                                                fontSize: 35,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    yellowcustomer),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                    "assets/gif/Rank Section - One time.gif")
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  // vertical: 10,
                                ),
                                child: Container(
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 10,
                                                color: yellowcustomer),
                                            top: BorderSide(
                                                width: 10, color: custom),
                                          ),
                                          color: Colors
                                              .white, // Make sure you define 'customColor' variable
                                        ),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Container(
                                                  height: 80,
                                                  color: custom,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: screenwidth(
                                                            context,
                                                            dividedby: 3),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                      border: Border.all(
                                                                          color:
                                                                              yellowcustomer,
                                                                          width:
                                                                              1)),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            3,
                                                                        horizontal:
                                                                            5.0),
                                                                    child: Text(
                                                                      "Current Plan",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              yellowcustomer,
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  _summarycontroller
                                                                      .currantpackag
                                                                      .data
                                                                      .packageName,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )
                                                              ],
                                                            ),
                                                            InkWell(
                                                              onTap: () =>
                                                                  Get.to(
                                                                subscriptions_screens(),
                                                              ),
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              4),
                                                                          border: Border.all(
                                                                              color: Colors.white,
                                                                              width: 1)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                            vertical:
                                                                                3,
                                                                            horizontal:
                                                                                5.0),
                                                                        child:
                                                                            Text(
                                                                          "${_summarycontroller.currantpackag.data.remainingDays.toString()} Days Left",
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white,
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            yellowcustomer,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4),
                                                                        // border: Border.all(
                                                                        //     color:
                                                                        //         Colors.white,
                                                                        //     width: 2),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                            vertical:
                                                                                4,
                                                                            horizontal:
                                                                                7.0),
                                                                        child:
                                                                            Text(
                                                                          "Upgrade Now",
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white,
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height: 130,
                                                    width: 110,
                                                    child: Image.asset(
                                                        "assets/gif/Lezy Coin from LezrApp - Gold.gif")),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                color: Colors.grey.shade300,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Custom_buttons(
                                        yes: true,
                                        onPressed: () async {
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: 'support@lezrapp.com',
                                          );
                                          // var url =
                                          //     'https://wa.me/6372816447?text=';
                                          await launch(
                                              emailLaunchUri.toString());
                                        },
                                        Stringimage:
                                            'assets/gif/24 x 7 Help & Support.png',
                                        name: '24 X 7 help & Support'.tr,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          screenwidth(context, dividedby: 40),
                                    ),
                                    Expanded(
                                      child: Custom_buttons(
                                        yes: false,
                                        onPressed: () async {
                                          Get.delete();
                                          await SharedPref.deleteAll();
                                          Get.offAll(
                                            DataQRscanner(),
                                          );
                                        },
                                        Stringimage:
                                            'assets/settings/logout.png',
                                        name: "Log Out".tr,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      thickness: 5,
                      color: Color(0xffF1BC5E),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 0,
                      thickness: 5,
                      color: custom,
                    ),
                  ],
                )
              : SizedBox();
        },
      )),
    );
  }
}
