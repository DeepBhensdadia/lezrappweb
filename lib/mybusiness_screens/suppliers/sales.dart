import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/api_model/salseandpurchasemodel.dart';
import 'package:lezrapp/helper.dart';

import '../../Const.dart';
import '../../getx controller/summarycontroller.dart';

class salse extends StatefulWidget {
  final Slaseandpurchasemodelclass salsepuchase;
  const salse( this.salsepuchase, {Key? key}) : super(key: key);

  @override
  State<salse> createState() => _salseState();
}

class _salseState extends State<salse> {
  @override
  Widget build(BuildContext context) {
    Summarycontroller _summarycontroller = Get.put(Summarycontroller());

    return  _summarycontroller.change.isTrue ? Center(child: CircularProgressIndicator(color: custom,),) :  ListView.builder(
      itemCount: widget.salsepuchase.summery.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            margin: EdgeInsets.zero,
            child: Container(
              // height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.salsepuchase.summery[index].transactionDate,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Sales'.tr,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color(0xff294472)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Payment'.tr,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color(0xff294472)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Receivable'.tr,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color(0xff294472)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            // color: Colors.black54,
                            width: screenwidth(context,dividedby: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Rs ${widget.salsepuchase.summery[index].sales.toStringAsFixed(0)}',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rs ${widget.salsepuchase.summery[index].salesPayment.toStringAsFixed(0)}',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rs ${widget.salsepuchase.summery[index].receivable.toStringAsFixed(0)}',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
