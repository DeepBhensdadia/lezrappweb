import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/add_staff.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../Const.dart';
import '../api/const_apis.dart';
import '../api_model/getcomapnystaff.dart';
import '../getx controller/staff/staffcontroller.dart';
import '../mybusiness_screens/customer/customer_info.dart';

class manage_staff extends StatefulWidget {
  const manage_staff({Key? key}) : super(key: key);

  @override
  State<manage_staff> createState() => _manage_staffState();
}

class _manage_staffState extends State<manage_staff> {
  Staffcontroller _staffcontroller = Get.put(Staffcontroller());

  @override
  void initState() {
    _staffcontroller.staff.clear();
    _staffcontroller.getsataffusers();
    // TODO: implement initState
    super.initState();
  }

  TextEditingController cpcha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffF1BC5E),
            onPressed: () {
              Get.to(
                add_staff(),
              );
            },
            child: const Icon(Icons.add, color: Colors.black, size: 30),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Staff List'.tr,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: GetBuilder<Staffcontroller>(
            builder: (controller) {
              return controller.staff.isNotEmpty
                  ? ListView.builder(
                    itemCount: controller.staff.length,
                    itemBuilder: (context, index) {
                      var staff = controller.staff[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            children: [
                              staff.image.isEmpty
                                  ? CircleAvatar(
                                      child: Center(
                                          child: Text(
                                        staff.userName2,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      radius: 23,
                                      backgroundColor: yellowcustomer,
                                    )
                                  : CircleAvatar(
                                      backgroundColor: yellowcustomer,
                                      backgroundImage:
                                          NetworkImage(staff.image),
                                      radius: 23,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Container(
                                  width:
                                      screenwidth(context, dividedby: 1.21),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            staff.userName,
                                            // maxLines: 3,
                                            style: TextStyle(
                                                fontFamily:
                                                    'SF Pro Display',
                                                color: Color(0xFF2C4475),
                                                fontSize: 18,
                                                fontWeight:
                                                    FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            staff.mobileNo,
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            staff.lastLogin,
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      PopupMenuButton(
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            padding: EdgeInsets.all(0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                Get.to(add_staff(
                                                    staffdetails: staff));
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 40,
                                                child: Center(
                                                  child: Text(
                                                    "Edit".tr,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight
                                                                .w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            padding: EdgeInsets.all(0),
                                            child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Dialog(
                                                      child: Container(
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                            Container(
                                                              color: Colors
                                                                  .red,
                                                              height: 80,
                                                              child: Center(
                                                                  child:
                                                                      Icon(
                                                                Icons
                                                                    .warning_amber,
                                                                size: 50,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(top:
                                                                      15.0),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    overflow:
                                                                        TextOverflow.ellipsis,
                                                                    "Important!!",
                                                                    // maxLines: 3,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        color: Color(
                                                                            0xFF2C4475),
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(8.0),
                                                                    child:
                                                                        Text(
                                                                      textAlign:
                                                                          TextAlign.center,
                                                                      "Note: While removing a Staff Device permanently you must delete his/her profile from the Staff list.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color:
                                                                            Colors.black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: TextButton(

                                                                    child: Text(
                                                                        "CANCEL"
                                                                            .tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: custom)),

                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: TextButton(

                                                                    child: Text(
                                                                        "Confirm"
                                                                            .tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: custom)),

                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                          showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              cpcha.clear();
                                                                              String cach = generateCaptchaCode(4);
                                                                              return s_code(
                                                                                capchacode: cach,
                                                                                controll: cpcha,
                                                                                onconfirm:
                                                                                    () async {

                                                                                  if (cach ==
                                                                                      cpcha
                                                                                          .text) {
                                                                                    context.loaderOverlay.show();
                                                                                    await delete_staff(
                                                                                            companyuserid: staff
                                                                                                .companyUserId)
                                                                                        .then(
                                                                                            (value) {
                                                                                      // Fluttertoast.showToast(msg: value.message);
                                                                                      _staffcontroller
                                                                                          .staff
                                                                                          .clear();
                                                                                      _staffcontroller
                                                                                          .getsataffusers2();
                                                                                      context.loaderOverlay.hide();
                                                                                    }).onError((error,
                                                                                            stackTrace) {
                                                                                      context.loaderOverlay.hide();
                                                                                      print(
                                                                                          error);
                                                                                    });
                                                                                  } else {
                                                                                    Fluttertoast
                                                                                        .showToast(
                                                                                            msg:
                                                                                                "Security code doesn't match!!");
                                                                                  }
                                                                                },
                                                                              );
                                                                            },
                                                                          );
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ])),
                                                    );
                                                  },
                                                );

                                              },
                                              child: Container(
                                                width: 100,
                                                height: 40,
                                                child: Center(
                                                  child: Text(
                                                    "Delete".tr,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight
                                                                .w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                  : circulerprogress();
            },
          )),
    );
  }
}
