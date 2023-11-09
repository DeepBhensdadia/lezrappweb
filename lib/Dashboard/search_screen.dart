import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';
import 'package:http/http.dart' as http;
import '../Icons_row/reports_screen.dart';
import '../api/const_apis.dart';
import '../api_model/customers/get_customer_info.dart';
import '../api_model/customers/get_customers_api.dart';
import '../getx controller/customer/getcustomersdatamybussiness.dart';
import '../getx controller/summarycontroller.dart';
import '../helper.dart';
import '../mybusiness_screens/customer/customer_info.dart';
import '../mybusiness_screens/customer/customer_screen.dart';

class search_screen extends StatefulWidget {
  const search_screen({Key? key}) : super(key: key);

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  final scrollcontroller = ScrollController();
  // List post = [];
  // int page = 0;
  // bool show = false;
  // bool call = true;
  // String serchtext = "";
  // getpages() async {
  //   await get_allcustomer("", serchtext, page.toString()).then((value) {
  //     post.clear();
  //     post.addAll(value.customers);
  //     setState(() {
  //       call = value.success;
  //       show = true;
  //     });
  //
  //     print(jsonEncode(value));
  //   }).onError((error, stackTrace) {
  //     print("error --> $error");
  //   });
  // }
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  getcutomerdataall getall = Get.put(getcutomerdataall());
  bhai(String c_id, String u_id, String cu_id, String yes) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Cookie': 'ci_session=8s2snk8594fdlgn7dpnvlahs1lnv7m9t'
    };
    var request = http.Request('POST',
        Uri.parse('$customerurl/markFlagged?auth=${saveuser()!.company.auth}'));
    request.bodyFields = {
      'company_id': c_id,
      'user_id': u_id,
      'customer_id': cu_id,
      'is_favorite': yes,
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
  }

  @override
  void initState() {
    // TODO: implement initState
    getall.serchtextcustomall = "";
    getall.getpagesall();
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        getall.pageall += 15;
      });
      print(getall.pageall);
      getall.getpagesall();
    } else {
      print(getall.pageall);
    }
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )),
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                  controller: controller,
                  onChanged: (value) {
                    setState(() {
                      log(getall.postall.toString());
                      getall.pageall = 0;
                      getall.serchtextcustomall = value;
                    });
                    getall.getpagesall();
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      filled: true,
                      hintStyle: GoogleFonts.notoSans(
                        color: Colors.black,
                      ),
                      suffixIcon: controller.text.isEmpty
                          ? SizedBox()
                          : IconButton(
                              onPressed: () {
                                controller.clear();
                                setState(() {
                                  log(getall.postall.toString());
                                  getall.pageall = 0;
                                  getall.serchtextcustomall = "";
                                });
                                getall.getpagesall();
                              },
                              icon: Icon(Icons.clear,color: custom,)),
                      // prefixIcon: Icon(Icons.search),
                      fillColor: Colors.grey.shade300,
                      // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      border: InputBorder.none,
                      hintText: 'Search'.tr),
                ),
              ),
            ],
          ),
        ),
        body: GetBuilder<getcutomerdataall>(
          builder: (controller) {
            return controller.postall.isNotEmpty
                ? NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification) {
                      notification.disallowIndicator();
                      return false;
                    },
                    child: ListView.separated(
                      controller: scrollcontroller,
                      itemCount: controller.postall.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Customer about = controller.postall[index];
                        bool isflag = about.getIsFavourite;
                        return index + 1 == controller.postall.length &&
                                controller.isdataloading.isTrue
                            ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: custom,
                                )),
                              )
                            : InkWell(
                                onTap: () {
                                  Get.to(
                                    customer_info(
                                      about: about,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
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
                                                              customer_profile(
                                                                  about: about),
                                                            ],
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xffF1BC5E),
                                                  child: Center(
                                                    child: Text(
                                                      about.customerName2,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 22,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: screenwidth(context,
                                                dividedby: 1.9),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    '${about.customerName}',
                                                    // maxLines: 3,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    about.customerMobileNo,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          if (isflag) {
                                            const snackBar = SnackBar(
                                                content: Text('flag remove!'));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            bhai(about.companyId, about.userId,
                                                about.customerId, '0');
                                            _summarycontroller
                                                .get_summarydetails();
                                          } else {
                                            const snackBar = SnackBar(
                                                content: Text('flag added!'));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            bhai(about.companyId, about.userId,
                                                about.customerId, '1');
                                            _summarycontroller
                                                .get_summarydetails();
                                          }
                                          controller.changeTypeFavourite(
                                              index: index,
                                              value: isflag = !isflag);
                                        },
                                        child: isflag
                                            ? Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Rs ${about.totalAmount} ${about.transactionType}',
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color:
                                                              about.transactionType ==
                                                                      "Adv"
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          border: Border.all(
                                                              color: about.customerTypeId ==
                                                                      "1"
                                                                  ? yellowcustomer
                                                                  : custom,
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
                                                                color: about.customerTypeId ==
                                                                        "1"
                                                                    ? yellowcustomer
                                                                    : custom,
                                                                size: 18),
                                                            Text(
                                                              about.customerTypeId ==
                                                                      "1"
                                                                  ? "Customer"
                                                                  : "Supplire",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                              ),
                                                            )
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
                                                        color:
                                                            about.transactionType ==
                                                                    "Adv"
                                                                ? Colors.green
                                                                : Colors.red,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            Icons.flag_outlined,
                                                            color:
                                                                Colors.black45,
                                                            size: 18),
                                                        Text(
                                                          about.customerTypeId ==
                                                                  "1"
                                                              ? "Customer"
                                                              : "Supplier",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                      separatorBuilder: (context, index) {
                        return div();
                      },
                    ),
                  )
                : circulerprogress();
          },
        ));
  }
}
