import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/play/P_screens/P_assets.dart';
import 'package:lezrapp/play/P_screens/P_cash.dart';
import 'package:lezrapp/play/P_screens/P_home.dart';
import 'package:lezrapp/play/P_screens/P_points.dart';
import 'package:lezrapp/play/P_screens/P_transactions.dart';
import '../helper.dart';
import '../mainscreen_controller.dart';

class P_main extends StatefulWidget {
  const P_main({Key? key}) : super(key: key);

  @override
  State<P_main> createState() => _P_mainState();
}

class _P_mainState extends State<P_main> {
  @override
  Mainscreen_Conroller getx = Get.put(Mainscreen_Conroller());
  List<Widget> screens = [
    P_points(),
    P_transactions(),
    P_home(),
    P_assets(),
    P_cash()
  ];

  final PageController _controller = PageController(initialPage: 2);

  void changePage(int page) => _controller.jumpToPage(page);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: screens,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff294472),
        child: SizedBox(
          height: screenheight(context, dividedby: 12.5),
          child: Column(
            children: [
              Divider(
                height: 0,
                thickness: 5,
                color: Color(0xffF1BC5E),
              ),
              SizedBox(
                height: screenheight(context, dividedby: 13),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(
                        () {
                          return MaterialButton(
                            minWidth: screenwidth(context, dividedby: 6),
                            onPressed: () {
                              getx.currentTab.value = 0;

                              changePage(0);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getx.currentTab.value == 0
                                    ? Image(
                                        width:
                                            screenheight(context, dividedby: 30),
                                        height:
                                            screenheight(context, dividedby: 30),
                                        image: const AssetImage(
                                            'assets/dukon/reports2.png'))
                                    : Image(
                                        width:
                                            screenheight(context, dividedby: 30),
                                        height:
                                            screenheight(context, dividedby: 30),
                                        image: const AssetImage(
                                            'assets/new/points_profile.png')),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Points\nStatement',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Obx(
                        () => MaterialButton(
                          minWidth: screenwidth(context, dividedby: 6),
                          onPressed: () {
                            getx.currentTab.value = 1;

                            changePage(1);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getx.currentTab.value == 1
                                  ? Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/dukon/transaction.png'))
                                  : Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/new/transaction@2x.png')),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'My\nTransactio',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => MaterialButton(
                          minWidth: screenwidth(context, dividedby: 6),
                          onPressed: () {
                            getx.currentTab.value = 2;

                            changePage(2);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getx.currentTab.value == 2
                                  ? Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/new/home_selected@2x.png'))
                                  : Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/new/home.png')),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => MaterialButton(
                          minWidth: screenwidth(context, dividedby: 6),
                          onPressed: () {
                            getx.currentTab.value = 3;

                            changePage(3);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getx.currentTab.value == 3
                                  ? Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/dukon/my_assets.png'))
                                  : Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/new/asset.png')),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'My\nAssets',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => MaterialButton(
                          minWidth: screenwidth(context, dividedby: 6),
                          onPressed: () {
                            getx.currentTab.value = 4;

                            changePage(4);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getx.currentTab.value == 4
                                  ? Image(
                                      width: screenheight(context, dividedby: 30),
                                      height:
                                          screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/dukon/available_cash.png'))
                                  : Image(
                                      height:
                                          screenheight(context, dividedby: 30),
                                      width: screenheight(context, dividedby: 30),
                                      image: const AssetImage(
                                          'assets/new/cash.png')),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Cash\nAvailable',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
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
            ],
          ),
        ),
      ),
    );
  }
}
