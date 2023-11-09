import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';

import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api/pdfprint.dart';
import '../../api_model/customeradvance.dart';
import '../../helper.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';

class suppiler_advance extends StatefulWidget {
   suppiler_advance({Key? key}) : super(key: key);

  @override
  State<suppiler_advance> createState() => _suppiler_advanceState();
}

class _suppiler_advanceState extends State<suppiler_advance> {
  late Customeradvance custmer;
  bool show = false;

  customerdata(){
    customeradv("2").then((value){
      custmer = value;
      setState(() {
        show = true;
      });
    }).onError((error, stackTrace){print(error);});
  }
  @override
  void initState() {
    customerdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          flexibleSpace: Column(
            children: [
              Container(
                height: 60,
                color: const Color(0xff294472),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                         Text(
                          'Suppliers Advance'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              letterSpacing: 0.2,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {             final invoice = Invoice2(
                            supplier: Supplier2(
                              name: saveuser()?.company.companyName,
                              address: saveuser()?.company.companyAddress,
                              type: "Supplire Advances",
                              paymentInfo: 'https://paypal.me/sarahfieldzz',
                            ),
                            items: List.generate(
                              custmer.customers.length,
                                  (index) => InvoiceItem2(
                                srno_: "${index + 1}",
                                Customername:
                                custmer.customers[index].customerName,
                                mobileno:
                                custmer.customers[index].customerMobileNo,
                                address:
                                custmer.customers[index].customerAddress,
                                type:
                                custmer.customers[index].transactionType,
                                amount:
                                " Rs ${custmer.customers[index].amount}",
                              ),
                            ).sublist(0,custmer.customers.length>400?400:custmer.customers.length),
                          );
                          final pdfFile = await PdfInvoice.generate(invoice);},
                          icon: const Icon(
                            size: 30,
                            Icons.picture_as_pdf,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return false;
          },
          child:show == true ? ListView.builder(
            itemCount:custmer.customers.length,
            itemBuilder: (context, index) {
              Customer  customer = custmer.customers[index];
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 05, 15 ),
                          child: Container(
                            width: 30,
                            child: Text('${index+1}.',style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 17)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                          child: Column(
                            children: [
                              Container(
                                width: screenwidth(context,dividedby: 1.3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      customer.customerName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 17),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rs. ${customer.amount} ${customer.transactionType}',
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  div()
                ],
              );
            },) : Center(child: CircularProgressIndicator(color: custom)),),
        ),
      );
  }
}

