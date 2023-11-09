import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/selectbusiness_screen.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/set_currency.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/set_pin.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/subscriptions_screens.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/usermanual.dart';
import 'package:lezrapp/screens/splash_screen.dart';
import 'package:lezrapp/sharedpref.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../Const.dart';
import '../../Icons_row/manage_staff.dart';
import '../../Icons_row/photo.dart';
import '../../api/const_apis.dart';
import '../../api_model/getallexpensesbackup.dart';
import '../../api_model/getalltransactionbackup.dart';
import '../../api_model/login/staff_login_model.dart';
import '../../controller.dart';
import '../../getx controller/summarycontroller.dart';
import '../../login/loginas_screen.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';
import '../../scanner/appinfo_screens.dart';
import '../../scanner/page1.dart';
import '../../Dashboard/editbusiness_screen.dart';
import 'change_language.dart';
import '../../pdf/backuptransactionexpenses.dart';
import 'legalpolicy.dart';

class setting_screen extends StatefulWidget {
  setting_screen({Key? key}) : super(key: key);

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  Controller c = Get.put(Controller());
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  String? pincode = SharedPref.get(prefKey: PrefKey.setpin) != null
      ? SharedPref.get(prefKey: PrefKey.setpin)
      : null;
  List<Transaction> transactionbackup = [];
  List<Expense> expensesbackup = [];
  backup() async {
    context.loaderOverlay.show();
    await getalltransactionbackup().then((value) async {
      transactionbackup = value.transactions!;
      log(value.toString());
      await getallexpensesbackup().then((value) {
        expensesbackup = value.expenses!;
        final invoice = transactionInvoice(
          supplier: Supplier2(
            name: saveuser()?.company.companyName,
            address: saveuser()?.company.companyAddress,
            type: " Transaction Report",
            paymentInfo: 'https://paypal.me/sarahfieldzz',
          ),
          items: List.generate(
            transactionbackup.length,
            (index) => transactionInvoiceItem(
              srno_: "${index + 1}",
              Date: transactionbackup[index].transactionDateFormatted!,
              User: transactionbackup[index].userName == ""
                  ? saveuser()?.company.companyName
                  : transactionbackup[index].userName,
              remark: transactionbackup[index].remark!,
              customer: transactionbackup[index].customerName!,
              credit: transactionbackup[index].transactionType == "Due"
                  ? ""
                  : transactionbackup[index].amount.toString(),
              debit: transactionbackup[index].transactionType == "Paid"
                  ? ""
                  : transactionbackup[index].amount.toString(),
              blance: transactionbackup[index].totalAmount.toString(),
            ),
          ).toList(),
          // .sublist(
          // 0,
          // transactionbackup.length > 400
          //     ? 400
          //     : transactionbackup.length),
        );
        final invoiceorder = orderexpenseInvoice(
          supplier: Supplier2(
            name: saveuser()!.company.companyName,
            address: saveuser()!.company.companyAddress,
            type: " Expense Report",
            paymentInfo: 'https://paypal.me/sarahfieldzz',
          ),
          items: List.generate(
            expensesbackup.length,
            (index) => orderexpenseInvoiceItem(
              srno_: "${index + 1}",
              Date: expensesbackup[index].dateFormatted!,
              User: expensesbackup[index].userName == ""
                  ? saveuser()!.company.companyName
                  : expensesbackup[index].userName,
              remark: expensesbackup[index].remark!,
              type: expensesbackup[index].expenseTitle!,
              amount: expensesbackup[index].amount!,
            ),
          ),
        );
        backuptransactionpdfprint.backuptransactiongenerat(
            invoice, invoiceorder);
        log(value.toString());
        context.loaderOverlay.hide();
      }).onError((error, stackTrace) {
        print("error...$error");
        context.loaderOverlay.hide();
      });
    }).onError((error, stackTrace) {
      print("error...$error");
      context.loaderOverlay.hide();
    });
    print("jhdvsdghkjvduchmsvdbjhdv,bdujhd");
  }

  @override
  void initState() {
    pincode != null ? c.state.value = true : c.state.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff294472),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
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
                      'Settings'.tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ), //
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.to(editbusiness_screen());
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: _summarycontroller.staff.isTrue
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                              width: 40,
                              height: 40,
                              fit: BoxFit.fill,
                              image: NetworkImage(saveuser()?.user.image)),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                              width: 40,
                              height: 40,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  saveuser()?.company.companyPhoto)),
                        ),
                  title: Text(
                    _summarycontroller.staff.isTrue
                        ? saveuser()?.user.userName
                        : saveuser()?.company.companyName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    _summarycontroller.staff.isTrue
                        ? saveuser()?.user.mobileNo
                        : saveuser()?.company.companyMobileNo,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                _summarycontroller.staff.isTrue
                    ? SizedBox()
                    : settings(
                        ontap: () {
                          Get.to(
                            selectBusiness_screen(),
                          );
                        },
                        yes: false,
                        image: "assets/settings/add_business@2x.png",
                        setting: "Add Business".tr),
                // _summarycontroller.staff.isTrue
                //     ? SizedBox()
                //     : settings1(
                //         ontap: () {},
                //         yes: true,
                //         image: "assets/settings/security@2x.png",
                //         setting: "Set PIN".tr,
                //         child: Obx(
                //           () => Switch(
                //             activeColor: custom,
                //             inactiveThumbColor: custom,
                //             activeTrackColor:
                //                 Colors.blueAccent.withOpacity(0.5),
                //             materialTapTargetSize:
                //                 MaterialTapTargetSize.shrinkWrap,
                //             value: c.state.value,
                //             onChanged: (value) {
                //               c.state.value = value;
                //               if (c.state.value == true) {
                //                 showDialog(
                //                   context: context,
                //                   builder: (context) {
                //                     return AlertDialog(
                //                       contentPadding: EdgeInsets.all(20),
                //                       content: Container(
                //                         height: 150,
                //                         child: Column(
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Text(
                //                                   'Change PIN?',
                //                                   style: TextStyle(
                //                                       fontFamily:
                //                                           'SF Pro Display',
                //                                       fontWeight:
                //                                           FontWeight.bold,
                //                                       fontSize: 20),
                //                                 ),
                //                               ],
                //                             ),
                //                             Padding(
                //                               padding:
                //                                   const EdgeInsets.fromLTRB(
                //                                       0, 10, 50, 16),
                //                               child: Text(
                //                                   'Do you want to update\nPIN?'),
                //                             ),
                //                             Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.end,
                //                               children: [
                //                                 TextButton(
                //                                   onPressed: () {
                //                                     Navigator.pop(context);
                //
                //                                     c.state.value = false;
                //                                   },
                //                                   child: Text(
                //                                     'NO',
                //                                     style: TextStyle(
                //                                         fontFamily:
                //                                             'SF Pro Display',
                //                                         fontWeight:
                //                                             FontWeight.w600,
                //                                         color:
                //                                             Color(0xff294472),
                //                                         fontSize: 17),
                //                                   ),
                //                                 ),
                //                                 TextButton(
                //                                   onPressed: () {
                //                                     setState(() {
                //                                       c.state.value = false;
                //                                     });
                //                                     Navigator.pop(context);
                //                                     Get.to(
                //                                       set_pin(),
                //                                     );
                //                                   },
                //                                   child: Text(
                //                                     'YES',
                //                                     style: TextStyle(
                //                                         fontFamily:
                //                                             'SF Pro Display',
                //                                         fontWeight:
                //                                             FontWeight.w600,
                //                                         color:
                //                                             Color(0xff294472),
                //                                         fontSize: 17),
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     );
                //                   },
                //                 );
                //               } else {
                //                 c.state.value = false;
                //                 SharedPref.deleteSpecific(
                //                     prefKey: PrefKey.setpin);
                //               }
                //             },
                //           ),
                //         )),
                // _summarycontroller.staff.isTrue
                //     ? SizedBox()
                //     : settings1(
                //         ontap: () {},
                //         yes: true,
                //         image: "assets/settings/remainder@2x.png",
                //         setting: "Reminder".tr,
                //         child: Obx(() => Switch(
                //               activeColor: custom,
                //               inactiveThumbColor: custom,
                //               activeTrackColor:
                //                   Colors.blueAccent.withOpacity(0.5),
                //               materialTapTargetSize:
                //                   MaterialTapTargetSize.shrinkWrap,
                //               onChanged: (value) {
                //                 _summarycontroller.get_changesetting(
                //                     value.toString(),
                //                     value.toString(),
                //                     c.state.value.toString(),
                //                     c.enable.value.toString());
                //                 c.reminder.value = value;
                //                 SLogin saveuser = sLoginFromJson(
                //                     SharedPref.get(prefKey: PrefKey.saveuser)!);
                //                 if (saveuser.company != null) {
                //                   Company updatedCompany = saveuser.company!
                //                       .copyWith(
                //                       allowNotification: value == true ? "1" : "0");
                //                   saveuser =
                //                       saveuser.copyWith(company: updatedCompany);
                //                 }
                //                 SharedPref.save(
                //                   value: sLoginToJson(saveuser),
                //                   prefKey: PrefKey.saveuser,
                //                 );
                //               },
                //               value: c.reminder.value,
                //             ))),
                // _summarycontroller.staff.isTrue
                //     ? SizedBox()
                //     : settings1(
                //         ontap: () {},
                //         yes: true,
                //         image: "assets/img/2.png",
                //         setting: "Enable Privacy".tr,
                //         child: Obx(() => Switch(
                //             activeColor: custom,
                //             inactiveThumbColor: custom,
                //             activeTrackColor:
                //                 Colors.blueAccent.withOpacity(0.5),
                //             materialTapTargetSize:
                //                 MaterialTapTargetSize.shrinkWrap,
                //             value: c.enable.value,
                //             onChanged: (value) {
                //               _summarycontroller.get_changesetting(
                //                   c.reminder.value.toString(),
                //                   c.reminder.value.toString(),
                //                   c.state.value.toString(),
                //                   value.toString());
                //               c.enable.value = value;
                //               SLogin saveuser = sLoginFromJson(
                //                   SharedPref.get(prefKey: PrefKey.saveuser)!);
                //               if (saveuser.company != null) {
                //                 Company updatedCompany = saveuser.company!
                //                     .copyWith(
                //                         isPrivacy: value == true ? "1" : "0");
                //                 saveuser =
                //                     saveuser.copyWith(company: updatedCompany);
                //               }
                //               SharedPref.save(
                //                 value: sLoginToJson(saveuser),
                //                 prefKey: PrefKey.saveuser,
                //               );
                //             }))),
                _summarycontroller.staff.isTrue
                    ? SizedBox()
                    : settings(
                        ontap: () {
                          Get.to(
                            manage_staff(),
                          );
                        },
                        yes: false,
                        image: "assets/new/m/manage-staff.png",
                        setting: "ManageStaff".tr),
                _summarycontroller.staff.isTrue
                    ? SizedBox()
                    : saveuser()?.company.isPrimaryAccount != "1"
                        ? SizedBox()
                        : settings(
                            ontap: () {
                              Get.to(
                                subscriptions_screens(),
                              );
                            },
                            yes: false,
                            image: "assets/settings/sub.png",
                            setting: "Subscription".tr),
                // settings(
                //     ontap: () {
                //       Get.to(
                //         SocketExample(),
                //       );
                //     },
                //     yes: false,
                //     image: "assets/gif/LezrApp Web.png",
                //     setting: "LezrAppWeb".tr),
                settings(
                    ontap: () {
                      Get.to(LegalPolicyScreen());
                    },
                    yes: false,
                    image: "assets/settings/legal@2x.png",
                    setting: "Legal Policy".tr),
                settings(
                    ontap: () {
                      Get.to(UserManualScreen());
                    },
                    yes: false,
                    image: "assets/settings/user manual@2x.png",
                    setting: "User Manual".tr),
                settings(
                    ontap: () {
                      Get.to(
                        appinfo(),
                      );
                    },
                    yes: false,
                    image: "assets/settings/info@2x.png",
                    setting: "App Info".tr),
                settings(
                    ontap: () {
                      Get.to(
                        change_language(),
                      );
                    },
                    yes: false,
                    image: "assets/img/1.png",
                    setting: "Change Language".tr),
                settings(
                    ontap: () {
                      Get.to(
                        set_Currency(),
                      );
                    },
                    yes: false,
                    image: "assets/settings/Currency Exchange Icons.png",
                    setting: "Set Currency".tr),
                // settings(
                //     ontap: () {
                //       backup();
                //     },
                //     yes: false,
                //     image: "assets/settings/backup.png",
                //     setting: "Download Backup".tr),
                // settings(
                //     ontap: () async {
                //       Get.delete();
                //       await SharedPref.deleteAll();
                //       Get.offAll(
                //         loginas_screen(),
                //       );
                //     },
                //     yes: false,
                //     image: "assets/settings/logout.png",
                //     setting: "Log Out".tr),


                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class settings extends StatefulWidget {
  settings(
      {Key? key,
      required this.image,
      required this.ontap,
      required this.setting,
      required this.yes,
      this.child})
      : super(key: key);

  final String image;
  final String setting;
  final bool yes;
  final void Function() ontap;
  final Widget? child;

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.ontap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      width: 28,
                      height: 28,
                      image: AssetImage(widget.image),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.setting,
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: widget.child,
                )
              ],
            ),
          ),
        ),
        div()
      ],
    );
  }
}

class settings1 extends StatefulWidget {
  settings1(
      {Key? key,
      required this.image,
      required this.ontap,
      required this.setting,
      required this.yes,
      this.child})
      : super(key: key);

  final String image;
  final String setting;
  final bool yes;
  final void Function() ontap;
  final Widget? child;

  @override
  State<settings1> createState() => _settings1State();
}

class _settings1State extends State<settings1> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.ontap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      width: 28,
                      height: 28,
                      image: AssetImage(widget.image),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.setting,
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: widget.child,
                )
              ],
            ),
          ),
        ),
        div()
      ],
    );
  }
}
