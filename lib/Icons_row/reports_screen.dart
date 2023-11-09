import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reminder/remainder_screen.dart';
import 'package:lezrapp/Icons_row/reports/coustomers_outstanding.dart';
import 'package:lezrapp/Icons_row/reports/customers_advance.dart';
import 'package:lezrapp/Icons_row/reports/suppiler_advance.dart';
import 'package:lezrapp/Icons_row/reports/suppiler_outstanding.dart';
import 'package:lezrapp/Icons_row/reports/today/today_transactions.dart';
import 'package:lezrapp/Icons_row/reports/top_customer.dart';
import 'package:lezrapp/Icons_row/reports/top_supplier.dart';
import 'package:lezrapp/Icons_row/reports/total/credit/credit_screen.dart';
import 'package:lezrapp/Icons_row/reports/total/debit/debit_screen.dart';

import '../getx controller/remidercontroller.dart';

class reports_screen extends StatelessWidget {
  const reports_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemiderController remider = Get.put(RemiderController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff294472),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
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
                      'Reports'.tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         size: 30,
                //         Icons.download,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5, left: 0),
          child: Column(
            children: [
              report_widget(
                name: "Today Transactions".tr,
                ontap: () {
                  Get.to(
                    today_transactions(),
                  );
                },
              ),
              report_widget(
                name: 'Customers Outstanding',
                ontap: () {
                  Get.to(
                    coustomers_outstanding(),
                  );
                },
              ),
              report_widget(
                name: 'Suppliers Outstanding',
                ontap: () {
                  Get.to(
                    suppiler_outstanding(),
                  );
                },
              ),
              report_widget(
                name: 'Customers Advance',
                ontap: () {
                  Get.to(
                    customers_advance(),
                  );
                },
              ),
              report_widget(
                name: 'Suppliers Advance',
                ontap: () {
                  Get.to(
                    suppiler_advance(),
                  );
                },
              ),
              report_widget(
                name: 'Total Credit',
                ontap: () {
                  Get.to(
                    credit_screen(),
                  );
                },
              ),
              report_widget(
                name: 'Total Debit',
                ontap: () {
                  Get.to(
                    debit_screen(),
                  );
                },
              ),
              report_widget(
                name: 'Reminders',
                ontap: () {
                  Get.to(remainder_screen(),);
                 remider.get_all_remider();
                },
              ),
              report_widget(
                name: 'Top Customer',
                ontap: () {
                  Get.to(
                    top_custimer(),
                  );
                },
              ),
              report_widget(
                name: 'Top Supplier',
                ontap: () {
                  Get.to(
                    top_supplier(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class report_widget extends StatelessWidget {
  const report_widget({
    Key? key,
    required this.name,
    required this.ontap,
  }) : super(key: key);

  final String name;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  name.tr,
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        div()
      ],
    );
  }
}

class div extends StatelessWidget {
  const div({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      height: 0,
      color: Colors.grey,
    );
  }
}
