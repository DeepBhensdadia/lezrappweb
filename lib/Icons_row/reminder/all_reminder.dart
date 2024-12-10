import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:lezrapp/helper.dart';
import 'package:http/http.dart' as http;

import '../../Const.dart';
import '../../api_model/report/reminder.dart';
import '../../getx controller/remidercontroller.dart';

class all_reminder extends StatefulWidget {
  const all_reminder({Key? key}) : super(key: key);

  @override
  State<all_reminder> createState() => _all_reminderState();
}

class _all_reminderState extends State<all_reminder> {
  RemiderController remider = Get.put(RemiderController());
  @override
  void initState() {
    remider.reminder.clear();
    remider.today.clear();
    remider.upcoming.clear();
    remider.allData.clear();
    remider.first = 50;
    remider.get_all_remider();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemiderController>(
      builder: (remider) => remider.reminder.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: custom,
              ),
            )
          : NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return false;
              },
              child: LazyLoadScrollView(
                // scrollOffset: 200,
                onEndOfPage: () {
                  remider.loadData();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff294472),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                        ),
                        height: screenheight(context, dividedby: 25),
                        width: screenwidth(context, dividedby: 1),
                        child: Center(
                          child: Text(
                            'Today'.tr,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                        ),
                        child: (remider.today.isNotEmpty)
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: remider.today.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors.white,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20, top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: screenwidth(context,
                                                      dividedby: 2),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        remider.today[index]
                                                            .customerName,
                                                        // maxLines: 3,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            color: Color(
                                                                0xFF2C4475),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: 200,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              size: 16,
                                                              color: Colors.grey
                                                                  .shade400,
                                                            ),
                                                            Text(
                                                              remider
                                                                  .today[index]
                                                                  .dueDateFormatted,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Rs.${remider.today[index].amount} ${remider.today[index].transactionType2}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            Divider(
                                              height: 0,
                                              thickness: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 3),
                                  ],
                                ),
                                height: screenheight(context, dividedby: 20),
                                width: screenwidth(context, dividedby: 1),
                                child: Center(
                                  child: Text(
                                    'No Result Found'.tr,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff294472),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 3)
                            ]),
                        height: screenheight(context, dividedby: 25),
                        width: screenwidth(context, dividedby: 1),
                        child: Center(
                          child: Text('Upcoming'.tr,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                        ),
                        child: (remider.upcoming == [])
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors.white,
                                      height:
                                          screenheight(context, dividedby: 11),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20, top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      'Chandi Supply Agency',
                                                      // maxLines: 3,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color:
                                                              Color(0xFF2C4475),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      width: 200,
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_month,
                                                            size: 16,
                                                            color: Colors
                                                                .grey.shade400,
                                                          ),
                                                          Text(
                                                            '26-Dec-2022 13:21',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Rs.5880 Due',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            Divider(
                                              height: 0,
                                              thickness: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 3),
                                  ],
                                ),
                                height: screenheight(context, dividedby: 20),
                                width: screenwidth(context, dividedby: 1),
                                child: Center(
                                  child: Text(
                                    'No Result Found'.tr,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff294472),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 3)
                            ]),
                        height: screenheight(context, dividedby: 25),
                        width: screenwidth(context, dividedby: 1),
                        child: Center(
                          child: Text('Past'.tr,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                        ),
                        child: (remider.reminder.isNotEmpty)
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: remider.reminder.length,
                                itemBuilder: (context, index) {
                                  PastTransaction about =
                                      remider.reminder[index];
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors.white,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20, top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: screenwidth(context,
                                                      dividedby: 2),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        about.customerName,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        // maxLines: 3,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            color: Color(
                                                                0xFF2C4475),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: 200,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              size: 16,
                                                              color: Colors.grey
                                                                  .shade400,
                                                            ),
                                                            Text(
                                                              about
                                                                  .dueDateFormatted,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Rs.${about.amount} Due',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            div()
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 3),
                                  ],
                                ),
                                height: screenheight(context, dividedby: 20),
                                width: screenwidth(context, dividedby: 1),
                                child: Center(
                                  child: Text(
                                    'No Result Found'.tr,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
