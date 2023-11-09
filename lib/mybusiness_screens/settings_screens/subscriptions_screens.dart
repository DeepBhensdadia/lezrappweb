import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/Widget/subscription_widget.dart';
import 'package:lezrapp/api_model/setting_api/get_all_subscriptions.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../api/const_apis.dart';
import '../../getx controller/subscription.dart';
import '../../helper.dart';
import '../../screens/refund_policy.dart';
import 'package:http/http.dart' as http;

class subscriptions_screens extends StatefulWidget {
  subscriptions_screens({Key? key}) : super(key: key);

  @override
  State<subscriptions_screens> createState() => _subscriptions_screensState();
}

class _subscriptions_screensState extends State<subscriptions_screens> {
  Subscription sub = Get.put(Subscription());
  int selectedTabIndex = 0;

  @override
  void initState() {
    sub.subscription();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom,
        automaticallyImplyLeading: false,
        title: Row(
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
              'Subscriptions'.tr,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  letterSpacing: 0.2,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Get.to(refund_policy());
                  },
                  icon: Icon(
                    Icons.question_mark,
                    size: 18,
                    color: Color(0xff294472),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Obx(
                () => sub.currentpackage.isTrue
                    ? Container(
                        width: screenwidth(context, dividedby: 1),
                        // height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 0.3,
                              offset: Offset(1, 1),
                            ),
                          ],
                          color: Color(0xffF1BC5C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Current Plan',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff294472),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                sub.currantpackag.data.packageName,
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xff294472),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "₹ ${sub.currantpackag.data.packgePrice}",
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xff294472),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                sub.currantpackag.data.remainingDays != 0
                                    ? "(${sub.currantpackag.data.remainingDays} Days Remaining)"
                                    : " Plan Expire ",
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: custom,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                minSize: 30,
                                color: custom,
                                onPressed: () {
                                  Get.to(subscriptions_screens());
                                },
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Obx(
                () => sub.subscribdata.isTrue
                    ? ListView.builder(
                        itemCount: sub.subscri.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Datum about = sub.subscri.data[index];
                          return (about.packageId == "5")
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          spreadRadius: 0.3,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    // height:
                                    //     screenheight(context, dividedby: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            about.packageName,
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: Color(0xff294472),
                                              fontSize: 27,
                                            ),
                                          ),
                                          Text(
                                            '• ${about.minUser} Users',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Color(0xff294472),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '• ${about.minBusiness} Users',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Color(0xff294472),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          (about.allowWebversion == "1")
                                              ? Text(
                                                  '• Web Version',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff294472),
                                                  ),
                                                )
                                              : Text(
                                                  '• No Web Version',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff294472),
                                                  ),
                                                ),
                                          // (about.allowBusinessGame == "1")
                                          //     ? Text(
                                          //   '• Play the Business Game',
                                          //   style: TextStyle(
                                          //     fontFamily:
                                          //     'SF Pro Display',
                                          //     fontSize: 15,
                                          //     fontWeight:
                                          //     FontWeight.w500,
                                          //     color: Color(0xff294472),
                                          //   ),
                                          // )
                                          //     : Text(
                                          //   '• Not allow Business Game',
                                          //   style: TextStyle(
                                          //     fontFamily:
                                          //     'SF Pro Display',
                                          //     fontSize: 15,
                                          //     fontWeight:
                                          //     FontWeight.w500,
                                          //     color: Color(0xff294472),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return subscription_widget1(
                                            about: about);
                                      },
                                    );
                                  },
                                  child: subscription_widget(
                                    child1: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            child: Text(
                                              '₹${about.monthlyPrice}/month',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationThickness: 2,
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff294472),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '₹${about.monthlyOfferPrice}',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: custom,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'month',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff294472),
                                            ),
                                          ),
                                          Text(
                                            'or',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: Color(0xff294472),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '₹${about.yearlyOfferPrice}/Year',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff294472),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            child: Text(
                                              '₹${about.yearlyPrice}/Year',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                decorationThickness: 2,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff294472),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child2: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // width: screenwidth(context,dividedby: 2),
                                            child: Text(
                                              about.packageName,
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w600,
                                                color: custom,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '• ${about.minUser} Users',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color:
                                                              Color(0xff294472),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '• Manage up to ${about.minBusiness} \n  Businesses',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff294472),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    (about.allowWebversion ==
                                                            "1")
                                                        ? Text(
                                                            '• Web Version',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff294472),
                                                            ),
                                                          )
                                                        : Text(
                                                            '• No Web Version',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff294472),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                // Row(
                                                //   children: [
                                                //     Text(
                                                //       '• Play the Business \n  Game',
                                                //       style: TextStyle(
                                                //         fontFamily:
                                                //         'SF Pro Display',
                                                //         fontSize: 15,
                                                //         fontWeight:
                                                //         FontWeight.w500,
                                                //         color: Color(
                                                //             0xff294472),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        },
                      )
                    : SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class subscription_widget extends StatelessWidget {
  subscription_widget({
    Key? key,
    required this.child1,
    required this.child2,
  }) : super(key: key);

  Widget child1;
  Widget child2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 0.3,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 170,
              width: screenwidth(context, dividedby: 2.7),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: const Color(0xffF1BC5C),
              ),
              child: child1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
              ),
              // height: screenheight(context, dividedby: 3.9),
              child: child2,
            ),
          ],
        ),
      ),
    );
  }
}
