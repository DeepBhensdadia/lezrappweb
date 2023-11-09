import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lezrapp/Dashboard/addtransaction.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/api_model/transaction/get_transaction.dart';
import 'package:lezrapp/screens/Transactions/details.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';
import '../../Const.dart';
import '../../api/const_apis.dart';

import '../../getx controller/summarycontroller.dart';
import '../../getx controller/transactioncontrollers/transactioncontroller.dart';
import '../../helper.dart';
import '../../mybusiness_screens/customer/customer_info.dart';

class Customer_tab extends StatefulWidget {
  const Customer_tab({Key? key}) : super(key: key);

  @override
  State<Customer_tab> createState() => _Customer_tabState();
}

class _Customer_tabState extends State<Customer_tab> {
  TransactionConroller transactionConroller = Get.put(TransactionConroller());
  final scrollcontroller = ScrollController();
  // List<Transaction> data = [];
  // int page = 0 ;
  // bool show = false;
  // bool call = true;
  //
  // getpages() async {
  //   await get_transaction(
  //       "1"
  //       // , page.toString()
  //   ).then((value) {
  //
  //     data =data+ value.transactions;
  //     setState(() {
  //       call = value.success;
  //       show = true;
  //     });
  //
  //     print(jsonEncode(value));
  //   }).onError((error, stackTrace) {
  //     print("error --> $error");
  //
  //   });
  // }

  @override
  void initState() {

    transactionConroller.sorty_order = "";
    transactionConroller.customerpage = 0;
    transactionConroller.customertransaction.clear();
    transactionConroller.getpages("1");
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        transactionConroller.customerpage += 10;
      });
      print(transactionConroller.customerpage);

      transactionConroller.getpages("1");
    } else {
      print(transactionConroller.customerpage);
    }
  }

TextEditingController cpcha = TextEditingController();
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  @override
  Widget build(BuildContext context) {
   String cach = generateCaptchaCode(4);
    return Obx(() => transactionConroller.customertransaction.isEmpty
        ? circulerprogress()
        : ListView.separated(
      controller: scrollcontroller,
      itemCount: transactionConroller.customertransaction.length,
      itemBuilder: (context, index) {
        Transaction about = transactionConroller.customertransaction[index];
        return index + 1 == transactionConroller.customertransaction.length
            ? transactionConroller.isloadingdata.isTrue
            ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: CircularProgressIndicator(
                color: custom,
              )),
        )
            : SizedBox()
            : Slidable(
          closeOnScroll: true,
          enabled:about.isDelete ==
              0 ?true : false ,
          endActionPane: ActionPane(
            // extentRatio: 0.5,
            motion: const ScrollMotion(),
            children: [
              Visibility(
                visible:
               about.isDelete ==
                    0
                    ? _summarycontroller.staff.isTrue
                    ? about
                    .companyUserId
                    .toString() ==
                    saveuser()?.user.companyUserId
                        .toString()
                    ? true
                    : false
                    : true
                    : false,
                child: SlidableAction(
                  autoClose: true,
                  onPressed: (context) {
                    Get.to(
                      AddTransaction( task: about),
                    );
                  },
                  backgroundColor: const Color(0xFF2C4475),
                  foregroundColor: Colors.white,
                  // icon: Icons.archive,
                  label: 'Edit'.tr,
                ),
              ),
              Visibility(
                visible:
                about.isDelete ==
                    0
                    ? _summarycontroller.staff.isTrue
                    ? about
                    .companyUserId
                    .toString() ==
                    saveuser()?.user.companyUserId
                        .toString()
                    ? true
                    : false
                    : true
                    : false,
                child: SlidableAction(

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
                          onconfirm: () async {
                            if (cach == cpcha.text) {
                              Get.context!.loaderOverlay.show();
                              Get.back();

                              await delete_transaction(
                                  transactionid:
                                  about.transactionId)
                                  .then((value) {
                                transactionConroller.customerpage =
                                0;
                                Fluttertoast.showToast(
                                    msg: value.message);
                                transactionConroller
                                    .getpages2("0");
                                Get.context!.loaderOverlay.hide();
                              }).onError((error, stackTrace) {
                                Get.context!.loaderOverlay.hide();
                               print(error);
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                  "Security code doesn't match!!");
                            }
                          },
                        );
                      },
                    );
                  },
                  backgroundColor: const Color(0xFFEB4359),
                  foregroundColor: Colors.white,
                  // icon: Icons.save,
                  label: 'Delete'.tr,
                ),
              ),
            ],
          ),
          child: Container(
            decoration: about.isDelete == 0
                ? about.transactionTracking.length == 2
                ? BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 10,
                        color: about.getColor())),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  transform:
                  GradientRotation(30 * pi / 180),
                  stops: [
                    0.0,
                    0.30,
                    0.6,
                    0.9,
                  ],
                  colors: [
                    yellowcustomer,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                ))
                : BoxDecoration(   border: Border(
                left: BorderSide(
                    width: 10,
                    color: about.getColor())))
                : BoxDecoration(   border: Border(
                left: BorderSide(
                    width: 10,
                    color: about.getColor())),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  transform: GradientRotation(30 * pi / 180),
                  stops: [
                    0.0,
                    0.30,
                    0.6,
                    0.9,
                  ],
                  colors: [
                    Colors.red,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                )),
            child: InkWell(
              onTap: () {
                Get.to(
                  details(about: about),
                );
              },
              child: Ink(
                color: Colors.white,
                // height: screenheight(context,dividedby: 11),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(

                        width:
                        screenwidth(context, dividedby: 1.7),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.0),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                about.customerName,
                                // maxLines: 3,
                                style: fontStyleHeading(),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 16,
                                  color: Colors.grey.shade400,
                                ),
                                Text(
                                  about.transactionDateFormatted,
                                  style: TextStyle(
                                      fontFamily:
                                      'SF Pro Display',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      Colors.grey.shade500),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            (about.transactionComments.isNotEmpty)
                                ? Row(
                              children: [
                                Image(  height: 15,
                                width: 15,image: AssetImage("assets/icon/Texting.gif")),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  // width:
                                  //     screenwidth(
                                  //         context,
                                  //         dividedby:
                                  //             1.7),
                                  child: Text(
                                    overflow: TextOverflow
                                        .ellipsis,
                                    "${about.transactionComments.length} ${about.transactionComments.length == 1 ? "Comment" : "Comments"}",
                                    style: TextStyle(
                                        fontFamily:
                                        'SF Pro Display',
                                        fontSize: 12,
                                        color: Colors
                                            .grey.shade500,
                                        fontWeight:
                                        FontWeight
                                            .w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            )
                                : SizedBox(),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 14,
                                  color: Colors.grey.shade400,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Text(
                                    about.getUsername(),
                                    style: TextStyle(
                                        overflow:
                                        TextOverflow.ellipsis,
                                        fontFamily:
                                        'SF Pro Display',
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.w500,
                                        color:
                                        Colors.grey.shade500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: 15,top: 5,bottom: 5),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                about.transactionImages.isNotEmpty
                                    ? Icon(
                                  Icons.attachment,
                                  color: Colors.grey,
                                  size: 20,
                                )
                                    : SizedBox(),
                                Text(
                                  about.getAmount(),
                                  style: TextStyle(
                                    overflow:
                                    TextOverflow.ellipsis,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: about.getAmountColor(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              'Balance:'.tr +
                                  " ₹${about.totalAmount}",
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                            Column(children: [ SizedBox(height: 5),
                              if (about.transactionType == "Due")
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse,
                                      size: 12,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      overflow: TextOverflow
                                          .ellipsis,
                                      'Due on'.tr +  about.dueDateFormatted,
                                      style: TextStyle(
                                        fontFamily:
                                        'SF Pro Display',
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )],),
                            Column(children: [
                              about.isDelete == 0 ? about.transactionTracking.length == 2 ?  Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Edited",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                              ):SizedBox() : Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Deleted",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                              )
                            ],),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Stack(
          //   children: [
          //
          //     about.isDelete != 0
          //         ? Positioned(
          //             left:
          //                 screenwidth(context, dividedby: 2),
          //             child: badges.Badge(
          //                 badgeContent: const Text('Deleted',
          //                     style: TextStyle(
          //                         fontSize: 12,
          //                         color: Colors.white,
          //                         fontWeight:
          //                             FontWeight.w600)),
          //                 badgeStyle: badges.BadgeStyle(
          //                   shape: badges.BadgeShape.square,
          //                   badgeColor: Colors.red,
          //                   padding:
          //                       const EdgeInsets.symmetric(
          //                           horizontal: 5,
          //                           vertical: 5),
          //                   borderRadius:
          //                       BorderRadius.circular(4),
          //                 )),
          //           )
          //         : about.transactionTracking.length == 2
          //             ? Positioned(
          //                 top: 10,
          //                 left: screenwidth(context,
          //                     dividedby: 1.8),
          //                 child: badges.Badge(
          //                     badgeContent: const Text(
          //                         'Edited',
          //                         style: TextStyle(
          //                             fontSize: 12,
          //                             color: Colors.white,
          //                             fontWeight:
          //                                 FontWeight.w600)),
          //                     badgeStyle: badges.BadgeStyle(
          //                       shape:
          //                           badges.BadgeShape.square,
          //                       badgeColor: yellowcustomer,
          //                       padding: const EdgeInsets
          //                               .symmetric(
          //                           horizontal: 5,
          //                           vertical: 5),
          //                       borderRadius:
          //                           BorderRadius.circular(4),
          //                     )),
          //               )
          //             : SizedBox()
          //   ],
          // ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return div();
      },
    ));
  }
}
