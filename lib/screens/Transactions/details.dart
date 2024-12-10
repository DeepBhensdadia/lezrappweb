import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:lezrapp/api_model/transaction/get_transaction.dart';
import 'package:lezrapp/getx%20controller/summarycontroller.dart';
import 'package:lezrapp/helper.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import '../../Const.dart';
import '../../Dashboard/addtransaction.dart';
import '../../Icons_row/photo.dart';
import '../../Icons_row/reports_screen.dart';
import '../../api_model/transaction/transaction_detail_api.dart';
import '../../getx controller/transactioncontrollers/trasactiondetailcontroller.dart';
import 'package:share_plus/share_plus.dart';

class details extends StatefulWidget {
  const details({
    Key? key,
    required this.about,
  }) : super(key: key);

  final Transaction about;

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  final List<String> imagePaths = [];

  void shareContent() async {
    final String text =
        "${controller.trandetail.transaction.customerName}'s Ledger \n ${controller.trandetail.transaction.dueDateFormatted}:Rs${controller.trandetail.transaction.amount} ${controller.trandetail.transaction.transactionType} \n Remark: ${controller.trandetail.transaction.remark}\n\n Total Blance: ${controller.trandetail.transaction.amount} ${controller.trandetail.transaction.transactionType}";
    for (int i = 0;
        i < controller.trandetail.transaction.transactionImages.length;
        i++) {
      await _shareImage(
          controller.trandetail.transaction.transactionImages[i].imageFileName,
          i);
      // imagePaths.add(imagePath);
    }
    await Share.shareFiles(imagePaths, text: text);
    imagePaths.clear();
  }

  Future<dynamic> _shareImage(url, i) async {
    context.loaderOverlay.show();

    String imageUrl = url;

    http.Response response = await http.get(Uri.parse(imageUrl));
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/image$i.jpg');
    await tempFile.writeAsBytes(response.bodyBytes);
    context.loaderOverlay.hide();
    // Share the image
    imagePaths.add(tempFile.path);
    // await Share.shareFiles([tempFile.path]);
  }

  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  transactioncommetcontroller controller =
      Get.put(transactioncommetcontroller());
  @override
  void initState() {
    controller.getdetails(widget.about.transactionId);
    // TODO: implement initState
    super.initState();
  }

  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEEEEEE),
          appBar: AppBar(
            backgroundColor: Color(0xff294472),
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
              'Details'.tr,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              widget.about.isDelete == 0
                  ? IconButton(
                      onPressed: () {
                        shareContent();
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(),
              widget.about.isDelete == 0
                  ? IconButton(
                      onPressed: () {
                        Get.to(
                          AddTransaction(task: widget.about),
                        );
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          body: GetBuilder<transactioncommetcontroller>(
            builder: (controller) => controller.show == true
                ? NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification) {
                      notification.disallowIndicator();
                      return false;
                    },
                    child: controller.circuler.isTrue
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: custom,
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    child: Text(
                                                      controller
                                                          .trandetail
                                                          .transaction
                                                          .customerName2,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 19,
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor:
                                                        yellowcustomer,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: screenwidth(
                                                            context,
                                                            dividedby: 1.5),
                                                        child: Text(
                                                          controller
                                                              .trandetail
                                                              .transaction
                                                              .customerName,
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: screenwidth(
                                                            context,
                                                            dividedby: 1.5),
                                                        child: Text(
                                                          '+91 ${controller.trandetail.transaction.customerMobileNo}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: Colors.grey
                                                                  .shade700,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey.shade400,
                                              thickness: 1,
                                              height: 5,
                                              indent: screenwidth(context,
                                                  dividedby: 6),
                                              endIndent: screenwidth(context,
                                                  dividedby: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_month_rounded,
                                                        color:
                                                            Color(0xffF1BC5C),
                                                        size: 40,
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: screenwidth(
                                                                context,
                                                                dividedby: 1.5),
                                                            child: Text(
                                                              controller
                                                                  .trandetail
                                                                  .transaction
                                                                  .transactionDateFormatted,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            width: screenwidth(
                                                                context,
                                                                dividedby: 1.5),
                                                            child: Text(
                                                              'Transaction date',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(
                                              color: Colors.grey.shade400,
                                              thickness: 1,
                                              height: 5,
                                              indent: screenwidth(context,
                                                  dividedby: 6),
                                              endIndent: screenwidth(context,
                                                  dividedby: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.shopping_bag,
                                                    color: Color(0xffF1BC5C),
                                                    size: 40,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      controller
                                                                  .trandetail
                                                                  .transactionTracking
                                                                  .length >=
                                                              2
                                                          ? Text(
                                                          getformettedamount(text: "${controller.trandetail.transactionTracking[1].amount}"),
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  decorationThickness:
                                                                      2,
                                                                  decorationColor:
                                                                      Colors
                                                                          .red,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14),
                                                            )
                                                          : SizedBox(),
                                                      Container(
                                                        // width: 210,
                                                        child: Text(
                                                          controller.trandetail
                                                              .transaction
                                                              .getamount(),
                                                          style: TextStyle(
                                                              color: controller
                                                                  .trandetail
                                                                  .transaction
                                                                  .gettypecolor(),
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      controller
                                                                  .trandetail
                                                                  .transactionTracking
                                                                  .length >=
                                                              2
                                                          ? Container(
                                                              child: Text(
                                                                'Edited By ${controller.trandetail.transactionTracking.first.userName == "false" ? "Admin" : controller.trandetail.transactionTracking.first.userName}',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )
                                                          : SizedBox(),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          controller
                                                                      .trandetail
                                                                      .transaction
                                                                      .transactionType ==
                                                                  "Due"
                                                              ? controller
                                                                      .trandetail
                                                                      .transactionTracking
                                                                      .isNotEmpty
                                                                  ? "amount debited on ${controller.trandetail.transactionTracking.first.dateAdded}"
                                                                  : "amount debited on ${controller.trandetail.transaction.transactionDateFormatted}"
                                                              : 'amount due on ${controller.trandetail.transaction.dueDateFormatted}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: Colors.grey
                                                                  .shade700,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Divider(
                                              color: Colors.grey.shade400,
                                              thickness: 1,
                                              height: 5,
                                              indent: screenwidth(context,
                                                  dividedby: 6),
                                              endIndent: screenwidth(context,
                                                  dividedby: 16),
                                            ),
                                          ],
                                        ),
                                        controller.trandetail.transaction
                                                    .transactionType ==
                                                "Due"
                                            ? Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.alarm,
                                                            color: Color(
                                                                0xffF1BC5C),
                                                            size: 40),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Due Date",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              controller
                                                                  .trandetail
                                                                  .transaction
                                                                  .transactionDateFormatted,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize: 14,
                                                                  color: controller
                                                                      .trandetail
                                                                      .transaction
                                                                      .gettypecolor(),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.grey.shade400,
                                                    thickness: 1,
                                                    height: 5,
                                                    indent: screenwidth(context,
                                                        dividedby: 6),
                                                    endIndent: screenwidth(
                                                        context,
                                                        dividedby: 16),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.chat_rounded,
                                                      color: Color(0xffF1BC5C),
                                                      size: 40),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  controller
                                                          .trandetail
                                                          .transaction
                                                          .remark
                                                          .isNotEmpty
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              width: 210,
                                                              child: Text(
                                                                controller
                                                                    .trandetail
                                                                    .transaction
                                                                    .remark,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Text(
                                                          "No Remark",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              thickness: 0.5,
                                            ),
                                          ],
                                        ),
                                        controller.trandetail.transaction
                                                .signatureFileName.isNotEmpty
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20,
                                                    horizontal: 30),
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                width: screenwidth(context,
                                                    dividedby: 1),
                                                height: screenheight(context,
                                                    dividedby: 6),
                                                child: Image.network(controller
                                                    .trandetail
                                                    .transaction
                                                    .signatureFileName))
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'No Signature',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        (controller.trandetail.transaction
                                                .transactionImages.isNotEmpty)
                                            ? GridView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                    .trandetail
                                                    .transaction
                                                    .transactionImages
                                                    .length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 2,
                                                        mainAxisSpacing: 2),
                                                itemBuilder: (context, index) {
                                                  TransactionImagedetai image =
                                                      controller
                                                              .trandetail
                                                              .transaction
                                                              .transactionImages[
                                                          index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                              photo(controller.trandetail.transaction.transactionImages,index),
                                                            );
                                                          },
                                                          child: Container(
                                                            height: 100,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: NetworkImage(
                                                                        image
                                                                            .imageFileName)),
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        3,
                                                                    color: Colors
                                                                        .grey,
                                                                  )
                                                                ]),
                                                            // child: Column(
                                                            //   children: [
                                                            //     ClipRRect(
                                                            //       borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //           8),
                                                            //       child: Image(
                                                            //         fit: BoxFit.cover,
                                                            //         // height: 100,
                                                            //         //   width: 100,
                                                            //           image: NetworkImage(
                                                            //               image
                                                            //                   .imageFileName)),
                                                            //     ),
                                                            //     SizedBox(
                                                            //       height: 5,
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                  // controller.circuler.isTrue
                                  //     ? Padding(
                                  //         padding: const EdgeInsets.all(15.0),
                                  //         child: CircularProgressIndicator(
                                  //           color: custom,
                                  //         ),
                                  //       )
                                  //     : SizedBox(),
                                  (controller.trandetail.transaction
                                              .transactionComments.length ==
                                          0)
                                      ? Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Comment'.tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color:
                                                              Color(0xff294472),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                  height: 20,
                                                  color: Colors.grey.shade400,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        comment.clear();
                                                        return addandeditcomment(
                                                          comment: comment,
                                                          onpressconfirm: () {
                                                            if (comment.text
                                                                .isNotEmpty) {
                                                              Get.back();
                                                              controller.addtransactioncomment(
                                                                  controller
                                                                      .trandetail
                                                                      .transaction
                                                                      .transactionId,
                                                                  comment.text);
                                                            } else {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg:
                                                                          "Comment text is not be empty");
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: screenwidth(context,
                                                        dividedby: 1),
                                                    color: Color(0xff294472),
                                                    height: screenheight(
                                                        context,
                                                        dividedby: 20),
                                                    child: Center(
                                                      child: Text(
                                                        'Add Comment'.tr,
                                                        style: GoogleFonts
                                                            .notoSans(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 9,
                                                      horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Comment'.tr,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color:
                                                              Color(0xff294472),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              comment.clear();
                                                              return addandeditcomment(
                                                                comment:
                                                                    comment,
                                                                onpressconfirm:
                                                                    () {
                                                                  if (comment
                                                                      .text
                                                                      .isNotEmpty) {
                                                                    Get.back();
                                                                    controller.addtransactioncomment(
                                                                        controller
                                                                            .trandetail
                                                                            .transaction
                                                                            .transactionId,
                                                                        comment
                                                                            .text);
                                                                  } else {
                                                                    Fluttertoast
                                                                        .showToast(
                                                                            msg:
                                                                                "Comment text is not be empty");
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.add_circle,
                                                          color:
                                                              Color(0xffF1BC5E),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey,
                                                    thickness: 0.5,
                                                  ),
                                                  ListView.separated(
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                        .trandetail
                                                        .transaction
                                                        .transactionComments
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      TransactionCommentdetai
                                                          comments = controller
                                                                  .trandetail
                                                                  .transaction
                                                                  .transactionComments[
                                                              index];
                                                      return Visibility(
                                                        visible: _summarycontroller
                                                                .staff.isTrue
                                                            ? controller
                                                                        .trandetail
                                                                        .transaction
                                                                        .transactionComments[
                                                                            index]
                                                                        .companyUserId
                                                                        .toString() ==
                                                                    saveuser()
                                                                        ?.user
                                                                        .companyUserId
                                                                        .toString()
                                                                ? true
                                                                : false
                                                            : true,
                                                        child: Slidable(
                                                          endActionPane:
                                                              ActionPane(
                                                            // extentRatio: 0.4,
                                                            motion:
                                                                const ScrollMotion(),
                                                            children: [
                                                              SlidableAction(
                                                                autoClose: true,
                                                                onPressed:
                                                                    (context) {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      comment.text = controller
                                                                          .trandetail
                                                                          .transaction
                                                                          .transactionComments[
                                                                              index]
                                                                          .commentDescription;
                                                                      return addandeditcomment(
                                                                        comment:
                                                                            comment,
                                                                        onpressconfirm:
                                                                            () {
                                                                          Get.back();
                                                                          controller.updatetransactioncomment(
                                                                              controller.trandetail.transaction.transactionId,
                                                                              controller.trandetail.transaction.transactionComments[index].transactionCommentId,
                                                                              comment.text);
                                                                        },
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFF2C4475),
                                                                foregroundColor:
                                                                    Colors
                                                                        .white,
                                                                // icon: Icons.archive,
                                                                label:
                                                                    'Edit'.tr,
                                                              ),
                                                              SlidableAction(
                                                                autoClose: true,
                                                                onPressed:
                                                                    (context) {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (context) =>
                                                                        AlertDialog(
                                                                            title:
                                                                                Text(
                                                                              "Are You Sure?".tr,
                                                                              style: TextStyle(fontSize: 18),
                                                                            ),
                                                                            actions: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  "No",
                                                                                  style: GoogleFonts.notoSans(color: Color(0xff294472), fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  Get.back();
                                                                                  controller.deletetransactioncomment(controller.trandetail.transaction.transactionId, controller.trandetail.transaction.transactionComments[index].transactionCommentId);
                                                                                },
                                                                                child: Text(
                                                                                  "Delete".tr,
                                                                                  style: GoogleFonts.notoSans(color: Color(0xff294472), fontWeight: FontWeight.w500, fontSize: 16),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ]),
                                                                  );
                                                                },
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFFEB4359),
                                                                foregroundColor:
                                                                    Colors
                                                                        .white,
                                                                // icon: Icons.save,
                                                                label:
                                                                    'Delete'.tr,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(13.0),
                                                                          child:
                                                                              Image.asset(height: 30,width: 30,"assets/icon/Texting.gif"),
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  "Admin: ${comments.userName}",
                                                                                  style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff294472)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                                                  child: Text(
                                                                                    comments.commentDescription,
                                                                                    style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  comments.dateAdded,
                                                                                  style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    // SizedBox(
                                                                    //   heigh
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        replacement: Column(
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(13.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .message,
                                                                          color:
                                                                              Color(0xffF1BC5E),
                                                                          size:
                                                                              30,
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Admin: ${comments.userName}",
                                                                                style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff294472)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                3,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                                                child: Text(
                                                                                  comments.commentDescription,
                                                                                  style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                3,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                comments.dateAdded,
                                                                                style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // SizedBox(
                                                                  //   heigh
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Divider(
                                                        height: 15,
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF2C4475),
                    ),
                  ),
          )
          // FutureBuilder(
          //   future: get_transaction_detail(),
          //   builder: (context, AsyncSnapshot<dynamic> snapshot) {
          //     print(snapshot.stackTrace);
          //     print(snapshot.hasError);
          //     if (snapshot.hasData) {
          //       GetTransactionDetail? detail = snapshot.data;
          //
          //       return ;
          //     }
          //     return Center(
          //         child: Column(
          //       children: [
          //
          //         CircularProgressIndicator(
          //           color: Color(0xFF2C4475),
          //         ),
          //       ],
          //     ));
          //   },
          // ),
          ),
    );
  }
}

class addandeditcomment extends StatelessWidget {
  final TextEditingController comment;
  final void Function() onpressconfirm;
  const addandeditcomment(
      {Key? key, required this.comment, required this.onpressconfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text(
            "Add Comment".tr,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      content: TextField(
        cursorColor: Colors.black,
        style: GoogleFonts.notoSans(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintText: "Write comment here...".tr,
        ),
        controller: comment,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CANCEL".tr,
                  style: GoogleFonts.notoSans(
                      color: Color(0xff294472),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              TextButton(
                onPressed: onpressconfirm,
                child: Text(
                  "SAVE".tr,
                  style: GoogleFonts.notoSans(
                      color: Color(0xff294472),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
