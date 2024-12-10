import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../getx controller/subscription.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({Key? key}) : super(key: key);

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  Subscription sub = Get.put(Subscription());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: custom,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Upgrade Plan'.tr,
          style: TextStyle(
              fontFamily: 'SF Pro Display',
              letterSpacing: 0.2,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    // height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Plan",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yo BASIC",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: custom,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Paid on: 2022-10-13",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: custom,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        getformettedamount(text: "4898"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: custom,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Yearly",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: custom,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: yellowcustomer,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "Expire in: 88 days",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    // height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New Plan",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Plus Altra",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: custom,
                                            fontSize: 24),
                                      ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      // Text(
                                      //   "Paid on: 2022-10-13",
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.w600,
                                      //       color: custom,
                                      //       fontSize: 16),
                                      // )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        getformettedamount(text: "4898"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: custom,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Yearly",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: custom,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Deducted Amount: -${getformettedamount(text: "")} 1180",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: custom,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            // borderRadius: BorderRadius.only(
                            //   bottomLeft: Radius.circular(10),
                            //   bottomRight: Radius.circular(10),
                            // ),
                          ),
                          child: Text(
                            "Expire in: 88 days",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Note: Plan downgrade is allowed only when the current plan expires.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: custom),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CupertinoButton(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(            color: custom,borderRadius: BorderRadius.circular(10)
                ),
                height: 50,
                  width: double.infinity,
                   child: Text("CONFIRM AND PURCHASE PLAN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
              onPressed: () {},
            )
          ],
        ),
      ),
    ));
  }
}
