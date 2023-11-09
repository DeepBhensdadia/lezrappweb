import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/Dashboard/addtransaction.dart';
import 'package:lezrapp/api/pdfprint.dart';
import 'package:lezrapp/model/invoice.dart';
import 'package:lezrapp/screens/Transactions/supplire.dart';
import 'package:lezrapp/helper.dart';
import '../../api/const_apis.dart';
import '../../getx controller/transactioncontrollers/transactioncontroller.dart';
import '../../model/supplier.dart';
import '../../pdf/transactionpdfprint.dart';
import '../bottomsheet.dart';
import 'AllTab1.dart';
import 'customer_Tab.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  TransactionConroller transactionConroller = Get.put(TransactionConroller());

  TextEditingController TFromDate = TextEditingController();
  TextEditingController TToDate = TextEditingController();
  // bool showfilter = false;
  int showfilter = 0;
  int index = 0;
  TabController? controller;

  @override
  void initState() {
    controller = TabController(
      vsync: this,
      initialIndex: index,
      length: 3,
    );
    controller!.addListener(() {
      setState(() {
        transactionConroller.customtype = controller!.index.toString();
        index = controller!.index;
      });
    });

    super.initState();
  }

  onTabChanged(int index) {
    setState(() {
      transactionConroller.alltransaction.clear();
      transactionConroller.customertransaction.clear();
      transactionConroller.suppliertransaction.clear();
      transactionConroller.alltransactionisnotdeleted.clear();
      transactionConroller.customertransactionisnotdeleted.clear();
      transactionConroller.suppliertransactionisnotdeleted.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
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
                        'Transactions'.tr,
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
                              final invoice = transactionInvoice(
                                supplier: Supplier2(
                                  name: saveuser()?.company.companyName,
                                  address: saveuser()?.company.companyAddress,
                                  type: " Transaction Report",
                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                ),
                                items: List.generate(
                                  transactionConroller
                                      .alltransactionisnotdeleted.length,
                                  (index) => transactionInvoiceItem(
                                    srno_: "${index + 1}",
                                    Date: transactionConroller
                                        .alltransactionisnotdeleted[index]
                                        .transactionDateFormatted,
                                    User: transactionConroller
                                                .alltransactionisnotdeleted[
                                                    index]
                                                .userName ==
                                            ""
                                        ? saveuser()?.company.companyName
                                        : transactionConroller
                                            .alltransactionisnotdeleted[index]
                                            .userName,
                                    remark: transactionConroller
                                        .alltransactionisnotdeleted[index]
                                        .remark,
                                    customer: transactionConroller
                                        .alltransactionisnotdeleted[index]
                                        .customerName,
                                    credit: transactionConroller
                                                .alltransactionisnotdeleted[
                                                    index]
                                                .transactionType ==
                                            "Due"
                                        ? ""
                                        : transactionConroller
                                            .alltransactionisnotdeleted[index]
                                            .amount
                                            .toString(),
                                    debit: transactionConroller
                                                .alltransactionisnotdeleted[
                                                    index]
                                                .transactionType ==
                                            "Paid"
                                        ? ""
                                        : transactionConroller
                                            .alltransactionisnotdeleted[index]
                                            .amount
                                            .toString(),
                                    blance: transactionConroller
                                        .alltransactionisnotdeleted[index]
                                        .totalAmount
                                        .toString(),
                                  ),
                                ).sublist(0,  transactionConroller
                                    .alltransactionisnotdeleted.length>400?400:  transactionConroller
                                    .alltransactionisnotdeleted.length),
                              );

                              transactionpdfprint.transactiongenerat(invoice);
                            } else if (index == 1) {
                              final invoice = transactionInvoice(
                                supplier: Supplier2(
                                  name: saveuser()?.company.companyName,
                                  address: saveuser()?.company.companyAddress,
                                  type: " Transaction Report",
                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                ),
                                items: List.generate(
                                  transactionConroller
                                      .customertransactionisnotdeleted.length,
                                  (index) => transactionInvoiceItem(
                                    srno_: "${index + 1}",
                                    Date: transactionConroller
                                        .customertransactionisnotdeleted[index]
                                        .transactionDateFormatted,
                                    User: transactionConroller
                                                .customertransactionisnotdeleted[
                                                    index]
                                                .userName ==
                                            ""
                                        ? saveuser()?.company.companyName
                                        : transactionConroller
                                            .customertransactionisnotdeleted[
                                                index]
                                            .userName,
                                    remark: transactionConroller
                                        .customertransactionisnotdeleted[index]
                                        .remark,
                                    customer: transactionConroller
                                        .customertransactionisnotdeleted[index]
                                        .customerName,
                                    credit: transactionConroller
                                                .customertransactionisnotdeleted[
                                                    index]
                                                .transactionType ==
                                            "Due"
                                        ? ""
                                        : transactionConroller
                                            .customertransactionisnotdeleted[
                                                index]
                                            .amount
                                            .toString(),
                                    debit: transactionConroller
                                                .customertransactionisnotdeleted[
                                                    index]
                                                .transactionType ==
                                            "Paid"
                                        ? ""
                                        : transactionConroller
                                            .customertransactionisnotdeleted[
                                                index]
                                            .amount
                                            .toString(),
                                    blance: transactionConroller
                                        .customertransactionisnotdeleted[index]
                                        .totalAmount
                                        .toString(),
                                  ),
                                ).sublist(0, transactionConroller
                                    .customertransactionisnotdeleted.length>400?400: transactionConroller
                                    .customertransactionisnotdeleted.length),
                              );

                              transactionpdfprint.transactiongenerat(invoice);
                            } else if(index ==2 ) {
                              final invoice = transactionInvoice(
                                supplier: Supplier2(
                                  name: saveuser()?.company.companyName,
                                  address: saveuser()?.company.companyAddress,
                                  type: " Transaction Report",
                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                ),
                                items: List.generate(
                                  transactionConroller
                                      .suppliertransactionisnotdeleted.length,
                                  (index) => transactionInvoiceItem(
                                    srno_: "${index + 1}",
                                    Date: transactionConroller
                                        .suppliertransactionisnotdeleted[index]
                                        .transactionDateFormatted,
                                    User: transactionConroller
                                                .suppliertransactionisnotdeleted[
                                                    index]
                                                .userName ==
                                            ""
                                        ? saveuser()!.company.companyName
                                        : transactionConroller
                                            .suppliertransactionisnotdeleted[
                                                index]
                                            .userName,
                                    remark: transactionConroller
                                        .suppliertransactionisnotdeleted[index]
                                        .remark,
                                    customer: transactionConroller
                                        .suppliertransactionisnotdeleted[index]
                                        .customerName,
                                    credit: transactionConroller
                                                .suppliertransactionisnotdeleted[
                                                    index]
                                                .transactionType ==
                                            "Due"
                                        ? ""
                                        : transactionConroller
                                            .suppliertransactionisnotdeleted[
                                                index]
                                            .amount
                                            .toString(),
                                    debit: transactionConroller
                                                .suppliertransactionisnotdeleted[
                                                    index]
                                                .transactionType ==
                                            "Paid"
                                        ? ""
                                        : transactionConroller
                                            .suppliertransactionisnotdeleted[
                                                index]
                                            .amount
                                            .toString(),
                                    blance: transactionConroller
                                        .suppliertransactionisnotdeleted[index]
                                        .totalAmount
                                        .toString(),
                                  ),
                                ).sublist(0,transactionConroller
                                    .suppliertransactionisnotdeleted.length>400?400:transactionConroller
                                    .suppliertransactionisnotdeleted.length),
                              );

                              transactionpdfprint.transactiongenerat(invoice);
                            }
                          },
                          icon: const Icon(
                            size: 30,
                            Icons.download,
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
                  onTap: (value) => onTabChanged(index),
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
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          All_Tab(),
          Customer_tab(),
          Supplire_Tab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF1BC5E),
        onPressed: () {
          Get.to(AddTransaction(

          ));
          // ),
        },
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: MaterialButton(
                height: 40,

                // borderRadius: BorderRadius.zero,
                color: Color(0xff294472),
                onPressed: () {
                  String tab = controller!.index.toString();
                  bottomsheetsort(context, () {
                    if (tab == "0") {
                      transactionConroller.alltransaction.clear();
                      transactionConroller.alltransactionisnotdeleted.clear();
                    } else if (tab == "1") {
                      transactionConroller.customertransaction.clear();
                      transactionConroller.customertransactionisnotdeleted.clear();
                    } else {
                      transactionConroller.suppliertransaction.clear();
                      transactionConroller.suppliertransactionisnotdeleted.clear();
                    }
                    transactionConroller.sorty_order = "date_asc";
                    transactionConroller.getpages(tab);
                    Get.back();
                  }, () {
                    if (tab == "0") {
                      transactionConroller.alltransaction.clear();
                      transactionConroller.alltransactionisnotdeleted.clear();
                    } else if (tab == "1") {
                      transactionConroller.customertransaction.clear();
                      transactionConroller.customertransactionisnotdeleted.clear();
                    } else {
                      transactionConroller.suppliertransaction.clear();
                      transactionConroller.suppliertransactionisnotdeleted.clear();
                    }
                    transactionConroller.sorty_order = "high_to_low";

                    transactionConroller.getpages(tab);
                    Get.back();
                  }, () {
                    if (tab == "0") {
                      transactionConroller.alltransaction.clear();
                      transactionConroller.alltransactionisnotdeleted.clear();
                    } else if (tab == "1") {
                      transactionConroller.customertransaction.clear();
                      transactionConroller.customertransactionisnotdeleted.clear();
                    } else {
                      transactionConroller.suppliertransaction.clear();
                      transactionConroller.suppliertransactionisnotdeleted.clear();
                    }
                    transactionConroller.sorty_order = "low_to_high";

                    transactionConroller.getpages(tab);
                    Get.back();
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sort, size: 25, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Sort'.tr,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              // height: 50,
              width: 2,
              color: Colors.white,
            ),
            Expanded(
              child: MaterialButton(
                height: 40,
                // borderRadius: BorderRadius.zero,
                color: Color(0xff294472),
                onPressed: () {
                  print(controller!.index);
                  String tab = controller!.index.toString();
                  bottomsheetfilter(
                    context,
                    () {
                      Get.back();
                      datedialogbox(
                          context,
                          (value) {
                            transactionConroller.from_date = value;
                          },
                          (val) => transactionConroller.to_date = val,
                          () {
                            if (tab == "0") {
                              transactionConroller.alltransaction.clear();
                            } else if (tab == "1") {
                              transactionConroller.customertransaction.clear();
                            } else {
                              transactionConroller.suppliertransaction.clear();
                            }
                            transactionConroller.getpages(tab);
                            Get.back();
                          });
                    },
                    () {
                      Get.back();
                      transactionConroller.from_date = "";
                      transactionConroller.to_date = "";
                      transactionConroller.allpage = 0 ;
                      transactionConroller.alltransaction.clear();
                      transactionConroller.getpages(tab);
                    },
                  );
                  // setState(() {
                  //   showfilter++;
                  // });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.filter_list_alt, size: 25, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Filter'.tr,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
