import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:lezrapp/helper.dart';

import '../../../../Const.dart';
import '../../../../api_model/totalcreditreport.dart';
import '../../../../getx controller/totalcredit.dart';

class supplier_debit extends StatefulWidget {
  supplier_debit({Key? key}) : super(key: key);

  @override
  State<supplier_debit> createState() => _supplier_debitState();
}

class _supplier_debitState extends State<supplier_debit> {
  Totaldebitsupplier total = Get.put(Totaldebitsupplier());

  @override
  void initState() {
    // total.customerdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return false;
        },
        child:GetBuilder<Totaldebitsupplier>(builder: (total) =>  total.show ==true ? ListView.builder(
          itemCount: total.credit.transactions.length,
          itemBuilder: (context, index) {
            Transaction cre = total.credit.transactions[index];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(color: Colors.grey, blurRadius: 3),
                    // ],
                    // borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenwidth(context,dividedby: 1.7),
                                  child: Text(
                                    cre.customerName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 16,
                                        color: Colors.grey.shade400,
                                      ),
                                      Text(
                                        cre.dueDateFormatted,
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Rs. ${cre.amount} ${cre.transactionType}',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                div()
              ],
            );
          },):Center(child: CircularProgressIndicator(color: custom)),),)
      );
  }
}
