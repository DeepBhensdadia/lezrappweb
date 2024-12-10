import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/add_bussiness.dart';
import 'package:badges/badges.dart' as badges;
import 'package:loader_overlay/loader_overlay.dart';
import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api_model/getallcomapnys.dart';
import '../../screens/splash_screen.dart';
import '../../sharedpref.dart';

class selectBusiness_screen extends StatefulWidget {
  const selectBusiness_screen({Key? key}) : super(key: key);

  @override
  State<selectBusiness_screen> createState() => _selectBusiness_screenState();
}

class _selectBusiness_screenState extends State<selectBusiness_screen> {
  bool show = false;
  late Getcompanys getcompany;
  getallcompanyowner() {
    getallcompany().then((value) {
      setState(() {
        show = true;
      });
      getcompany = value;
      if (value.companies!.isNotEmpty)
        value.companies?.forEach((element) {
          if (element.companyId == saveuser()!.company.companyId) {
            gen = element;
          }
        });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    getallcompanyowner();
    // TODO: implement initState
    super.initState();
  }

  Company? gen;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEEEEEE),
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              height: 60,
              color: custom,
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
                        'Select Business'.tr,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          Get.context!.loaderOverlay.show();
                          await getsetcompany(gen!.companyId.toString())
                              .then((value) async {
                            Get.delete();
                            await SharedPref.deleteAll();
                            print(saveuser());

                            await SharedPref.save(
                                value: jsonEncode(value.toJson()),
                                prefKey: PrefKey.saveuser);
                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                Get.offAll(SplashScreen());
                                Get.context!.loaderOverlay.hide();
                              },
                            );

                            print(value.toString());
                          }).onError((error, stackTrace) {
                            print("....$error");
                          });
                        },
                        child: const Text(
                          "Select",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffF1BC5E),
            onPressed: () {
              Get.to(add_Business());
            },
            child: const Icon(Icons.add, color: Colors.black, size: 30),
          ),
          body: show == true
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.white,
                      child: RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        tileColor: Colors.white,
                        visualDensity: VisualDensity.compact,
                        activeColor: custom,
                        contentPadding: EdgeInsets.zero,
                        value: getcompany.companies![index],
                        groupValue: gen,
                        title: Container(
                          child: Row(
                            children: [
                              Container(
                                // color: custom,
                                width: screenwidth(context, dividedby: 1.7),
                                child: Text(
                                    "${getcompany.companies![index].companyName.toString()}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: custom,
                                        fontWeight: FontWeight.w600)),
                              ),
                              // SizedBox(width: 5,),
                              getcompany.companies![index].isPrimaryAccount ==
                                      "1"
                                  ? badges.Badge(
                                      badgeContent: const Text('Primary',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      badgeStyle: badges.BadgeStyle(
                                        shape: badges.BadgeShape.square,
                                        badgeColor: Colors.red,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        borderRadius: BorderRadius.circular(4),
                                      ))
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        onChanged: (value) {
                          print(value.toString());
                          setState(() {
                            gen = value;
                          });
                        },
                      ),
                    );
                  },
                  itemCount: getcompany.companies!.length,
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: custom,
                ))
          // Column(
          //   children: [
          //     Container(
          //       color: Colors.white,
          //       child: Padding(
          //         padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          //         child: Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Text('SUBASH SALES AND SUPPLY',style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
          //                    SizedBox(width: 10,),
          //                     badges.Badge(
          //                         badgeContent: const Text('Primary',
          //                             style: TextStyle(
          //                                 fontSize: 12,
          //                                 color: Colors.white,
          //                                 fontWeight: FontWeight.w600)),
          //                         badgeStyle: badges.BadgeStyle(
          //                           shape: badges.BadgeShape.square,
          //                           badgeColor: Colors.red,
          //                           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          //                           borderRadius: BorderRadius.circular(4),
          //                         )),
          //                   ],
          //                 ),
          //                 Radio(
          //                   activeColor: custom,
          //                   value: "B1",
          //                   groupValue: gen,
          //                   onChanged: (value) {
          //                     setState(() {
          //                       gen = value!;
          //                     });
          //                   },
          //                 ),
          //               ],
          //             ),
          //             Divider(color: Colors.grey,height: 0,)
          //           ],
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.white,
          //       child: Padding(
          //         padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          //         child: Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text('R.S Engineering Works',style: TextStyle(fontFamily: 'SF Pro Display',color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
          //                 Radio(
          //                   activeColor:custom,
          //                   value: "B2",
          //                   groupValue: gen,
          //                   onChanged: (value) {
          //                     setState(() {
          //                       gen = value!;
          //                     });
          //                   },
          //                 ),
          //               ],
          //             ),
          //             Divider(color: Colors.grey,height: 0,)
          //           ],
          //         ),
          //       ),
          //     ),
          //     // Container(
          //     //   height: 200,
          //     //   child: Center(
          //     //     child: Stack(
          //     //       children: [
          //     //         Image(
          //     //             height: 200,
          //     //             width: 200,
          //     //             image: AssetImage('assets/user_profile/notfound.jpeg')),
          //     //         Padding(
          //     //           padding: const EdgeInsets.fromLTRB(60, 150, 0, 0),
          //     //           child: Container(
          //     //             color: Colors.white,
          //     //             height: 40,
          //     //             width: 100,
          //     //           ),
          //     //         ),
          //     //       ],
          //     //     ),
          //     //   ),
          //     // ),
          //     // Text(
          //     //   'No Result Found',
          //     //   style: GoogleFonts.comfortaa(
          //     //       color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20),
          //     // ),
          //   ],
          // ),
          ),
    );
  }
}
