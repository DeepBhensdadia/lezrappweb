import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/helper.dart';

import '../../../Const.dart';
import '../chartgetxcontroller.dart';

class Sales_Purchase_Expense extends StatefulWidget {
  const Sales_Purchase_Expense({Key? key}) : super(key: key);

  @override
  State<Sales_Purchase_Expense> createState() => _Sales_Purchase_ExpenseState();
}

class _Sales_Purchase_ExpenseState extends State<Sales_Purchase_Expense> {
  ChartController _chartController = Get.put(ChartController());

  String _selectedDate = DateTime.now().year.toString();
  DateTime _initialdate = DateTime.now();
  void _pickYear(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container(
            // Need to use container to add size constraint.
            width: 300,
            height: screenheight(context, dividedby: 2),
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: _initialdate,
              selectedDate: _initialdate,
              onChanged: (DateTime dateTime) {
                setState(() {
                  Get.back();
                  _selectedDate = dateTime.year.toString();
                  _initialdate = dateTime;
                });
                _chartController
                    .Sales_purchase_and_expensewithoutgoing_only_update(
                        dateTime.year.toString());
              },
            ),
          ),
        );
      },
    );
  }

  bool salses = true;
  bool purchase = true;
  bool expense = true;
  @override
  Widget build(BuildContext context) {
    final List<FlSpot> salesDataPoints = List<FlSpot>.generate(
      _chartController.chartdatasal_pur_ex.months.length,
      (index) => FlSpot(
          index.toDouble(),
          _chartController.chartdatasal_pur_ex.sales[index] == false
              ? 0.0
              : double.parse(_chartController.chartdatasal_pur_ex.sales[index]
                  .toString())),
    );

    final List<FlSpot> purchasesDataPoints = List<FlSpot>.generate(
      _chartController.chartdatasal_pur_ex.months.length,
      (index) => FlSpot(
          index.toDouble(),
          _chartController.chartdatasal_pur_ex.purchases[index] == false
              ? 0.0
              : double.parse(_chartController
                  .chartdatasal_pur_ex.purchases[index]
                  .toString())),
    );

    final List<FlSpot> expensesDataPoints = List<FlSpot>.generate(
      _chartController.chartdatasal_pur_ex.months.length,
      (index) => FlSpot(
          index.toDouble(),
          _chartController.chartdatasal_pur_ex.expenses[index] == false
              ? 0.0
              : double.parse(_chartController
                  .chartdatasal_pur_ex.expenses[index]
                  .toString())),
    );
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            title: Text(
              'Sales vs Purchase vs Expense'.tr,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
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
              Row(
                children: [
                  IconButton(
                    onPressed: () { _pickYear(context);},
                    icon: const Icon(
                      size: 30,
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _pickYear(context);
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
              )
            ],
          ),
          body: GetBuilder<ChartController>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            print("kk");
                            expense = !expense;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 40,
                              color: Colors.red,
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
                                      "Expense",
                                      style: TextStyle(
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
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            print("kk");
                            salses = !salses;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 40,
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
                                      "salse",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 16),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !salses,
                                    child: Center(
                                        child: Container(
                                          height: 1,
                                          width: 40,
                                          color: Colors.black,
                                        )),
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            print("kk");
                            purchase = !purchase;
                          });
                        },
                        child: Row(

                          children: [
                            Container(
                              height: 20,
                              width: 40,
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
                                      "Puechase",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 16),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !purchase,
                                    child: Center(
                                        child: Container(
                                          height: 1,
                                          width: 60,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Center(
                      child: Container(
                        height: screenheight(context, dividedby: 1.25),
                        width: screenwidth(context, dividedby: 1),
                        child: LineChart(
                          buildLineChartData(),
                          swapAnimationDuration:
                              Duration(milliseconds: 150), // Optional
                          swapAnimationCurve: Curves.linear, // Optional
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  LineChartData buildLineChartData() {
    final List<String> months = _chartController.chartdatasal_pur_ex.months;
    final List<dynamic> sales = _chartController.chartdatasal_pur_ex.sales;
    final List<dynamic> purchases =
        _chartController.chartdatasal_pur_ex.purchases;
    final List<dynamic> expenses =
        _chartController.chartdatasal_pur_ex.expenses;

    final List<FlSpot> salesDataPoints = List<FlSpot>.generate(
      months.length,
      (index) => FlSpot(index.toDouble(),
          sales[index] == false ? 0.0 : double.parse(sales[index].toString())),
    );

    final List<FlSpot> purchasesDataPoints = List<FlSpot>.generate(
      months.length,
      (index) => FlSpot(
          index.toDouble(),
          purchases[index] == false
              ? 0.0
              : double.parse(purchases[index].toString())),
    );

    final List<FlSpot> expensesDataPoints = List<FlSpot>.generate(
      months.length,
      (index) => FlSpot(
          index.toDouble(),
          expenses[index] == false
              ? 0.0
              : double.parse(expenses[index].toString())),
    );

    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                final int index = value.toInt();
                if (index >= 0 && index < months.length) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 10,
                    child: Text(
                      months[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  );
                }
                return Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(

                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(axisSide: AxisSide.right,
                  child: Text(value.toString(),style: TextStyle(fontSize:  screenwidth(context,dividedby:40),)),);
                },
            reservedSize: screenwidth(context,dividedby: 6),
            showTitles: true,
            // interval: getMaxYValue(sales, purchases, expenses) / 28,
          )),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          )),
      borderData: FlBorderData(
          border:
              Border(bottom: BorderSide(width: 1), left: BorderSide(width: 1))),
      minX: 0,
      maxX: months.length.toDouble() - 1,
      minY: 0,
      maxY: getMaxYValue(sales, purchases, expenses)+100000,
      lineBarsData: [
        LineChartBarData(
          show: salses,
          spots: salesDataPoints,
          // isCurved: true,
          color: custom,
          barWidth: 3,
          dotData: FlDotData(show: true),
        ),
        LineChartBarData(
          show: purchase,
          spots: purchasesDataPoints,
          // isCurved: true,
          color: yellowcustomer,
          barWidth: 3,
          dotData: FlDotData(show: true),
        ),
        LineChartBarData(
          show: expense,
          spots: expensesDataPoints,
          // isCurved: true,
          color: Colors.red,
          barWidth: 3,
          dotData: FlDotData(show: true),
        ),
      ],
    );
  }

  double getMaxYValue(
      List<dynamic> sales, List<dynamic> purchases, List<dynamic> expenses) {
    double maxY = 0;
    final List<List<dynamic>> data = _chartController.chartdatasal_pur_ex.data;

    for (final List<dynamic> dataRow in data) {
      for (final dynamic value in dataRow.skip(1)) {
        if (value is num && value > maxY) {
          maxY = value.toDouble();
        }
      }
    }
    return maxY;
  }
}
