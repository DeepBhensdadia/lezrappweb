import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:lezrapp/helper.dart';
import '../../Const.dart';
import '../../Dashboard/addcustomer.dart';
import '../../Icons_row/reports_screen.dart';
import '../../api/const_apis.dart';
import '../../api_model/customers/get_customer_info.dart';
import '../../api_model/customers/get_customers_api.dart';
import '../../getx controller/customer/flagscreencontroller.dart';
import '../../getx controller/summarycontroller.dart';
import '../../mainscreen_controller.dart';
import '../customer/customer_info.dart';
import '../customer/customer_screen.dart';

class all_screen_flagged extends StatefulWidget {
  all_screen_flagged({Key? key}) : super(key: key);

  @override
  State<all_screen_flagged> createState() => _all_screen_flaggedState();
}

class _all_screen_flaggedState extends State<all_screen_flagged> {
  flagcontroller flag_Conroller = Get.put(flagcontroller());

  final scrollcontroller = ScrollController();
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  @override
  void initState() {
    flag_Conroller.allcustomer.clear();
    flag_Conroller.allpage = 0;
    flag_Conroller.queryText = "";
    flag_Conroller.getflagdata3(flag_Conroller.queryText);
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      flag_Conroller.allpage += 10;
      print(flag_Conroller.allpage);
      flag_Conroller.getflagdata3(flag_Conroller.queryText);
    } else {
      print(flag_Conroller.allpage);
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<flagcontroller>(
      builder: (controller) {
        if (controller.allcustomer.isEmpty) {
          return circulerprogress();
        }

        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: ListView.separated(
            itemCount: flag_Conroller.allcustomer.length,
            controller: scrollcontroller,
            itemBuilder: (context, index) {
              Customer about = flag_Conroller.allcustomer[index];
              bool isflag = about.getIsFavourite;

              return InkWell(
                onTap: () {
                  Get.to(
                    customer_info(
                        about: about,
                       ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
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
                                              customer_profile(about: about),
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
                                      about.customerName2,
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
                                        '${about.customerName}',
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
                                        about.customerMobileNo,
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
                              data(about.companyId, about.userId,
                                  about.customerId, '0');
                              _summarycontroller.get_summarydetails();

                            } else {
                              const snackBar =
                                  SnackBar(content: Text('flag added!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              data(about.companyId, about.userId,
                                  about.customerId, '1');
                              _summarycontroller.get_summarydetails();
                            }
                            flag_Conroller.changeTypeFavourite(
                                index: index, value: isflag = !isflag,customertypeid: "0");
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
                                'Rs ${about.totalAmount} ${about.transactionType}',
                                maxLines: 3,
                                overflow: TextOverflow
                                    .ellipsis,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                    color: about.transactionType == "Adv" ? Colors.green : Colors.red,
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
                              'Rs ${about.totalAmount} ${about.transactionType}',
                              style: TextStyle(
                                  fontFamily:
                                  'SF Pro Display',
                                  color:about.transactionType == "Adv" ? Colors.green : Colors.red,
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
