import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/getx%20controller/summarycontroller.dart';

import '../../Const.dart';
import '../../mybusiness_screens/suppliers/purchase.dart';
import '../../mybusiness_screens/suppliers/sales.dart';

class you_will extends StatefulWidget {
  const you_will({Key? key}) : super(key: key);

  @override
  State<you_will> createState() => _you_willState();
}

class _you_willState extends State<you_will>
    with SingleTickerProviderStateMixin {
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  String _selectedDate = DateTime.now().year.toString();
  DateTime _initialdate = DateTime.now();
  int index = 0;
  TabController? controller;
  void _pickYear(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container( // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate:_initialdate,
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: _initialdate,
              onChanged: (DateTime dateTime) {
             setState(() {
               Get.back();
               _selectedDate = dateTime.year.toString();
               _initialdate = dateTime;
             });
             _summarycontroller.get_salseandpurchase(dateTime.year.toString());
              },
            ),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    controller = TabController(
      vsync: this,
      initialIndex: index,
      length: 2,
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          flexibleSpace: Column(
            children: [
              Container(
                height: 60,
                color:custom,
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
                          'Statement'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              letterSpacing: 0.2,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            size: 30,
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _pickYear(context);
                            // showDatePicker(
                            //   context: context,
                            //   initialDate: DateTime.now(),
                            //   firstDate: DateTime(1900),
                            //   lastDate: DateTime(2100),
                            //   initialDatePickerMode: DatePickerMode.year,
                            // ).then((DateTime? value) {
                            //   if (value != null) {
                            //     final selectedYear = value.year;
                            //     print('Selected Year: $selectedYear');
                            //   }
                            // });
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
                        SizedBox(width: 10,),
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
                          'SALES'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'PURCHASE'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                ),
              ),
            ],
          ),
        ),
        body: GetBuilder<Summarycontroller>(builder: (salsecontroller) {

          return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children:  [
              salse(salsecontroller.salsepuchase),
              purchase(salsecontroller.salsepuchase),
            ],
          ),
        );
        },)
      ),
    );
  }
}
