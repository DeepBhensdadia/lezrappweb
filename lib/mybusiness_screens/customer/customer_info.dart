import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Dashboard/addcustomer.dart';
import 'package:lezrapp/Dashboard/addtransaction.dart';
import 'package:lezrapp/getx%20controller/summarycontroller.dart';
import 'package:lezrapp/helper.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Const.dart';
import '../../Icons_row/reports_screen.dart';
import '../../api/const_apis.dart';
import '../../api/pdf_api.dart';
import '../../api/pdf_invoice_api.dart';
import '../../api_model/customers/get_customer_info.dart';
import '../../api_model/customers/get_customers_api.dart';
import '../../api_model/transaction/get_transaction.dart';
import '../../getx controller/transactioncontrollers/customercontroller.dart';
import '../../getx controller/transactioncontrollers/transactioncontroller.dart';
import '../../mainscreen.dart';
import '../../model/bank.dart';
import '../../model/customer.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';
import '../../screens/Transactions/details.dart';
import '../../screens/bottomsheet.dart';
import '../suppliers/supplier_info.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;

class customer_info extends StatefulWidget {
  const customer_info({
    Key? key,
    required this.about,
  }) : super(key: key);

  final Customer about;

  @override
  State<customer_info> createState() => _customer_infoState();
}

class _customer_infoState extends State<customer_info> {
  Customertransactioncontroller customtransaction =
      Get.put(Customertransactioncontroller());

  // late GetAllCinfo information;
  // bool show = false;
  // gettransaction() async {
  //
  //   await get_transactioncustomer(widget.about.customerId,"&from_date=2022-06-01&to_date=2023-06-01").then((value) {
  //     transaction = value;
  //     setState(() {
  //       show = true;
  //     });
  //     Fluttertoast.showToast(msg: value.message);
  //   }).onError((error, stackTrace) {
  //     print(error);
  //   });

  // }
  final scrollcontroller = ScrollController();
  @override
  void initState() {
    customtransaction.transaction.clear();
    customtransaction.transactionnotdeleted.clear();
    customtransaction.page = 0;
    customtransaction.finish = false;
    customtransaction.to_date = "";
    customtransaction.from_date = "";

    customtransaction.gettransaction(widget.about.customerId);
    scrollcontroller.addListener(_scrolllisten);
    // TODO: implement initState
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        customtransaction.page += 10;
      });
      print(customtransaction.page);
      if (customtransaction.finish == false)
        customtransaction.gettransaction(widget.about.customerId);
    } else {
      print(customtransaction.page);
    }
  }

  TextEditingController cpcha = TextEditingController();
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<Customertransactioncontroller>(builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xffEEEEEE),
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            toolbarHeight: screenheight(context, dividedby: 14),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: Text(
              customtransaction.show.isTrue
                  ? customtransaction.information.customers.first.customerName
                  : widget.about.customerName,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  letterSpacing: 0.2,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  bottomsheetfilter(
                    context,
                    () {
                      Get.back();
                      datedialogbox(
                          context,
                          (value) {
                            customtransaction.from_date = value;
                          },
                          (val) => customtransaction.to_date = val,
                          () {
                            customtransaction.transaction.clear();
                            customtransaction
                                .gettransaction(widget.about.customerId);
                            Get.back();
                          });
                    },
                    () {
                      Get.back();
                      customtransaction.from_date = "";
                      customtransaction.to_date = "";
                      customtransaction.transaction.clear();
                      print(customtransaction.from_date);
                      print(customtransaction.to_date);
                      customtransaction.gettransaction(widget.about.customerId);
                    },
                  );
                },
                icon: const Icon(
                  size: 25,
                  Icons.filter_list_alt,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final date = DateTime.now();
                  final dueDate = date.add(
                    Duration(days: 7),
                  );
                  final invoice = Invoice(
                    //fooler
                    supplier: Supplier(
                      name: saveuser()?.company.companyName,
                      address: saveuser()?.company.companyAddress,
                      paymentInfo: 'https://paypal.me/sarahfieldzz',
                    ),
                    info: InvoiceInfo(
                      date: date,
                      dueDate: dueDate,
                      description: 'My description...',
                      number: '${DateTime.now().year}-9999',
                    ),
                    //tabel
                    items: List.generate(
                      customtransaction.transactionnotdeleted.length,
                      (index) => InvoiceItem(
                          srno_: "${index + 1}",
                          tra_date: DateTime.parse(customtransaction
                              .transactionnotdeleted[index].transactionDate),
                          particular: customtransaction
                              .transactionnotdeleted[index].remark,
                          credit: customtransaction.transactionnotdeleted[index]
                                      .transactionType ==
                                  "Due"
                              ? ""
                              : customtransaction
                                  .transactionnotdeleted[index].amount
                                  .toString(),
                          debit: customtransaction.transactionnotdeleted[index]
                                      .transactionType ==
                                  "Paid"
                              ? ""
                              : customtransaction
                                  .transactionnotdeleted[index].amount
                                  .toString(),
                          totalblance: customtransaction
                              .transactionnotdeleted[index].totalAmount
                              .toString()),
                    ).toList(),
                    //uptot
                    customer: C_calls(
                        name: widget.about.customerName,
                        mobail: widget.about.customerMobileNo),
                    details: Bank(
                        AC_number: saveuser()?.company.acNo,
                        ifsc_code: saveuser()?.company.ifscCode,
                        bank_name: saveuser()?.company.bankName),
                  );

                  final pdfFile = await PdfInvoiceApi.filesharegenerate(
                      invoice, widget.about.totalAmount.toString());
                  //final font = await GoogleFonts.nunitoExtraLight();
                  // PdfApi.openFile(pdfFile);
                },
                icon: const Icon(
                  size: 25,
                  Icons.share_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              controller: scrollcontroller,
              child: Column(
                children: [
                  Container(
                    //height: screenheight(context, dividedby: 3.3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.about.customerPhoto.isNotEmpty
                                  ? CircleAvatar(
                                      backgroundColor: yellowcustomer,
                                      backgroundImage: NetworkImage(
                                          customtransaction.show.isTrue
                                              ? customtransaction.information
                                                  .customers.first.customerPhoto
                                              : widget.about.customerPhoto),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Color(0xffF1BC5E),
                                      child: Center(
                                        child: Text(
                                          customtransaction.show.isTrue
                                              ? customtransaction.information
                                                  .customers.first.customerName2
                                              : widget.about.customerName2,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 23,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: screenwidth(context, dividedby: 1.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      customtransaction.show.isTrue
                                          ? customtransaction.information
                                              .customers.first.customerName
                                          : widget.about.customerName,
                                      // maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    widget.about.customerMobileNo.isNotEmpty
                                        ? Text(
                                            overflow: TextOverflow.ellipsis,
                                            customtransaction.show.isTrue
                                                ? customtransaction
                                                    .information
                                                    .customers
                                                    .first
                                                    .customerMobileNo
                                                : widget.about.customerMobileNo,
                                            // maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    widget.about.customerEmail.isNotEmpty
                                        ? Text(
                                            overflow: TextOverflow.ellipsis,
                                            customtransaction.show.isTrue
                                                ? customtransaction
                                                    .information
                                                    .customers
                                                    .first
                                                    .customerEmail
                                                : widget.about.customerEmail,
                                            // maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500),
                                          )
                                        : SizedBox(),
                                    SizedBox(height: 5),
                                    widget.about.customerAddress.isNotEmpty
                                        ? Text(
                                            overflow: TextOverflow.ellipsis,
                                            customtransaction.show.isTrue
                                                ? customtransaction
                                                    .information
                                                    .customers
                                                    .first
                                                    .customerAddress
                                                : widget.about.customerAddress,
                                            // maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w600),
                                          )
                                        : SizedBox(),
                                    // SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                info(
                                  icon: Icons.call,
                                  name: 'Call'.tr,
                                  onPressed: () {
                                    launch(
                                        "tel:${widget.about.customerMobileNo}");
                                  },
                                ),
                                info(
                                  icon: Icons.file_upload_outlined,
                                  name: 'Export'.tr,
                                  onPressed: () async {
                                    final date = DateTime.now();
                                    final dueDate = date.add(
                                      Duration(days: 7),
                                    );
                                    final invoice = Invoice(
                                      //fooler
                                      supplier: Supplier(
                                        name: saveuser()?.company.companyName,
                                        address:
                                            saveuser()?.company.companyAddress,
                                        paymentInfo:
                                            'https://paypal.me/sarahfieldzz',
                                      ),
                                      info: InvoiceInfo(
                                        date: date,
                                        dueDate: dueDate,
                                        description: 'My description...',
                                        number: '${DateTime.now().year}-9999',
                                      ),
                                      //tabel
                                      items: List.generate(
                                        customtransaction
                                            .transactionnotdeleted.length,
                                        (index) => InvoiceItem(
                                            srno_: "${index + 1}",
                                            tra_date: DateTime.parse(customtransaction
                                                .transactionnotdeleted[index]
                                                .transactionDate),
                                            particular: customtransaction
                                                .transactionnotdeleted[index]
                                                .remark,
                                            credit:
                                                customtransaction.transactionnotdeleted[index].transactionType == "Due"
                                                    ? ""
                                                    : customtransaction
                                                        .transactionnotdeleted[
                                                            index]
                                                        .amount
                                                        .toString(),
                                            debit: customtransaction
                                                        .transactionnotdeleted[
                                                            index]
                                                        .transactionType ==
                                                    "Paid"
                                                ? ""
                                                : customtransaction.transactionnotdeleted[index].amount
                                                    .toString(),
                                            totalblance: customtransaction
                                                .transactionnotdeleted[index]
                                                .totalAmount
                                                .toString()),
                                      ).toList(),
                                      //uptot
                                      customer: C_calls(
                                          name: widget.about.customerName,
                                          mobail:
                                              widget.about.customerMobileNo),
                                      details: Bank(
                                          AC_number: saveuser()?.company.acNo,
                                          ifsc_code:
                                              saveuser()?.company.ifscCode,
                                          bank_name:
                                              saveuser()?.company.bankName),
                                    );

                                    final pdfFile =
                                        await PdfInvoiceApi.generate(
                                            invoice,
                                            widget.about.totalAmount
                                                .toString());
                                    //final font = await GoogleFonts.nunitoExtraLight();
                                    PdfApi.openFile(pdfFile);
                                  },
                                ),
                                info(
                                  icon: Icons.av_timer_outlined,
                                  name: 'Reminder'.tr,
                                  onPressed: () {
                                    if (customtransaction.information.customers
                                            .first.transactionType ==
                                        "Due") {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            color: Colors.white,
                                            // height: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Send Payment Remider',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: 35,
                                                          width: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff294472),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                blurRadius: 3,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Center(
                                                            child: Image(
                                                              height: 19,
                                                              width: 19,
                                                              image: AssetImage(
                                                                  'assets/user_profile/i.jpeg'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.grey,
                                                  thickness: 1,
                                                  endIndent: 20,
                                                  indent: 20,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context
                                                                .loaderOverlay
                                                                .show();
                                                            Map<String, dynamic>
                                                                parameter = {
                                                              "mobileno": widget
                                                                  .about
                                                                  .customerMobileNo,
                                                              "customer_id":
                                                                  widget.about
                                                                      .customerId,
                                                              "sms_type":
                                                                  "reminder",
                                                              "user_id": widget
                                                                  .about.userId,
                                                              "company_id":
                                                                  widget.about
                                                                      .companyId,
                                                              "ft_set_reminder_type":
                                                                  "true",
                                                              "textMsg": "Namaste " +
                                                                  widget.about
                                                                      .customerName +
                                                                  ", thank you for your payment of Rs " +
                                                                  customtransaction
                                                                      .information
                                                                      .customers
                                                                      .first
                                                                      .totalAmount
                                                                      .toString() +
                                                                  " at " +
                                                                  saveuser()
                                                                      ?.company
                                                                      .companyName +
                                                                  ".View transaction details at http://web.lezrapp.com/lezr/welcome/account?q=ODgy - LezrApp",
                                                              "reminder_type":
                                                                  "sms"
                                                            };
                                                            await sendsmsremider(
                                                                    parameter:
                                                                        parameter)
                                                                .then((value) {
                                                              Get.back();
                                                              context
                                                                  .loaderOverlay
                                                                  .hide();

                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg: value
                                                                          .message);
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              context
                                                                  .loaderOverlay
                                                                  .hide();
                                                              print(error);
                                                            });
                                                          },
                                                          child: Column(
                                                            // mainAxisAlignment: MainAxisAlignment.,
                                                            children: [
                                                              Image(
                                                                  height: 50,
                                                                  width: 50,
                                                                  image: AssetImage(
                                                                      'assets/icon/txtsms.png')),
                                                              SizedBox(
                                                                height:
                                                                    screenheight(
                                                                        context,
                                                                        dividedby:
                                                                            200),
                                                              ),
                                                              Text(
                                                                'SMS',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _summarycontroller
                                                                .sendwatsappremider(
                                                                    "true",
                                                                    widget.about
                                                                        .customerId,
                                                                    widget.about
                                                                        .customerMobileNo);
                                                          },
                                                          child: Column(
                                                            // mainAxisAlignment: MainAxisAlignment.,
                                                            children: [
                                                              Image(
                                                                height: 50,
                                                                width: 50,
                                                                image: AssetImage(
                                                                    'assets/icon/whatsapp.png'),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    screenheight(
                                                                        context,
                                                                        dividedby:
                                                                            200),
                                                              ),
                                                              Text(
                                                                'Whatsapp',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "No due amount");
                                    }
                                  },
                                ),
                                info(
                                  icon: Icons.edit,
                                  name: 'Edit'.tr,
                                  onPressed: () {
                                    Get.to(Addcustomer(about: widget.about));
                                  },
                                ),
                                info(
                                  icon: Icons.delete,
                                  name: 'Delete'.tr,
                                  onPressed: () {
                                    // alertbox(
                                    //   context: context,
                                    //   titletext:
                                    //       widget.about.customerTypeId == "1"
                                    //           ? "Remove Customer"
                                    //           : "Remove Supplire",
                                    //   contain: widget.about.customerTypeId ==
                                    //           "1"
                                    //       ? 'Would you like to remove Customer?'
                                    //       : 'Would you like to remove Supplire?',
                                    //   confirmbutton: "Remove",
                                    //   ontap: () {
                                    //
                                    //   },
                                    // );
                                    String cach = generateCaptchaCode(4);
                                    // Get.back();
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          cpcha.clear();
                                          return s_code(
                                            controll: cpcha,
                                            capchacode: cach,
                                            onconfirm: () async {
                                              if (cach == cpcha.text) {
                                                context.loaderOverlay.show();
                                                Map<String, dynamic> para = {
                                                  "company_id":
                                                      widget.about.companyId,
                                                  "user_id":
                                                      widget.about.userId,
                                                  "customer_id":
                                                      widget.about.customerId
                                                };
                                                await deletecustomer(
                                                        parameter: para)
                                                    .then((value) {
                                                  context.loaderOverlay.hide();
                                                  Get.offAll(MainScreen());

                                                  Fluttertoast.showToast(
                                                      msg: value.message);
                                                }).onError((error, stackTrace) {
                                                  context.loaderOverlay.hide();
                                                  print(error);
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Security code doesn't match!!");
                                              }
                                            },
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Balance :'.tr,
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.grey.shade600,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  customtransaction.show.isTrue
                                      ? getformettedamount(
                                          text:
                                              '${customtransaction.information.customers.first.totalAmount} ${customtransaction.information.customers.first.transactionType}')
                                      : getformettedamount(
                                          text:
                                              '${widget.about.totalAmount} ${widget.about.transactionType}'),
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: customtransaction.show.isTrue
                                        ? customtransaction
                                                    .information
                                                    .customers
                                                    .first
                                                    .transactionType ==
                                                "Due"
                                            ? Colors.red
                                            : Colors.green
                                        : widget.about.transactionType == "Due"
                                            ? Colors.red
                                            : Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 00),
                          child: controller.transaction.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Transactions Not Found'.tr,
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          color: Color(0xff294472),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.to(
                                            AddTransaction(
                                                id: widget.about.customerId),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Color(0xffF1BC5E),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Transactions History',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: Color(0xff294472),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Get.to(
                                                AddTransaction(
                                                    id: widget
                                                        .about.customerId),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.add_circle,
                                              color: Color(0xffF1BC5E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      // controller: scrollcontroller,
                                      physics: ClampingScrollPhysics(),
                                      primary: false,
                                      itemCount: controller.transaction.length,
                                      itemBuilder: (context, index) {
                                        Transaction about =
                                            controller.transaction[index];
                                        return Slidable(
                                          enabled: about.isDelete == 0
                                              ? true
                                              : false,
                                          endActionPane: ActionPane(
                                            // extentRatio: 0.5,
                                            motion: const ScrollMotion(),
                                            children: [
                                              Visibility(
                                                visible: about.isDelete == 0
                                                    ? _summarycontroller
                                                            .staff.isTrue
                                                        ? about.companyUserId
                                                                    .toString() ==
                                                                saveuser()
                                                                    ?.user
                                                                    .companyUserId
                                                                    .toString()
                                                            ? true
                                                            : false
                                                        : true
                                                    : false,
                                                child: SlidableAction(
                                                  autoClose: true,
                                                  onPressed: (context) {
                                                    Get.to(
                                                      AddTransaction(
                                                          task: about),
                                                    );
                                                  },
                                                  backgroundColor:
                                                      const Color(0xFF2C4475),
                                                  foregroundColor: Colors.white,
                                                  // icon: Icons.archive,
                                                  label: 'Edit'.tr,
                                                ),
                                              ),
                                              Visibility(
                                                visible: about.isDelete == 0
                                                    ? _summarycontroller
                                                            .staff.isTrue
                                                        ? about.companyUserId
                                                                    .toString() ==
                                                                saveuser()
                                                                    ?.user
                                                                    .companyUserId
                                                                    .toString()
                                                            ? true
                                                            : false
                                                        : true
                                                    : false,
                                                child: SlidableAction(
                                                  autoClose: true,
                                                  onPressed: (context) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        cpcha.clear();

                                                        String cach =
                                                            generateCaptchaCode(
                                                                4);
                                                        return s_code(
                                                          capchacode: cach,
                                                          controll: cpcha,
                                                          onconfirm: () async {
                                                            if (cach ==
                                                                cpcha.text) {
                                                              context
                                                                  .loaderOverlay
                                                                  .show();
                                                              Get.back();

                                                              await delete_transaction(
                                                                      transactionid:
                                                                          about
                                                                              .transactionId)
                                                                  .then(
                                                                      (value) {
                                                                controller
                                                                    .page = 0;
                                                                controller
                                                                        .finish =
                                                                    false;
                                                                Fluttertoast
                                                                    .showToast(
                                                                        msg: value
                                                                            .message);
                                                                controller
                                                                    .transaction
                                                                    .clear();
                                                                controller
                                                                    .transactionnotdeleted
                                                                    .clear();
                                                                controller.gettransaction(
                                                                    widget.about
                                                                        .customerId);
                                                                context
                                                                    .loaderOverlay
                                                                    .hide();
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                context
                                                                    .loaderOverlay
                                                                    .hide();
                                                                // log(error.toString());
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
                                                  backgroundColor:
                                                      const Color(0xFFEB4359),
                                                  foregroundColor: Colors.white,
                                                  // icon: Icons.save,
                                                  label: 'Delete'.tr,
                                                ),
                                              ),
                                            ],
                                          ),
                                          child: Container(
                                            decoration: about.isDelete == 0
                                                ? about.transactionTracking
                                                            .length ==
                                                        2
                                                    ? BoxDecoration(
                                                        // border: Border(
                                                        //     left: BorderSide(
                                                        //         width: 10,
                                                        //         color: about.getColor())),
                                                        gradient:
                                                            LinearGradient(
                                                        begin: Alignment
                                                            .bottomRight,
                                                        end: Alignment.topLeft,
                                                        transform:
                                                            GradientRotation(
                                                                30 * pi / 180),
                                                        stops: [
                                                          0.0,
                                                          0.30,
                                                          0.6,
                                                          0.9,
                                                        ],
                                                        colors: [
                                                          yellowcustomer,
                                                          Colors.white,
                                                          Colors.white,
                                                          Colors.white,
                                                        ],
                                                      ))
                                                    : BoxDecoration(
                                                        // border: Border(
                                                        // left: BorderSide(
                                                        //     width: 10,
                                                        //     color: about.getColor()))
                                                        )
                                                : BoxDecoration(
                                                    // border: Border(
                                                    // left: BorderSide(
                                                    //     width: 10,
                                                    //     color: about.getColor())),
                                                    gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomRight,
                                                    end: Alignment.topLeft,
                                                    transform: GradientRotation(
                                                        30 * pi / 180),
                                                    stops: [
                                                      0.0,
                                                      0.30,
                                                      0.6,
                                                      0.9,
                                                    ],
                                                    colors: [
                                                      Colors.red,
                                                      Colors.white,
                                                      Colors.white,
                                                      Colors.white,
                                                    ],
                                                  )),
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(
                                                  details(about: about),
                                                );
                                              },
                                              child: Ink(
                                                color: Colors.white,
                                                // height: screenheight(context,dividedby: 11),
                                                child: Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: screenwidth(
                                                          context,
                                                          dividedby: 1.7),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Padding(
                                                          //   padding: EdgeInsets.symmetric(
                                                          //       horizontal: 3.0),
                                                          //   child: Text(
                                                          //     overflow: TextOverflow.ellipsis,
                                                          //     about.customerName,
                                                          //     // maxLines: 3,
                                                          //     style: fontStyleHeading(),
                                                          //   ),
                                                          // ),
                                                          // SizedBox(height: 5),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                size: 14,
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                              ),
                                                              Text(
                                                                about
                                                                    .transactionDateFormatted,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500),
                                                              ),
                                                            ],
                                                          ),
                                                          if (about.remark !=
                                                              "")
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .comment,
                                                                      size: 14,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      about
                                                                          .remark,
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              Color(0xff294472)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          SizedBox(height: 5),
                                                          (about.transactionComments
                                                                  .isNotEmpty)
                                                              ? Row(
                                                                  children: [
                                                                    Image(
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        image: AssetImage(
                                                                            "assets/icon/Texting.gif")),
                                                                    SizedBox(
                                                                      width: 2,
                                                                    ),
                                                                    Container(
                                                                      // width:
                                                                      //     screenwidth(
                                                                      //         context,
                                                                      //         dividedby:
                                                                      //             1.7),
                                                                      child:
                                                                          Text(
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        "${about.transactionComments.length} ${about.transactionComments.length == 1 ? "Comment" : "Comments"}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.grey.shade500,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                  ],
                                                                )
                                                              : SizedBox(),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.person,
                                                                size: 14,
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        2.0),
                                                                child: Text(
                                                                  about
                                                                      .getUsername(),
                                                                  style: TextStyle(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 15,
                                                          top: 5,
                                                          bottom: 5),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              about.transactionImages
                                                                      .isNotEmpty
                                                                  ? Icon(
                                                                      Icons
                                                                          .attachment,
                                                                      color: Colors
                                                                          .grey,
                                                                      size: 20,
                                                                    )
                                                                  : SizedBox(),
                                                              Text(
                                                                about
                                                                    .getAmount(),
                                                                style:
                                                                    TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: about
                                                                      .getAmountColor(),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            'Balance:'.tr +
                                                                getformettedamount(
                                                                    text:
                                                                        "${about.totalAmount}"),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                  height: 5),
                                                              if (about
                                                                      .transactionType ==
                                                                  "Due")
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .timelapse,
                                                                      size: 12,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    Text(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      'Due on'.tr +
                                                                          about
                                                                              .dueDateFormatted,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              about.isDelete ==
                                                                      0
                                                                  ? about.transactionTracking
                                                                              .length ==
                                                                          2
                                                                      ? Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(4.0),
                                                                          child:
                                                                              Text(
                                                                            "Edited",
                                                                            style:
                                                                                TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                                                          ),
                                                                        )
                                                                      : SizedBox()
                                                                  : Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              4.0),
                                                                      child:
                                                                          Text(
                                                                        "Deleted",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                    )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return div();
                                      },
                                    ),
                                  ],
                                )),
                    ),
                  ),
                  controller.show.isFalse
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircularProgressIndicator(
                            color: custom,
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),

          // FutureBuilder(
          //   future: ,
          //   builder: (context, AsyncSnapshot<dynamic> snapshot) {
          //     if (snapshot.hasData) {
          //       GetAllCinfo detail = snapshot.data;
          //       Customer_info about = detail.customers.single;
          //       return ;
          //     }
          //     return Center(child: CircularProgressIndicator(color: custom));
          //   },
          // ),
        );
      }),
    );
  }
}

class info extends StatelessWidget {
  const info(
      {Key? key,
      required this.icon,
      required this.name,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Icon(
              icon,
              size: 35,
              color: Color(0xff294472),
            ),
            SizedBox(
              height: screenheight(context, dividedby: 200),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff294472),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class delete extends StatefulWidget {
  int d = 0;
  delete(this.d);

  @override
  State<delete> createState() => _deleteState();
}

class _deleteState extends State<delete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        content: Container(
          // height: 175,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    (widget.d == 0) ? 'Remove Customer' : 'Remove Staff',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 50, 16),
                child: (widget.d == 0)
                    ? Text(
                        'Would you like to remove'
                        '\nthis Customer and all his'
                        '\nrelated transactions?',
                        style: GoogleFonts.notoSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500))
                    : Text(
                        'Would you like to remove'
                        '\nthis Staff Account and all his'
                        '\nrelated transactions?',
                        style: GoogleFonts.notoSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'CANCEL'.tr,
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff294472),
                            fontSize: 15),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return s_code(
                              onconfirm: () {},
                              capchacode: '',
                              controll: null,
                            );
                          },
                        );
                      },
                      child: Text(
                        'REMOVE',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff294472),
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class s_code extends StatelessWidget {
  final void Function() onconfirm;
  final String? capchacode;
  final TextEditingController? controll;
  const s_code(
      {Key? key, required this.onconfirm, this.capchacode, this.controll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        // height: screenheight(context, dividedby: 3.1),
        // width: screenwidth(context, dividedby: 1.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xff294472),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image(
                        height: 19,
                        width: 19,
                        image: AssetImage('assets/user_profile/i.jpeg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Enter security code to confirm',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Color(0xff76421E),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                cursorColor: Colors.black,
                cursorHeight: 20,
                style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                controller: controll,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              capchacode ?? "wyxe",
              style: GoogleFonts.notoSans(
                color: Colors.grey,
                wordSpacing: 3,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Divider(
              height: 40,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffF1BC5E),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'CANCEL'.tr,
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: onconfirm,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffF1BC5E),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Confirm'.tr,
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                          ),
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
    );
  }
}
