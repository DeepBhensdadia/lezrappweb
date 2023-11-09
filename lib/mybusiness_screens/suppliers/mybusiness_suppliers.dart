import 'dart:convert';
import 'dart:developer';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lezrapp/Icons_row/reports_screen.dart';
import 'package:lezrapp/api_model/customers/get_customers_api.dart';
import 'package:lezrapp/mybusiness_screens/customer/customer_info.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Const.dart';
import '../../Dashboard/addcustomer.dart';
import '../../Dashboard/addsupplire.dart';
import '../../api/const_apis.dart';
import '../../api_model/customers/get_customer_info.dart';
import '../../getx controller/customer/addcustomerdata.dart';
import '../../getx controller/customer/getcustomersdatamybussiness.dart';
import '../../getx controller/summarycontroller.dart';
import '../../helper.dart';
import '../../mainscreen_controller.dart';
import 'package:http/http.dart' as http;

class mybus extends StatefulWidget {
  const mybus({Key? key}) : super(key: key);

  @override
  State<mybus> createState() => _mybusState();
}

class _mybusState extends State<mybus> {
  AddSuppliredata addcuscontroller = Get.put(AddSuppliredata());

  Contact? _selectedContact;

  void _requestContactsPermission() async {
    PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      await _pickContact();
    } else {
      print("notgranted");
    }
  }

  Future<void> _pickContact() async {
    if (await Permission.contacts.request().isGranted) {
      try {
        Contact? contact = await ContactsService.openDeviceContactPicker();
        setState(() {
          _selectedContact = contact;
        });

        if (_selectedContact?.displayName != null) {
          addcuscontroller.namecontroller_1.text =
              _selectedContact!.displayName ?? "";
        }
        if (_selectedContact?.phones != null) {
          if (_selectedContact?.phones?.length == 1) {
            addcuscontroller.phonecontroller_1.text =
                _selectedContact?.phones?.first.value ?? "";
            addcuscontroller.adddata(
                customertypeid: "2");
            cleartext(addcuscontroller);
          } else {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('${_selectedContact?.phones?[index].value}'),
                      onTap: () {
                        if (_selectedContact?.displayName != null) {
                          addcuscontroller.namecontroller_1.text =
                              _selectedContact!.displayName ?? "";
                        }
                        String? number = _selectedContact?.phones?[index].value
                            ?.replaceAll("+91", "");
                        addcuscontroller.phonecontroller_1.text = number ?? "";
                        Navigator.pop(context);
                        addcuscontroller.adddata(
                           customertypeid: "2");
                        cleartext(addcuscontroller);
                      },
                    );
                  },
                );
              },
            );
          }
        }
      } catch (e) {
        // Handle error if the contact picker fails
        print('Contact picker error: $e');
      }
    } else {
      // Handle case when the user denies the contacts permission
      print('Contacts permission denied');
    }
  }

  final scrollcontroller = ScrollController();
  getsuppliredatamybusi getcustomer_Conroller =
      Get.put(getsuppliredatamybusi());

  @override
  void initState() {
    // TODO: implement initState
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        getcustomer_Conroller.page += 15;
      });
      print(getcustomer_Conroller.page);
      getcustomer_Conroller.getpages("2");
    } else {
      print(getcustomer_Conroller.page);
    }
  }

  bhai(String c_id, String u_id, String cu_id, String yes) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Cookie': 'ci_session=8s2snk8594fdlgn7dpnvlahs1lnv7m9t'
    };
    var request = http.Request('POST',
        Uri.parse('$customerurl/markFlagged?auth=${saveuser()!.company.auth}'));
    request.bodyFields = {
      'company_id': c_id,
      'user_id': u_id,
      'customer_id': cu_id,
      'is_favorite': yes,
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
  }

  Summarycontroller _summarycontroller = Get.put(Summarycontroller());

  @override
  void dispose() {
    // TODO: implement dispose
    getcustomer_Conroller.page = 0;
    getcustomer_Conroller.serchtext = "";
    super.dispose();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffF1BC5E),
            onPressed: () {
              Get.to(
                AddSupplire(),
              );
            },
            child: const Icon(Icons.add, color: Colors.black, size: 30),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 110,
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
                            'Supplier'.tr,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                letterSpacing: 0.2,
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _requestContactsPermission();
                            },
                            icon: const Icon(
                              size: 30,
                              Icons.contacts,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: TextField(
                    cursorHeight: 25,
                    cursorWidth: 1.5,
                    cursorColor: Colors.black,
                    controller: controller,
                    onChanged: (value) {
                      getcustomer_Conroller.page = 0;
                      setState(() {
                        getcustomer_Conroller.serchtext = value;
                      });
                      getcustomer_Conroller.getpages("2");
                    },
                    decoration: InputDecoration(
                      hintText: 'Search Supplier'.tr,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon:controller.text.isEmpty ? SizedBox(): IconButton(onPressed: () {
                        controller.clear();
                        getcustomer_Conroller.page = 0;
                        setState(() {
                          getcustomer_Conroller.serchtext = "";
                        });
                        getcustomer_Conroller.getpages("2");
                      },icon: Icon(Icons.clear,color: custom,)),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: GetBuilder<getsuppliredatamybusi>(
            builder: (controller) {
              return controller.post.isNotEmpty
                  ? NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (notification) {
                        notification.disallowIndicator();
                        return false;
                      },
                      child: ListView.separated(
                        controller: scrollcontroller,
                        itemCount: controller.post.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Customer about = controller.post[index];
                          Customer about1 = controller.post.last;
                          bool isflag = about.getIsFavourite;
                          return index + 1 == controller.post.length
                              ? controller.isdataloading.isTrue
                                  ? Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: custom,
                                      )),
                                    )
                                  :InkWell(
                            onTap: () {
                              Get.to(
                                customer_info(
                                  about: about1,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      // contentPadding: EdgeInsets.all(0),
                                                      actions: [
                                                        Column(
                                                          children: [
                                                            customer_profile(),
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: about.customerPhoto.isNotEmpty ? CircleAvatar(backgroundColor: yellowcustomer,backgroundImage: NetworkImage(about1.customerPhoto),) : CircleAvatar(
                                                backgroundColor:
                                                Color(0xffF1BC5E),
                                                child: Center(
                                                  child: Text(
                                                    about1.customerName2,
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'SF Pro Display',
                                                        fontSize: 22,
                                                        color:
                                                        Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: screenwidth(context,
                                              dividedby: 1.8),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                EdgeInsets.all(2.0),
                                                child: Text(
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  '${about1.customerName}',
                                                  // maxLines: 3,
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'SF Pro Display',
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.all(2.0),
                                                child: Text(
                                                  about1.customerMobileNo,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'SF Pro Display',
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        if (isflag) {
                                          const snackBar = SnackBar(
                                              content:
                                              Text('flag remove!'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          bhai(
                                              about1.companyId,
                                              about1.userId,
                                              about1.customerId,
                                              '0');
                                          _summarycontroller
                                              .get_summarydetails();
                                        } else {
                                          const snackBar = SnackBar(
                                              content:
                                              Text('flag added!'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          bhai(
                                              about1.companyId,
                                              about1.userId,
                                              about1.customerId,
                                              '1');
                                          _summarycontroller
                                              .get_summarydetails();
                                        }
                                        controller.changeTypeFavourite(
                                            index: index,
                                            value: isflag = !isflag);
                                      },
                                      child: isflag
                                          ? Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .end,
                                          children: [
                                            Text(
                                              'Rs ${about1.totalAmount} ${about1.transactionType}',
                                              maxLines: 3,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  color: about1.transactionType == "Adv" ? Colors.green : Colors.red,
                                                  fontSize: 16,
                                                  fontFamily:
                                                  'SF Pro Display',
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      4),
                                                  border: Border.all(
                                                      color:
                                                      yellowcustomer,
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    1.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.flag,
                                                        color:
                                                        yellowcustomer,
                                                        size: 18),
                                                    // Text(
                                                    //   'UnFlag'
                                                    //       .tr,
                                                    //   style:
                                                    //       TextStyle(
                                                    //     fontSize: 12,
                                                    //     fontFamily:
                                                    //         'SF Pro Display',
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                          : Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Rs ${about1.totalAmount} ${about1.transactionType}',
                                            style: TextStyle(
                                                fontFamily:
                                                'SF Pro Display',
                                                color: about1.transactionType == "Adv" ? Colors.green : Colors.red,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight
                                                    .w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                2.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                    Icons
                                                        .flag_outlined,
                                                    color: Colors
                                                        .black45,
                                                    size: 18),
                                                // Text(
                                                //   'Flag'.tr,
                                                //   style: TextStyle(
                                                //       fontSize: 12),
                                                // )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                              : InkWell(
                                  onTap: () {
                                    Get.to(
                                      customer_info(
                                        about: about,
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            // contentPadding: EdgeInsets.all(0),
                                                            actions: [
                                                              Column(
                                                                children: [
                                                                  customer_profile(),
                                                                ],
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child:  about.customerPhoto.isNotEmpty ? CircleAvatar(backgroundColor: yellowcustomer,backgroundImage: NetworkImage(about1.customerPhoto),) : CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xffF1BC5E),
                                                      child: Center(
                                                        child: Text(
                                                          about.customerName2,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 22,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: screenwidth(context,
                                                    dividedby: 1.8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        '${about.customerName}',
                                                        // maxLines: 3,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Text(
                                                        about.customerMobileNo,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              if (isflag) {
                                                const snackBar = SnackBar(
                                                    content:
                                                        Text('flag remove!'));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                bhai(
                                                    about.companyId,
                                                    about.userId,
                                                    about.customerId,
                                                    '0');
                                                _summarycontroller
                                                    .get_summarydetails();
                                              } else {
                                                const snackBar = SnackBar(
                                                    content:
                                                        Text('flag added!'));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                bhai(
                                                    about.companyId,
                                                    about.userId,
                                                    about.customerId,
                                                    '1');
                                                _summarycontroller
                                                    .get_summarydetails();
                                              }
                                              controller.changeTypeFavourite(
                                                  index: index,
                                                  value: isflag = !isflag);
                                            },
                                            child: isflag
                                                ? Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'Rs ${about.totalAmount} ${about.transactionType}',
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color: about.transactionType == "Adv" ? Colors.green : Colors.red,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              border: Border.all(
                                                                  color:
                                                                      yellowcustomer,
                                                                  width: 1)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        1.0),
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons.flag,
                                                                    color:
                                                                        yellowcustomer,
                                                                    size: 18),
                                                                // Text(
                                                                //   'UnFlag'
                                                                //       .tr,
                                                                //   style:
                                                                //       TextStyle(
                                                                //     fontSize: 12,
                                                                //     fontFamily:
                                                                //         'SF Pro Display',
                                                                //   ),
                                                                // )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Rs ${about.totalAmount} ${about.transactionType}',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                             color: about.transactionType == "Adv" ? Colors.green : Colors.red,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    2.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .flag_outlined,
                                                                color: Colors
                                                                    .black45,
                                                                size: 18),
                                                            // Text(
                                                            //   'Flag'.tr,
                                                            //   style: TextStyle(
                                                            //       fontSize: 12),
                                                            // )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        },
                        separatorBuilder: (context, index) {
                          return div();
                        },
                      ),
                    )
                  : circulerprogress();
            },
          )),
    );
  }
}

class customer_profile extends StatelessWidget {
  const customer_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenheight(context, dividedby: 3),
      width: screenwidth(context, dividedby: 1.1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deep Patel',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 35,
                  width: 35,
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
          Divider(
            color: Colors.grey,
            height: 15,
            thickness: 0.5,
          ),
          CircleAvatar(
            backgroundColor: Color(0xffF1BC5E),
            radius: 40,
            child: Center(
              child: Text(
                'D',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 22),
          ),
          Text(
            'Added On 02,jan 2023',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'REMIND VIA',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 15,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('assets/icon/txtsms.png')),
                        SizedBox(
                          height: screenheight(context, dividedby: 200),
                        ),
                        Text(
                          'SMS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Image(
                          height: 30,
                          width: 30,
                          image: AssetImage('assets/icon/whatsapp.png'),
                        ),
                        SizedBox(
                          height: screenheight(context, dividedby: 200),
                        ),
                        Text(
                          'Whatsapp',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('assets/icon/phone.png')),
                        SizedBox(
                          height: screenheight(context, dividedby: 200),
                        ),
                        Text(
                          'Call',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
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
  }
}
