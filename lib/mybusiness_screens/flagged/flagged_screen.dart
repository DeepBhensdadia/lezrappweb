import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/mybusiness_screens/flagged/all_screen.dart';
import 'package:lezrapp/mybusiness_screens/flagged/supplier_screen.dart';
import '../../getx controller/customer/flagscreencontroller.dart';
import 'customer.dart';

class flagged_screen extends StatefulWidget {
  const flagged_screen({Key? key}) : super(key: key);

  @override
  State<flagged_screen> createState() => _flagged_screenState();
}

class _flagged_screenState extends State<flagged_screen>
    with SingleTickerProviderStateMixin {
  flagcontroller flag_Conroller = Get.put(flagcontroller());

  int index = 0;
  int search = 0;
  TabController? controller;

  @override
  void initState() {
    controller = TabController(
      vsync: this,
      initialIndex: index,
      length: 3,
    );
    controller!.addListener(
      () {
        setState(
          () {
            index = controller!.index;
          },
        );
      },
    );
    super.initState();
  }

  void onTabChanged(int index) {
    setState(() {
      flag_Conroller.allcustomer.clear();
      flag_Conroller.customer.clear();
      flag_Conroller.supplire.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(bottom: (search % 2 == 0) ? 35 : 79),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    search++;
                  });
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: (search % 2 == 0) ? 100 : 143.5,
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
                          'Flagged'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              letterSpacing: 0.2,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (search % 2 == 0)
                  ? SizedBox(
                      height: 0,
                    )
                  : Container(
                      height: screenheight(context, dividedby: 20),
                      child: TextField(
                        cursorHeight: 20,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          hintText: 'Search Contacts'.tr,
                          hintStyle: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                        onChanged: (value) {
                          if (index == 0) {
                            flag_Conroller.allcustomer.clear();
                          } else if (index == 1) {
                            flag_Conroller.customer.clear();
                          } else {
                            flag_Conroller.supplire.clear();
                          }
                          index == 0
                              ? flag_Conroller.getflagdata2(value)
                              : flag_Conroller.getflagdata(
                                  index.toString(), value);
                        },
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
          // physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            all_screen_flagged(),
            customer_flagged(),
            supplier_screen(),
            // All_Tab(),
            // Customer_tab(),
            // Supplire_Tab(),
          ],
        ),
      ),
    );
  }
}
