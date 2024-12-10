import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports/today/supplire_report.dart';
import '../../../api/const_apis.dart';
import '../../../api/pdf_api.dart';
import '../../../api/pdf_invoice_api.dart';
import '../../../api/pdfprint.dart';
import '../../../getx controller/todaystransaction.dart';
import '../../../helper.dart';
import '../../../model/bank.dart';
import '../../../model/customer.dart';
import '../../../model/invoice.dart';
import '../../../model/supplier.dart';
import 'all_reports.dart';
import 'customer_report.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class today_transactions extends StatefulWidget {
  const today_transactions({Key? key}) : super(key: key);

  @override
  State<today_transactions> createState() => _today_transactionsState();
}

class _today_transactionsState extends State<today_transactions>
    with SingleTickerProviderStateMixin {
  TextEditingController TFromDate = TextEditingController();
  TextEditingController TToDate = TextEditingController();
  // bool showfilter = false;
  int showfilter = 0;
  int index = 0;
  TabController? controller;
  todaystraalldata alldata = Get.put(todaystraalldata());
  todaystracustomer customer = Get.put(todaystracustomer());
  todaystrasupplire supplire = Get.put(todaystrasupplire());
  @override
  void initState() {
    alldata.customerdata();
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
                          ),
                        ),
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
                              final invoice = Invoice2(
                                supplier: Supplier2(
                                  name: saveuser()?.company.companyName,
                                  address: saveuser()?.company.companyAddress,
                                  type: "Customer Advances",
                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                ),
                                items: List.generate(
                                  alldata.credit.transactions.length,
                                  (index) => InvoiceItem2(
                                    srno_: "${index + 1}",
                                    Customername: alldata.credit
                                            .transactions[index].customerName ??
                                        "",
                                    mobileno: alldata.credit.transactions[index]
                                            .customerMobileNo ??
                                        "",
                                    address: alldata.credit.transactions[index]
                                            .remark ??
                                        "",
                                    type: alldata.credit.transactions[index]
                                            .transactionType ??
                                        "",
                                    amount: getformettedamount(
                                        text:
                                            "${alldata.credit.transactions[index].amount}"),
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
                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                ),
                                items: List.generate(
                                  customer.credit.transactions.length,
                                  (index) => InvoiceItem2(
                                    srno_: "${index + 1}",
                                    Customername: customer.credit
                                            .transactions[index].customerName ??
                                        "",
                                    mobileno: customer
                                            .credit
                                            .transactions[index]
                                            .customerMobileNo ??
                                        "",
                                    address: customer.credit.transactions[index]
                                            .remark ??
                                        "",
                                    type: customer.credit.transactions[index]
                                            .transactionType ??
                                        "",
                                    amount: getformettedamount(
                                        text:
                                            "${customer.credit.transactions[index].amount}"),
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
                                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                                ),
                                items: List.generate(
                                  supplire.credit.transactions.length,
                                  (index) => InvoiceItem2(
                                    srno_: "${index + 1}",
                                    Customername: supplire.credit
                                            .transactions[index].customerName ??
                                        "",
                                    mobileno: supplire
                                            .credit
                                            .transactions[index]
                                            .customerMobileNo ??
                                        "",
                                    address: supplire.credit.transactions[index]
                                            .remark ??
                                        "",
                                    type: supplire.credit.transactions[index]
                                            .transactionType ??
                                        "",
                                    amount: getformettedamount(
                                        text:
                                            "${supplire.credit.transactions[index].amount}"),
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
                          ),
                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            all_reports(),
            customer_report(),
            supplire_report(),
            // All_Tab(),
            // Customer_tab(),
            // Supplire_Tab(),
          ],
        ),
      ),
    );
  }
}
