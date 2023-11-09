import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reminder/all_reminder.dart';
import 'package:lezrapp/Icons_row/reminder/customer_reminder.dart';
import 'package:lezrapp/Icons_row/reminder/supplier_reminder.dart';
import '../../screens/bottomsheet.dart';

class remainder_screen extends StatefulWidget {
  const remainder_screen({Key? key}) : super(key: key);

  @override
  State<remainder_screen> createState() => _remainder_screenState();
}

class _remainder_screenState extends State<remainder_screen>  with SingleTickerProviderStateMixin{
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
        index = controller!.index;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                            ),),
                        const SizedBox(
                          width: 20,
                        ),
                         Text(
                          'Reminders'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),

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
                    tabs:  [
                      Tab(
                        child: Text(
                          'ALL'.tr,
                          style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'CUSTOMER'.tr,
                          style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'SUPPLIER'.tr,
                          style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children:  [
            all_reminder(),
            customer_reminder(),
            supplier_reminder(),
          ],
        ),
      ),
    );
  }
}
