// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/notification/notification_api.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'Const.dart';
import 'Dashboard/Home.dart';
import 'Dashboard/addcustomer.dart';
import 'Dashboard/addcustomerbottom.dart';
import 'Dashboard/addexpense.dart';
import 'Dashboard/addsupplire.dart';
import 'Dashboard/addtransaction.dart';
import 'api/const_apis.dart';
import 'getx controller/summarycontroller.dart';
import 'helper.dart';
import 'mainscreen_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Mainscreen_Conroller getx = Get.put(Mainscreen_Conroller());
  List<Widget> screens = [
    AddExpense(back: "notback"),
    AddTransaction(back: "notback"),
    Home(),
    Addcustomerbottom(back: "notback"),
    AddSupplire()
  ];

  @override
  void initState() {
    super.initState();
  }

  PageController _controller = PageController(initialPage: 2);

  void changePage(int page) => _controller.jumpToPage(page);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () async {
          if (getx.currentTab.value == 2) {
            return true;
          } else {
            getx.currentTab.value = 2;
            changePage(2);
            return false; // Prevent default back button behavior
          }
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: kweb()
              ? screenheight(context, dividedby: 10)
              : screenheight(context, dividedby: 13),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () {
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        getx.currentTab.value = 0;
                        changePage(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getx.currentTab.value == 0
                              ? Image(
                                  width: screenheight(context, dividedby: 30),
                                  height: screenheight(context, dividedby: 30),
                                  image: const AssetImage(
                                      'assets/new/l/expense.png'))
                              : Image(
                                  width: screenheight(context, dividedby: 30),
                                  height: screenheight(context, dividedby: 30),
                                  image: const AssetImage(
                                      'assets/new/l/expense-bot-normal.png')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Add Expense'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 10,
                              color: getx.currentTab.value == 0
                                  ? const Color(0xff294472)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Obx(
                  () => CupertinoButton(
                    padding: EdgeInsets.zero,
                    // minWidth: screenwidth(context, dividedby: 7),
                    onPressed: () {
                      getx.currentTab.value = 1;

                      changePage(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getx.currentTab.value == 1
                            ? Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/transaction.png'))
                            : Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/transaction-bot-normal.png')),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Add Transaction'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 10,
                            color: getx.currentTab.value == 1
                                ? const Color(0xff294472)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => CupertinoButton(
                    padding: EdgeInsets.zero,
                    // minWidth: screenwidth(context, dividedby: 7),
                    onPressed: () {
                      getx.currentTab.value = 2;

                      changePage(2);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getx.currentTab.value == 2
                            ? Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/home_selected@2x.png'))
                            : Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/home-bot-normal.png')),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Home'.tr,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 10,
                            color: getx.currentTab.value == 2
                                ? const Color(0xff294472)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => CupertinoButton(
                    padding: EdgeInsets.zero,
                    // minWidth: screenwidth(context, dividedby: 7),
                    onPressed: () {
                      getx.currentTab.value = 3;

                      changePage(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getx.currentTab.value == 3
                            ? Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/customer.png'))
                            : Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/customer-bot-normal.png')),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'AddCustomer'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 10,
                            color: getx.currentTab.value == 3
                                ? const Color(0xff294472)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => CupertinoButton(
                    padding: EdgeInsets.zero,
                    // minWidth: screenwidth(context, dividedby: 7),
                    onPressed: () {
                      getx.currentTab.value = 4;

                      changePage(4);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getx.currentTab.value == 4
                            ? Image(
                                width: screenheight(context, dividedby: 30),
                                height: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/supplier.png'))
                            : Image(
                                height: screenheight(context, dividedby: 30),
                                width: screenheight(context, dividedby: 30),
                                image: const AssetImage(
                                    'assets/new/l/supplier-bot-normal.png')),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Add Supplier'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 10,
                            color: getx.currentTab.value == 4
                                ? const Color(0xff294472)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
