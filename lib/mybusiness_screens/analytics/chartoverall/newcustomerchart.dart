import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/helper.dart';
import '../../../Const.dart';
import '../chartgetxcontroller.dart';

class NewCustomersChart extends StatefulWidget {
  const NewCustomersChart({Key? key}) : super(key: key);

  @override
  State<NewCustomersChart> createState() =>
      _NewCustomersChartState();
}

class _NewCustomersChartState
    extends State<NewCustomersChart> {
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
                _chartController.newcustomerdetail_onupdate(
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            title: Text(
              'New Customer',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15),
                    child: Center(
                      child: Container(
                          height: screenheight(context, dividedby: 1.2),
                          width: screenwidth(context, dividedby: 1),
                          child: buildLineChartData()),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  BarChart buildLineChartData() {
    final List<String> months = _chartController.newcustom.months;
    final List<dynamic> record =
        _chartController.newcustom.record;


    final List<BarChartGroupData> barGroups = List<BarChartGroupData>.generate(
      months.length,
          (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: double.parse(record[index].toString()),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5)),
            width: 10,
            color: yellowcustomer,
          ),
        ],
      ),
    );

    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                // reservedSize: 50,
                getTitlesWidget: (value, meta) {
                  final int index = value.toInt();
                  if (index >= 0 && index < months.length) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 10,
                      child: Container(
                        width: screenwidth(context, dividedby: 14),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Text(
                            months[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
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
                  reservedSize: 50,
                  showTitles: true,
                  interval: getMaxYValue(record)<5 ?(getMaxYValue(record)/2).round().toDouble() : (getMaxYValue(record) /5).round().toDouble(),
                )),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            )),
        borderData: FlBorderData(
            border: Border(
                bottom: BorderSide(width: 1), left: BorderSide(width: 1))),
        barGroups: [
          ...barGroups,
        ],
        minY: 0,
        maxY: getMaxYValue(record) * 1.2,
      ),
    );

  }

  double getMaxYValue( List<dynamic> expenses) {
    double maxY = 0;
    final List<List<dynamic>> data = _chartController.newcustom.data;

    for (final List<dynamic> dataRow in data) {
      for (final dynamic value in dataRow.skip(1)) {
        if (value is num && value > maxY) {
          maxY = value.toDouble();
        }
      }
    }
    if (maxY == 0) {
      maxY = 12;
    }
    return maxY;
  }
}
