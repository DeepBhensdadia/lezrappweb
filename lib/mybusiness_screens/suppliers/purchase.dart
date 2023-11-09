import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/api_model/salseandpurchasemodel.dart';

import '../../Const.dart';
import '../../getx controller/summarycontroller.dart';
import '../../helper.dart';

class purchase extends StatefulWidget {
  final Slaseandpurchasemodelclass salsepuchase;
  const purchase( this.salsepuchase, {Key? key}) : super(key: key);

  @override
  State<purchase> createState() => _purchaseState();
}

class _purchaseState extends State<purchase> {
  @override
  Widget build(BuildContext context) {
    Summarycontroller _summarycontroller = Get.put(Summarycontroller());

    return _summarycontroller.change.isTrue ? Center(child: CircularProgressIndicator(color: custom,),) : ListView.builder(
      itemCount: widget.salsepuchase.summery.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            margin: EdgeInsets.zero,
            child: Container(
              // height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Purchase'.tr,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff294472)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Payment'.tr,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff294472)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Payable'.tr,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff294472)),
                              ),
                            ],
                          ),
                          Container(
                            width: screenwidth(context,dividedby: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Rs ${widget.salsepuchase.summery[index].purchase.toStringAsFixed(0)}',
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
                                      'Rs ${widget.salsepuchase.summery[index].purchasePayment.toStringAsFixed(0)}',
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
                                      'Rs ${widget.salsepuchase.summery[index].payable.toStringAsFixed(0)}',
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
