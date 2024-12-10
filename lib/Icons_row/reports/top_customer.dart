import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:http/http.dart' as http;
import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api/pdfprint.dart';
import '../../api_model/customeradvance.dart';
import '../../api_model/report/top_customers.dart';
import '../../helper.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';

class top_custimer extends StatefulWidget {
  top_custimer({Key? key}) : super(key: key);

  @override
  State<top_custimer> createState() => _top_custimerState();
}

class _top_custimerState extends State<top_custimer> {
  late TopCustomers details;
  bool show = false;
  customerdata(){
    top_customers("1").then((value){
      details = value;
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
                          'Top Customer'.tr,
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
                                type: "Customer Advances",
                                paymentInfo: 'https://paypal.me/sarahfieldzz',
                              ),
                              items: List.generate(
                                details.customers.length,
                                    (index) => InvoiceItem2(
                                  srno_: "${index + 1}",
                                  Customername:
                                  details.customers[index].customerName,
                                  mobileno:
                                  details.customers[index].customerMobileNo,
                                  address:
                                  details.customers[index].customerAddress,
                                  type:
                                  details.customers[index].transactionType,
                                  amount:
                                  getformettedamount(text: "${details.customers[index].amount}"),
                                ),
                              ).toList(),
                            );
                            await PdfInvoice.generate(invoice);
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
        body: show == true ?NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: ListView.builder(
            itemCount: details.customers.length,
            itemBuilder: (context, index) {
              int a = index+1;
              Top_Customer about = details.customers[index];
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
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('${a}.',style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 17)),
                              SizedBox(width: 15,),
                              Container(
                                width: screenwidth(context,dividedby: 2.3),
                                child: Text(
                                  about.customerName,
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
              getformettedamount(text: '${about.amount} ${about.transactionType}'),
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                color: about.transactionType == "Due"? Colors.red:Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                  div()
                ],
              );
            },),
        ): Center(
            child: CircularProgressIndicator(
                color: custom)
        ),
      ),
    );
  }
}
