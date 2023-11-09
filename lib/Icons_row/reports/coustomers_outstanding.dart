import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';

import '../../api/const_apis.dart';

import '../../api/pdf_api.dart';
import '../../api/pdf_invoice_api.dart';
import '../../api/pdfprint.dart';
import '../../api_model/customeroutstanding.dart';
import '../../helper.dart';
import '../../model/bank.dart';
import '../../model/customer.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';

class coustomers_outstanding extends StatefulWidget {
  coustomers_outstanding({Key? key}) : super(key: key);

  @override
  State<coustomers_outstanding> createState() => _coustomers_outstandingState();
}

class _coustomers_outstandingState extends State<coustomers_outstanding> {
  late Customeroutstanding custmer;
  bool show = false;

  customerdata() {
    customeroutstanding("1").then((value) {
      custmer = value;
      setState(() {
        show = true;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
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
                          'Customers Outstanding'.tr,
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
                                name: saveuser()!.company.companyName,
                                address: saveuser()!.company.companyAddress,
                                type: "Customer Outstanding",
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
                                  amount: " Rs ${custmer.customers[index].amount}",
                                ),
                              ).sublist(0,custmer.customers.length>450?450:custmer.customers.length),
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
          child: show
              ? ListView.builder(
                  itemCount: custmer.customers.length,
                  itemBuilder: (context, index) {
                    return    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${index + 1}.',
                                      style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 17)),
                                  SizedBox(width: 15,),
                                  Container(
                                    width: screenwidth(context,dividedby: 2.5),
                                    child: Text(
                                      custmer
                                          .customers[index].customerName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Rs. ${custmer.customers[index].amount} ${custmer.customers[index].transactionType}',
                                style: TextStyle(
                                    fontFamily:
                                    'SF Pro Display',
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              )
                            ],
                          ),
                        ),
                        div()
                      ],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(color: custom,),
                ),
        ),
      ),
    );
  }
}
