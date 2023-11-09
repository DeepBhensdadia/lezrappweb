import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api_model/report/reminder.dart';
import 'package:http/http.dart' as http;
import '../../helper.dart';
import '../reports_screen.dart';

class supplier_reminder extends StatelessWidget {
  const supplier_reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: get_reminder("2"),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            GetReminder detail = snapshot.data;
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: custom,
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
                      child: (detail.todaysTransactions == [])
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
                                                MainAxisAlignment.spaceBetween,
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
                                                          Icons.calendar_month,
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
                                                              color: Colors.grey
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
                                                                FontWeight.w500,
                                                            color: Colors.red),
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
                                  BoxShadow(color: Colors.grey, blurRadius: 3),
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
                          color:custom,
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
                      child: (detail.upcommingTransactions == [])
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
                                                MainAxisAlignment.spaceBetween,
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
                                                          Icons.calendar_month,
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
                                                              color: Colors.grey
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
                                                                FontWeight.w500,
                                                            color: Colors.red),
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
                                  BoxShadow(color: Colors.grey, blurRadius: 3),
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
                          color:custom,
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
                      child: (detail.pastTransactions != [])
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: detail.pastTransactions.length,
                              itemBuilder: (context, index) {
                                PastTransaction about =
                                    detail.pastTransactions[index];
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:screenwidth(context, dividedby: 2),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      about.customerName,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                            Icons.calendar_month,
                                                            size: 16,
                                                            color: Colors
                                                                .grey.shade400,
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
                                                                color: Colors.grey
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
                                                                FontWeight.w500,
                                                            color: Colors.red),
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
                                  BoxShadow(color: Colors.grey, blurRadius: 3),
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
            );
          }
          return Center(
              child: CircularProgressIndicator(
                  color: custom)
          );
        },
      ),
    );
  }
}
