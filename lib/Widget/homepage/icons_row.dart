import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';

import '../../Icons_row/manage_staff.dart';
import '../../Icons_row/orders_expenses.dart';
import '../../Icons_row/reports/Bussinesshealth.dart';
import '../../getx controller/summarycontroller.dart';
import 'Icons_withname.dart';

class Icons_Row extends StatefulWidget {
  const Icons_Row({Key? key}) : super(key: key);

  @override
  State<Icons_Row> createState() => _Icons_RowState();
}

class _Icons_RowState extends State<Icons_Row> {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon_With_Name(
            Stringimage: 'assets/new/l/manage-staff.png',
            name: 'Manage Staff',
            onPressed: () {
              if(_summarycontroller.staff.isFalse){
              Get.to(manage_staff());}else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission Denied")));
              }
            },
          ),
          Icon_With_Name(
            Stringimage: 'assets/new/l/reports.png',
            name: 'View Report',
            onPressed: () {
              Get.to(reports_screen());
            },
          ),
          Icon_With_Name(
            Stringimage: 'assets/new/l/business-health.png',
            name: 'Business Health',
            onPressed: () {
              Get.to(Businesshealth());
            },
          ),
          Icon_With_Name(
            Stringimage: 'assets/new/l/expense.png',
            name: 'Order & Expanses',
            onPressed: () {
              Get.to(orders_expenses());
            },
          ),
        ],
      ),
    );
  }
}
