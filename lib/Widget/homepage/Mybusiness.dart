import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/api_model/get_summary.dart';
import 'package:lezrapp/mybusiness_screens/analytics/analytics_screen.dart';
import 'package:lezrapp/mybusiness_screens/business_card/businesscard_screen.dart';
import 'package:lezrapp/mybusiness_screens/flagged/flagged_screen.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/setting_screens.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/mybusiness_screens/customer/customer_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../controller.dart';
import '../../getx controller/customer/getcustomersdatamybussiness.dart';
import '../../mybusiness_screens/rank_screen/rank_screen.dart';
import '../../mybusiness_screens/suppliers/mybusiness_suppliers.dart';
import 'Icons_withname.dart';

class My_Business extends StatelessWidget {
  final GetSummary summary;
  const My_Business({Key? key, required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getcutomerdatamybusi getcustomer_Conroller =
        Get.put(getcutomerdatamybusi());
    getsuppliredatamybusi getsup_Conroller = Get.put(getsuppliredatamybusi());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'My Business'.tr,
            style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff294472)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // color: Colors.black,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: screenheight(context, dividedby: 11),
                            child: Badge(
                              alignment: AlignmentDirectional(
                                  screenwidth(context, dividedby: 15), 0),
                              label: Text(
                                summary.totalCustomer,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.white),
                              ),
                              child: Icon_With_Name(
                                Stringimage: 'assets/new/l/customer.png',
                                name: 'Customers',
                                onPressed: () {
                                  getcustomer_Conroller.postcustom.clear();
                                  getcustomer_Conroller.serchtextcustom = "";
                                  getcustomer_Conroller.getpagescustom("1");
                                  Get.to(
                                    customer_screen(),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon_With_Name(
                            Stringimage: 'assets/new/l/settings.png',
                            name: 'Settings',
                            onPressed: () {
                              Get.to(
                                setting_screen(),
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenheight(context, dividedby: 11),
                            child: Badge(
                              alignment: AlignmentDirectional(
                                  screenwidth(context, dividedby: 15), 0),
                              label: Text(
                                summary.totalSupplier,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.white),
                              ),
                              child: Icon_With_Name(
                                Stringimage: 'assets/new/l/supplier.png',
                                name: 'Suppliers',
                                onPressed: () {
                                  getsup_Conroller.post.clear();
                                  getsup_Conroller.serchtext = "";
                                  getsup_Conroller.getpages("2");
                                  Get.to(
                                    mybus(),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon_With_Name(
                            Stringimage: 'assets/new/l/analytics.png',
                            name: 'Analytics',
                            onPressed: () {
                              Get.to(
                                analytics(),
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenheight(context, dividedby: 11),
                            child: Icon_With_Name(
                              Stringimage: 'assets/new/l/business-card.png',
                              name: 'Business Card',
                              onPressed: () {
                                // context.loaderOverlay.show();
                                // Future.delayed(Duration(seconds: 3),() {
                                //   context.loaderOverlay.hide();
                                // },);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Badge(
                            alignment: AlignmentDirectional(
                                screenwidth(context, dividedby: 15), 0),
                            isLabelVisible:
                                summary.totalFlagged == "0" ? false : true,
                            label: Text(
                              summary.totalFlagged,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white),
                            ),
                            child: Icon_With_Name(
                              Stringimage: 'assets/new/l/flagged.png',
                              name: 'Flagged',
                              onPressed: () {
                                Get.to(
                                  flagged_screen(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                height: screenheight(context, dividedby: 11),
                                child: Icon_With_Name(
                                  Stringimage: 'assets/gif/iOrder.png',
                                  name: 'iOrder',
                                  onPressed: () {
                                    // showSuccessPopup(Get.context!);
                                  },
                                ),
                              ),
                              Container(
                                child: Image.network(
                                  "https://web.lezrapp.com/lezr/app-asset/new.gif",
                                  height: 15,
                                  // width: screenwidth(context,dividedby: 15),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Icon_With_Name(
                                Stringimage: 'assets/gif/iQuote.png',
                                name: 'iQuote',
                                onPressed: () {},
                              ),
                              Container(
                                child: Image.network(
                                  "https://web.lezrapp.com/lezr/app-asset/new.gif",
                                  height: 15,
                                  // width: screenwidth(context,dividedby: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              // Obx(() => Visibility(
              //       visible:  settingbool.enable.value == true ? false : true,
              //       child: Column(
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               // Get.to(
              //               //   rank_screen()
              //               // );
              //             },
              //             child: Padding(
              //               padding: const EdgeInsets.only(top: 0),
              //               child: Container(
              //                 height: screenheight(context, dividedby: 6),
              //                 width: screenwidth(context, dividedby: 5.2),
              //                 decoration: BoxDecoration(
              //                   color: Color(0xffDEDEDE).withOpacity(0.2),
              //                   image: DecorationImage(
              //                       alignment: Alignment.bottomCenter,
              //                       // fit: BoxFit.cover,
              //                       image: AssetImage('assets/gif/rank.gif')),
              //                   // color: Colors.blueGrey.withOpacity(0.3),
              //                   border: Border.all(
              //                       width: 3,
              //                       color: Colors.grey.withOpacity(0.4)),
              //                   borderRadius: BorderRadius.circular(10.0),
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Text(
              //                         'Your Rank'.tr,
              //                         textAlign: TextAlign.center,
              //                         style: TextStyle(
              //                             fontFamily: 'SF Pro Display',
              //                             fontSize: screenheight(context,
              //                                 dividedby: 65),
              //                             color: Colors.black,
              //                             fontWeight: FontWeight.w600),
              //                       ),
              //                     ),
              //                     Text(
              //                       summary.summery.rank,
              //                       style: TextStyle(
              //                           fontFamily: 'SF Pro Display',
              //                           fontSize: screenheight(context,
              //                               dividedby: 30),
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Row(
              //             children: [
              //               Container(
              //                 height: screenheight(context, dividedby: 25),
              //                 decoration: BoxDecoration(
              //                   // color: Colors.blueGrey.withOpacity(0.3),
              //                   border: Border.all(
              //                       width: 1, color: Color(0xffF1BC5E)),
              //                   // borderRadius: BorderRadius.circular(5.0),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 2,
              //               ),
              //               Container(
              //                 height: screenheight(context, dividedby: 25),
              //                 decoration: BoxDecoration(
              //                   // color: Colors.blueGrey.withOpacity(0.3),
              //                   border: Border.all(
              //                       width: 1, color: Color(0xffF1BC5E)),
              //                   // borderRadius: BorderRadius.circular(5.0),
              //                 ),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     ))
            ],
          ),
        ),
      ],
    );
  }
}
