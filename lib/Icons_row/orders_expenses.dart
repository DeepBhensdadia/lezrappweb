import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:lezrapp/api_model/expense/get_expense_api.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/pdf/orderexpensepdf.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../Const.dart';
import '../Dashboard/addexpense.dart';
import '../api/pdfprint.dart';
import '../getx controller/order_expense/orderexpensecontroller.dart';
import '../getx controller/summarycontroller.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';
import '../mybusiness_screens/customer/customer_info.dart';
import '../screens/bottomsheet.dart';
import 'bill.dart';
import 'package:http/http.dart' as http;

class orders_expenses extends StatefulWidget {
  orders_expenses({Key? key}) : super(key: key);

  @override
  State<orders_expenses> createState() => _orders_expensesState();
}

class _orders_expensesState extends State<orders_expenses> {
  Orderexpensecontroller orderConroller = Get.put(Orderexpensecontroller());
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  final scrollcontroller = ScrollController();

  @override
  void initState() {
    orderConroller.getexpense();
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        orderConroller.allpage += 10;
      });
      print(orderConroller.allpage);
      orderConroller.getexpense();
    } else {
      print(orderConroller.allpage);
    }
  }
TextEditingController cpcha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              )),
          title: Text(
            'Orders and Expenses'.tr,
            style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final invoice = orderexpenseInvoice(
                  supplier: Supplier2(
                    name: saveuser()!.company.companyName,
                    address: saveuser()!.company.companyAddress,
                    type: " Expense Report",
                    paymentInfo: 'https://paypal.me/sarahfieldzz',
                  ),
                  items: List.generate(
                    orderConroller.allexpense.length,
                    (index) => orderexpenseInvoiceItem(
                      srno_: "${index + 1}",
                      Date: orderConroller.allexpense[index].dateFormatted,
                      User: orderConroller.allexpense[index].userName == ""
                          ? saveuser()!.company.companyName
                          : orderConroller.allexpense[index].userName,
                      remark: orderConroller.allexpense[index].remark,
                      type: orderConroller.allexpense[index].expenseTitle,
                      amount: orderConroller.allexpense[index].amount,
                    ),
                  ),
                );
                final pdfFile = await orderexpensepdfprint.ordergenerat(
                  invoice,
                );
              },
              icon: const Icon(
                size: 30,
                Icons.download,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Obx(() => orderConroller.allexpense.isNotEmpty
            ? ListView.separated(
                controller: scrollcontroller,
                itemCount: orderConroller.allexpense.length,
                itemBuilder: (context, index) {
                  Expense_all about = orderConroller.allexpense[index];
                  return index + 1 == orderConroller.allexpense.length
                      ? orderConroller.isAllDataLoaded.isTrue
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: custom,
                              )),
                            )
                          : SizedBox()
                      : Visibility(
                          visible: _summarycontroller.staff.isTrue
                              ? orderConroller
                                          .allexpense[index].companyUserId ==
                                      saveuser()?.user.companyUserId
                                  ? true
                                  : false
                              : true,
                          child: Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 0.4,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  autoClose: true,
                                  onPressed: (context) {
                                    Get.to(
                                      AddExpense( about: about),
                                    );
                                  },
                                  backgroundColor: const Color(0xFF2C4475),
                                  foregroundColor: Colors.white,
                                  // icon: Icons.archive,
                                  label: 'Edit'.tr,
                                ),
                                SlidableAction(
                                  autoClose: true,
                                  onPressed: (context) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        cpcha.clear();
                                        String cach = generateCaptchaCode(4);
                                        return s_code(
                                          capchacode: cach,
                                          controll: cpcha,
                                          onconfirm:
                                              () async {

                                            if (cach ==
                                                cpcha
                                                    .text) {
                                              context.loaderOverlay.show();
                                              delete_expenxe(about.expenseId)
                                                  .then((value) {
                                                orderConroller.getexpense2();
                                                // Fluttertoast.showToast(
                                                //     msg: value.message ?? "");
                                                context.loaderOverlay.hide();

                                              }).onError((error, stackTrace) {
                                                context.loaderOverlay.hide();
                                                log(error.toString());
                                              });

                                            } else {
                                              Fluttertoast
                                                  .showToast(
                                                  msg:
                                                  "Security code doesn't match!!");
                                            }
                                          },
                                        );
                                      },
                                    );
                                    // alertbox(
                                    //   context: context,
                                    //   titletext: "Remove Expense",
                                    //   contain:
                                    //       'Would you like to remove expense?',
                                    //   confirmbutton: "Remove",
                                    //   ontap: () {
                                    //
                                    //   },
                                    // );
                                  },
                                  backgroundColor: const Color(0xFFEB4359),
                                  foregroundColor: Colors.white,
                                  // icon: Icons.save,
                                  label: 'Delete'.tr,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(bill(
                                  about: about,
                                ));
                              },
                              child: Column(
                                children: [
                                  Ink(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: screenwidth(context,
                                                dividedby: 2),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0),
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    about.expenseTitle,
                                                    // maxLines: 3,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            Color(0xFF2C4475),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_month,
                                                      size: 16,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                    Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      about.dateFormatted,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors
                                                              .grey.shade500),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      size: 16,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 2.0),
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        about.companyName,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.attachment_outlined,
                                                      color:
                                                          Colors.grey.shade400,
                                                      size: 16,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 2.0),
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        about.remark,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                              about.images.isNotEmpty ?  Icon(Icons.attachment,color: Colors.grey,size: 20,):SizedBox(),
                                                SizedBox(width: 3,),
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Rs.${about.amount}',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          replacement: InkWell(
                            onTap: () {
                              Get.to(bill(about: about,
                                 ));
                            },
                            child: Column(
                              children: [
                                Ink(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // color: custom,
                                          width: screenwidth(context,
                                              dividedby: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  about.expenseTitle,
                                                  // maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      color: Color(0xFF2C4475),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month,
                                                    size: 16,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                  Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    about.dateFormatted,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    size: 16,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      about.companyName,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors
                                                              .grey.shade500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.attachment_outlined,
                                                    color: Colors.grey.shade400,
                                                    size: 16,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      about.remark,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors
                                                              .grey.shade500),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              Row(
                                                children: [
                                                  about.images
                                                      .isNotEmpty
                                                      ? Icon(
                                                    Icons
                                                        .attachment,
                                                    color:
                                                    Colors.grey,
                                                    size: 20,
                                                  )
                                                      : SizedBox(),
                                                  Text(
                                                    overflow: TextOverflow.ellipsis,
                                                    'Rs.${about.amount}',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return div();
                },
              )
            : circulerprogress()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffF1BC5E),
          onPressed: () {
            Get.to(AddExpense());
          },
          child: const Icon(Icons.add, color: Colors.black, size: 30),
        ),
        bottomNavigationBar: Container(
          height: 40,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: MaterialButton(
                  height: 40,

                  // borderRadius: BorderRadius.zero,
                  color: Color(0xff294472),
                  onPressed: () {
                    bottomsheetsort(
                      context,
                      () {
                        orderConroller.allexpense.clear();
                        orderConroller.sorty_order = "date_asc";
                        orderConroller.getexpense();
                        Get.back();
                      },
                      () {
                        orderConroller.allexpense.clear();
                        orderConroller.sorty_order = "high_to_low";
                        orderConroller.getexpense();
                        Get.back();
                      },
                      () {
                        orderConroller.allexpense.clear();
                        orderConroller.sorty_order = "low_to_high";
                        orderConroller.getexpense();
                        Get.back();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sort, size: 25, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Sort'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                // height: 50,
                width: 2,
                color: Colors.white,
              ),
              Expanded(
                child: MaterialButton(
                  height: 40,
                  // borderRadius: BorderRadius.zero,
                  color: Color(0xff294472),
                  onPressed: () {
                    bottomsheetfilter(
                      context,
                      () {
                        Get.back();
                        datedialogbox(
                            context,
                            (value) {
                              orderConroller.from_date = value;
                            },
                            (val) => orderConroller.to_date = val,
                            () {
                              orderConroller.allexpense.clear();
                              orderConroller.getexpense();
                              Get.back();
                            });
                      },
                      () {
                        Get.back();
                      },
                    );
                    // setState(() {
                    //   showfilter++;
                    // });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_list_alt,
                          size: 25, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Filter'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
