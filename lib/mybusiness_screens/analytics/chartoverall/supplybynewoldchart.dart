import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/helper.dart';
import '../../../Const.dart';
import '../chartgetxcontroller.dart';

class SupplyByNewvsOld extends StatefulWidget {
  const SupplyByNewvsOld({Key? key}) : super(key: key);

  @override
  State<SupplyByNewvsOld> createState() => _SupplyByNewvsOldState();
}

class _SupplyByNewvsOldState extends State<SupplyByNewvsOld> {
  ChartController _chartController = Get.put(ChartController());

  String _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateTime _initialdate = DateTime.now();
  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialdate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        String date = DateFormat('yyyy-MM-dd').format(pickedDate);
        _selectedDate = date;
        _chartController
            .supplybynewvsold_onupdate(
            date);
      });
    }
  }

  bool salses = true;
  bool purchase = true;
  bool expense = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            title: Container(
              width: screenwidth(context,dividedby: 2),
              child: Text(
                'Supply new Vs old Suppliers ',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            actions: [
              InkWell(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _showDatePicker(context);
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showDatePicker(context);
                      },
                      child: Text(
                        _selectedDate,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
          body: GetBuilder<ChartController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 50,
                              color: yellowcustomer,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 20,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "Supply by new Suppliers",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !expense,
                                    child: Center(
                                        child: Container(
                                          height: 1,
                                          width: 50,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),SizedBox(height: 15,),  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 50,
                              color: custom,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 20,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "Supply by existing Suppliers",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !expense,
                                    child: Center(
                                        child: Container(
                                          height: 1,
                                          width: 50,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Center(
                      child: Container(
                          height: screenheight(context, dividedby: 3.2),
                          width: screenwidth(context, dividedby: 1.5),
                          child: buildLineChartData()),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  PieChart buildLineChartData() {
    final List<int> months = _chartController.supplybynewold.data;
    // final List<dynamic> record =
    //     _chartController.supplybynewold.record;


    final List<PieChartSectionData> barGroups = List<PieChartSectionData>.generate(
      months.length,
          (index) => PieChartSectionData(
        title:_chartController.supplybynewold.data[index].toString(),
        radius: 70,
        color: index == 0 ? yellowcustomer : custom,
        titleStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
        value: _chartController.supplybynewold.data[index].toDouble(),
      ),
    );

    return PieChart(
      PieChartData(
        sections: [
          ...barGroups,
        ],
        borderData: FlBorderData(
            border: Border(
                bottom: BorderSide(width: 1), left: BorderSide(width: 1))),
      ),
    );
  }
}
