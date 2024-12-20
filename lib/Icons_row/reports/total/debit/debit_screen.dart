import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports/total/debit/all_debit.dart';
import 'package:lezrapp/Icons_row/reports/total/debit/customer_debit.dart';
import 'package:lezrapp/Icons_row/reports/total/debit/suppiler_debit.dart';
import 'package:lezrapp/getx%20controller/totalcredit.dart';

import '../../../../api/const_apis.dart';
import '../../../../api/pdfprint.dart';
import '../../../../helper.dart';
import '../../../../model/invoice.dart';
import '../../../../model/supplier.dart';

class debit_screen extends StatefulWidget {
  const debit_screen({Key? key}) : super(key: key);

  @override
  State<debit_screen> createState() => _debit_screenState();
}

class _debit_screenState extends State<debit_screen>
    with SingleTickerProviderStateMixin {
  TextEditingController TFromDate = TextEditingController();
  TextEditingController TToDate = TextEditingController();
  // bool showfilter = false;
  int showfilter = 0;
  int index = 0;
  TabController? controller;
  Totaldebitallbhai total = Get.put(Totaldebitallbhai());
  Totaldebitcustomer customer = Get.put(Totaldebitcustomer());
  Totaldebitsupplier supplire = Get.put(Totaldebitsupplier());
  @override
  void initState() {
    total.customerdata();
    customer.customerdata();
    supplire.customerdata();
    controller = TabController(
      vsync: this,
      initialIndex: index,
      length: 3,
    );
    controller!.addListener(() {
      setState(() {
        index = controller!.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        // backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
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
                          'Total Debit'.tr,
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
                              if (index == 0) {
                                final invoice = Invoice2(
                                  supplier: Supplier2(
                                    name: saveuser()?.company.companyName,
                                    address: saveuser()?.company.companyAddress,
                                    type: "Customer Advances",
                                    paymentInfo:
                                        'https://paypal.me/sarahfieldzz',
                                  ),
                                  items: List.generate(
                                    total.credit.transactions.length,
                                    (index) => InvoiceItem2(
                                      srno_: "${index + 1}",
                                      Customername: total.credit
                                          .transactions[index].customerName,
                                      mobileno: total.credit.transactions[index]
                                          .customerMobileNo,
                                      address: total
                                          .credit.transactions[index].remark,
                                      type: total.credit.transactions[index]
                                          .transactionType,
                                      amount:
                                      getformettedamount(text: "${total.credit.transactions[index].amount}"),
                                    ),
                                  ).toList(),
                                );
                                final pdfFile =
                                    await PdfInvoice.generate(invoice);
                              } else if (index == 1) {
                                final invoice = Invoice2(
                                  supplier: Supplier2(
                                    name: saveuser()?.company.companyName,
                                    address: saveuser()?.company.companyAddress,
                                    type: "Customer Advances",
                                    paymentInfo:
                                        'https://paypal.me/sarahfieldzz',
                                  ),
                                  items: List.generate(
                                    customer.credit.transactions.length,
                                    (index) => InvoiceItem2(
                                      srno_: "${index + 1}",
                                      Customername: customer.credit
                                          .transactions[index].customerName,
                                      mobileno: customer.credit
                                          .transactions[index].customerMobileNo,
                                      address: customer
                                          .credit.transactions[index].remark,
                                      type: customer.credit.transactions[index]
                                          .transactionType,
                                      amount:
                                      getformettedamount(text: "${customer.credit.transactions[index].amount}"),
                                    ),
                                  ).toList(),
                                );
                                final pdfFile =
                                    await PdfInvoice.generate(invoice);
                              } else {
                                final invoice = Invoice2(
                                  supplier: Supplier2(
                                    name: saveuser()?.company.companyName,
                                    address: saveuser()?.company.companyAddress,
                                    type: "Customer Advances",
                                    paymentInfo:
                                        'https://paypal.me/sarahfieldzz',
                                  ),
                                  items: List.generate(
                                    supplire.credit.transactions.length,
                                    (index) => InvoiceItem2(
                                      srno_: "${index + 1}",
                                      Customername: supplire.credit
                                          .transactions[index].customerName,
                                      mobileno: supplire.credit
                                          .transactions[index].customerMobileNo,
                                      address: supplire
                                          .credit.transactions[index].remark,
                                      type: supplire.credit.transactions[index]
                                          .transactionType,
                                      amount:
                                      getformettedamount(text: "${supplire.credit.transactions[index].amount}"),
                                    ),
                                  ).toList(),
                                );
                                final pdfFile =
                                    await PdfInvoice.generate(invoice);
                              }
                            },
                            icon: const Icon(
                              size: 30,
                              Icons.picture_as_pdf_rounded,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: TabBar(
                    // isScrollable: true,

                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    indicatorColor: Color(0xffF1BC5E),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    padding: EdgeInsets.zero,
                    tabs: [
                      Tab(
                        child: Text(
                          'ALL'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'CUSTOMER'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'SUPPLIER'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenheight(context, dividedby: 1),
                  child: TabBarView(
                    // physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      all_debit(),
                      customer_debit(),
                      supplier_debit()
                      // all_credit(),
                      // customer_credit(),
                      // suppiler_credit(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
