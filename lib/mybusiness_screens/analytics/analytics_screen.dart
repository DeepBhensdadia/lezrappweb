import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/mybusiness_screens/analytics/chartoverall/sales_vs_purchase_vs_expense.dart';

import '../../Const.dart';
import 'chartgetxcontroller.dart';
import 'chartoverall/sales_payment_customer.dart';

class analytics extends StatelessWidget {
  const analytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChartController chartcontroller = Get.put(ChartController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: custom,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: 60,
            color: custom,
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
                      'Analytics'.tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 0),
          child: Column(
            children: [
              analytic(
                text: 'Sales vs Purchase vs Expense',
                ontap: () {
                  String year = DateTime.now().year.toString();
                  chartcontroller.Sales_purchase_and_expense(year);
                  // Get.to(Sales_Purchase_Expense());
                },
              ),
              analytic(
                text: 'Sales vs Payment of Customers',
                ontap: () {
                  String year = DateTime.now().year.toString();
                  chartcontroller.Sales_purchase_and_customer(year);
                },
              ),
              analytic(
                text: 'Purchase vs Payment of Suppliers',
                ontap: () {
                  String year = DateTime.now().year.toString();
                  chartcontroller.purchase_and_supplier(year);
                },
              ),
              analytic(
                text: 'New Customers',
                ontap: () {
                  String year = DateTime.now().year.toString();
                  chartcontroller.newcustomerdetail(year);
                },
              ),
              analytic(
                text: 'New Suppliers',
                ontap: () {
                  String year = DateTime.now().year.toString();
                  chartcontroller.newsupplierdetail(year);
                },
              ),
              analytic(
                text:
                    'Sales by new customers vs Sales by existing customers',
                ontap: () {
                  String year = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  chartcontroller.salsebynewvsold(year);
                },
              ),
              analytic(
                text: 'Supply by New Suppliers vs Supply by Existing Suppliers',
                ontap: () {
                  String year = DateFormat('yyyy-MM-dd').format(DateTime.now());
                chartcontroller.supplybynewvsold(year);},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class analytic extends StatelessWidget {
  analytic({Key? key, required this.text, required this.ontap})
      : super(key: key);

  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
            child: Container(
              height: 48,
              child: Row(
                children: [
                  Text(
                    text.tr,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.8),
                  ),
                ],
              ),
            ),
          ),
        ),
        div()
      ],
    );
  }
}
