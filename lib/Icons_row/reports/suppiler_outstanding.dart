import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';

import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api/pdfprint.dart';
import '../../api_model/customeroutstanding.dart';
import '../../helper.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';

class suppiler_outstanding extends StatefulWidget {
  suppiler_outstanding({Key? key}) : super(key: key);

  @override
  State<suppiler_outstanding> createState() => _suppiler_outstandingState();
}

class _suppiler_outstandingState extends State<suppiler_outstanding> {

  late Customeroutstanding supplire;
  bool show = false;

  customerdata(){
    customeroutstanding("2").then((value){
      supplire = value;
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
    return  SafeArea(
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
                          'Suppliers Outstanding'.tr,
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
                          onPressed: () async {
                            final invoice = Invoice2(
                              supplier: Supplier2(
                                name: saveuser()?.company.companyName,
                                address: saveuser()?.company.companyAddress,
                                type: "Supplire Outstanding",
                                paymentInfo: 'https://paypal.me/sarahfieldzz',
                              ),
                              items: List.generate(
                                supplire.customers.length,
                                    (index) => InvoiceItem2(
                                  srno_: "${index + 1}",
                                  Customername:
                                  supplire.customers[index].customerName,
                                  mobileno:
                                  supplire.customers[index].customerMobileNo,
                                  address:
                                  supplire.customers[index].customerAddress,
                                  type:
                                  supplire.customers[index].transactionType,
                                  amount: getformettedamount(text: "${supplire.customers[index].amount}"),
                                ),
                              ).toList(),
                            );

                            final pdfFile = await PdfInvoice.generate(invoice);
                          },
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
            notification.disallowIndicator();
            return false;
          },
          child: show ? ListView.builder(
            itemCount: supplire.customers.length,
            itemBuilder: (context, index) {
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
                            child: Text('${index + 1}.',style: GoogleFonts.notoSans(
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
                                    Container(
                                      width: screenwidth(context,dividedby: 2.3),
                                      child: Text(
                                        supplire.customers[index].customerName,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
              getformettedamount(text: '${supplire.customers[index].amount} ${supplire.customers[index].transactionType}'),
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: Colors.red,
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
            },):Center(child: CircularProgressIndicator(color: custom,),),
        ),
      ),
    );
  }
}
