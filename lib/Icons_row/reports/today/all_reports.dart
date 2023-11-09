import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';

import '../../../Const.dart';
import '../../../api_model/todaystransaction.dart';
import '../../../getx controller/todaystransaction.dart';
import '../../../helper.dart';

class all_reports extends StatelessWidget {
  const all_reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GetBuilder<todaystraalldata>(
      builder: (controller) {
        return controller.show.isTrue
            ? ListView.separated(
          // controller: scrollcontroller,
          itemCount: controller.credit.transactions.length,
          itemBuilder: (context, index) {
            Transaction about = controller.credit.transactions[index];
            return Container(
              // decoration:BoxDecoration(
              //     border: Border(
              //         left: BorderSide(
              //             width: 10,
              //             color: about.getColor())),
              //     gradient: LinearGradient(
              //       begin: Alignment.bottomRight,
              //       end: Alignment.topLeft,
              //       transform:
              //       GradientRotation(30 * pi / 180),
              //       stops: [
              //         0.0,
              //         0.30,
              //         0.6,
              //         0.9,
              //       ],
              //       colors: [
              //         yellowcustomer,
              //         Colors.white,
              //         Colors.white,
              //         Colors.white,
              //       ],
              //     ))
              child: InkWell(
                onTap: () {
                  // Get.to(details(about: about));
                },
                child: Ink(
                  color: Colors.white,
                  // height: screenheight(context,dividedby: 11),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

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
                                about.customerName.toString(),
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
                                  about.transactionDateFormatted.toString(),
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
                            // (about.transactionComments.isNotEmpty)
                            //     ? Row(
                            //   children: [
                            //     Icon(
                            //       Icons
                            //           .mode_comment_outlined,
                            //       color:
                            //       Colors.grey.shade400,
                            //       size: 14,
                            //     ),
                            //     SizedBox(
                            //       width: 2,
                            //     ),
                            //     Container(
                            //       // width:
                            //       //     screenwidth(
                            //       //         context,
                            //       //         dividedby:
                            //       //             1.7),
                            //       child: Text(
                            //         overflow: TextOverflow
                            //             .ellipsis,
                            //         "${about.transactionComments.length} ${about.transactionComments.length == 1 ? "Comment" : "Comments"}",
                            //         style: TextStyle(
                            //             fontFamily:
                            //             'SF Pro Display',
                            //             fontSize: 12,
                            //             color: Colors
                            //                 .grey.shade500,
                            //             fontWeight:
                            //             FontWeight
                            //                 .w500),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       height: 5,
                            //     ),
                            //   ],
                            // )
                            //     : SizedBox(),
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
                                    about.companyName.toString(),
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
                      Container(
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
                                      'Due on'.tr +  about.dueDateFormatted.toString(),
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

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return div();
          },
        )
            : Center(
                child: CircularProgressIndicator(color: custom,),
              );
      },
    );
  }
}
