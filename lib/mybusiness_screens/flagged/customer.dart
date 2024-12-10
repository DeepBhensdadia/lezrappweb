import 'dart:developer';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Const.dart';
import '../../Icons_row/reports_screen.dart';
import '../../api/const_apis.dart';
import '../../api_model/customers/get_customer_info.dart';
import '../../api_model/customers/get_customers_api.dart';
import '../../getx controller/customer/flagscreencontroller.dart';
import '../../getx controller/summarycontroller.dart';
import '../../helper.dart';
import '../../mainscreen_controller.dart';
import 'package:http/http.dart' as http;

import '../customer/customer_info.dart';
import '../customer/customer_screen.dart';

class customer_flagged extends StatefulWidget {
  @override
  State<customer_flagged> createState() => _customer_flaggedState();
}

class _customer_flaggedState extends State<customer_flagged> {
  flagcontroller flag_Conroller = Get.put(flagcontroller());
  final scrollcontroller = ScrollController();



  @override
  void initState() {
    flag_Conroller.customer.clear();
    flag_Conroller.customerpage = 0;
    flag_Conroller.queryText = "";
    flag_Conroller.getflagdatacustomid("1", flag_Conroller.queryText);
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        flag_Conroller.customerpage += 10;
      });
      print(flag_Conroller.customerpage);
      flag_Conroller.getflagdatacustomid("1", flag_Conroller.queryText);
    } else {
      print(flag_Conroller.customerpage);
    }
  }

  data(String c_id, String u_id, String cu_id, String yes) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Cookie': 'ci_session=8s2snk8594fdlgn7dpnvlahs1lnv7m9t'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '$customerurl/markFlagged?auth=${saveuser()!.company.auth}'));
    request.bodyFields = {
      'company_id': c_id,
      'user_id': u_id,
      'customer_id': cu_id,
      'is_favorite': yes,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('KUNJESH${await response.stream.bytesToString()}');
    print(response.reasonPhrase);
  }

  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<flagcontroller>(
      builder: (controller) {
        if (controller.customer.isEmpty) {
          return circulerprogress();
        }

        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: ListView.separated(
            itemCount: flag_Conroller.customer.length,
            controller: scrollcontroller,
            itemBuilder: (context, index) {
              Customer customer = flag_Conroller.customer[index];
              bool isflag = customer.getIsFavourite;

              return InkWell(
                onTap: () {
                  Get.to(
                    customer_info(
                        about: customer,
                       ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child:Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        // contentPadding: EdgeInsets.all(0),
                                        actions: [
                                          Column(
                                            children: [
                                              customer_profile(about: customer),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffF1BC5E),
                                  child: Center(
                                    child: Text(
                                      customer.customerName2,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 22,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: SizedBox(
                                width: screenwidth(context,dividedby: 2.2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        '${customer.customerName}',
                                        // maxLines: 3,
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        customer.customerMobileNo,
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {

                            ScaffoldMessenger.of(context).clearSnackBars();
                            if (isflag) {
                              const snackBar =
                              SnackBar(content: Text('flag remove!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              data(customer.companyId, customer.userId,
                                  customer.customerId, '0');
                              _summarycontroller.get_summarydetails();

                            } else {
                              const snackBar =
                              SnackBar(content: Text('flag added!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              data(customer.companyId, customer.userId,
                                  customer.customerId, '1');
                              _summarycontroller.get_summarydetails();
                            }
                            flag_Conroller.changeTypeFavourite(
                                index: index, value: isflag = !isflag,customertypeid: "1");
                          },
                          child: isflag
                              ? Container(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                Text(
                            getformettedamount(text: '${customer.totalAmount} ${customer.transactionType}'),
                                  maxLines: 3,
                                  overflow: TextOverflow
                                      .ellipsis,
                                  style: TextStyle(
                                      color:customer.transactionType == "Adv" ? Colors.green : Colors.red,
                                      fontSize: 16,
                                      fontFamily:
                                      'SF Pro Display',
                                      fontWeight:
                                      FontWeight
                                          .bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          4),
                                      border: Border.all(
                                          color:
                                          yellowcustomer,
                                          width: 1)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets
                                        .symmetric(
                                        horizontal:
                                        1.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.flag,
                                            color:
                                            yellowcustomer,
                                            size: 18),
                                        // Text(
                                        //   'UnFlag'
                                        //       .tr,
                                        //   style:
                                        //       TextStyle(
                                        //     fontSize: 12,
                                        //     fontFamily:
                                        //         'SF Pro Display',
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                              : Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            children: [
                              Text(
                          getformettedamount(text: '${customer.totalAmount} ${customer.transactionType}'),
                                style: TextStyle(
                                    fontFamily:
                                    'SF Pro Display',
                                     color:customer.transactionType == "Adv" ? Colors.green : Colors.red,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Row(
                                  children: [
                                    Icon(
                                        Icons.flag_outlined,
                                        color: Colors.black45,
                                        size: 18),
                                    // Text(
                                    //   'Flag'.tr,
                                    //   style: TextStyle(
                                    //       fontSize: 12),
                                    // )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return div();
            },
          ),
        );
      },
    );

  }
}
