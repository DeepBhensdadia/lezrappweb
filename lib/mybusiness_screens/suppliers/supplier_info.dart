import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Dashboard/addtransaction.dart';
import 'package:lezrapp/helper.dart';
import '../../Const.dart';
import '../../Icons_row/reports_screen.dart';
import '../../api/const_apis.dart';
import '../../api_model/customers/get_customer_info.dart';
import '../../api_model/customers/get_customers_api.dart';
import '../../api_model/transaction/get_transaction.dart';
import '../../screens/Transactions/details.dart';
import '../../screens/bottomsheet.dart';
import '../suppliers/supplier_info.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;

class supplier_info extends StatefulWidget {
  const supplier_info({Key? key, required  this.about,})
      : super(key: key);

  final Customer about;


  @override
  State<supplier_info> createState() => _supplier_infoState();
}

class _supplier_infoState extends State<supplier_info> {
  late Getalltransaction transaction;
  late GetAllCinfo information;
  bool show = false;
  gettransaction() async {
    await get_transactioncustomer(widget.about.customerId,"").then((value) {
      transaction = value;
      setState(() {
        show = true;
      });
      // Fluttertoast.showToast(msg: value.message);
    }).onError((error, stackTrace) {
      print(error);
    });
    await get_customer_info(widget.about.customerId)
        .then((value) {
      information = value;
      // Fluttertoast.showToast(msg: value.message);
    })
        .onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    gettransaction();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEEEEEE),
          appBar: AppBar(
            backgroundColor: custom,
            automaticallyImplyLeading: false,
            toolbarHeight: screenheight(context, dividedby: 14),
            leading: IconButton(
              onPressed: () {
                bottomsheetfilter(
                  context,
                      () {},  () {
                  Get.back();
                },
                );
              },
              icon: const Icon(
                size: 25,
                Icons.filter_list_alt,
                color: Colors.white,
              ),
            ),
            title: Text(
              widget.about.customerName,
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
                  //Get.to(() => Addcustomer());
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
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xffF1BC5E),
                                child: Center(
                                  child: Text(
                                    widget.about.customerName2,
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
                                width: 300,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  widget.about.customerName,
                                  // maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                info(
                                  icon: Icons.call,
                                  name: 'Call'.tr,
                                  onPressed: () {},
                                ),
                                info(
                                  icon: Icons.file_upload_outlined,
                                  name: 'Export'.tr,
                                  onPressed: () {},
                                ),
                                info(
                                  icon: Icons.av_timer_outlined,
                                  name: 'Reminder'.tr,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Container();
                                      },
                                    );
                                  },
                                ),
                                info(
                                  icon: Icons.edit,
                                  name: 'Edit'.tr,
                                  onPressed: () {},
                                ),
                                info(
                                  icon: Icons.delete,
                                  name: 'Delete'.tr,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return delete(0);
                                      },
                                    );
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
                                  'Rs ${widget.about.totalAmount} ${widget.about.transactionType}',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.red,
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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 9, horizontal: 10),
                          child:  show == false
                              ? CircularProgressIndicator(color: custom,)
                              :transaction.transactions.isEmpty ?  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transactions Not Found'.tr,
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Color(0xff294472),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    AddTransaction(),
                                  );
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Color(0xffF1BC5E),
                                ),
                              ),
                            ],
                          ) : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Transactions Available',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      color: Color(0xff294472),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.to(
                                        AddTransaction(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Color(0xffF1BC5E),
                                    ),
                                  ),
                                ],
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: transaction.transactions.length,
                                itemBuilder: (context, index) {
                                  Transaction about =
                                  transaction.transactions[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      extentRatio: 0.4,
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
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
                                        SlidableAction(
                                          autoClose: true,
                                          onPressed: (context) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return delete(1);
                                              },
                                            );
                                          },
                                          backgroundColor:
                                          const Color(0xFFEB4359),
                                          foregroundColor: Colors.white,
                                          // icon: Icons.save,
                                          label: 'Delete'.tr,
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                              details(about: about),
                                            );
                                          },
                                          child: Ink(
                                            color: Colors.white,
                                            // height: screenheight(context,dividedby: 11),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10),
                                                  child: Row(
                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                    3.0),
                                                                child: Text(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  about
                                                                      .customerName,
                                                                  // maxLines: 3,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'SF Pro Display',
                                                                      color: Color(
                                                                          0xFF2C4475),
                                                                      fontSize:
                                                                      18,
                                                                      fontWeight:
                                                                      FontWeight.w600),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    size:
                                                                    16,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    3,
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
                                                                        FontWeight.w500,
                                                                        color: Colors.grey.shade500),
                                                                  ),
                                                                  // Text(
                                                                  //   about.transactionId,
                                                                  //   style: TextStyle(
                                                                  //       fontFamily: 'SF Pro Display',
                                                                  //       fontSize: 12,
                                                                  //       fontWeight: FontWeight.w500,
                                                                  //       color: Colors.grey.shade500),
                                                                  // ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  (about.remark !=
                                                                      "")
                                                                      ? Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons.mode_comment_outlined,
                                                                        color: Colors.grey.shade400,
                                                                        size: 14,
                                                                      ),
                                                                      SizedBox(
                                                                        width: 2,
                                                                      ),
                                                                      Container(
                                                                        width: screenwidth(context, dividedby: 2),
                                                                        child: Text(
                                                                          overflow: TextOverflow.ellipsis,
                                                                          about.remark,
                                                                          style: TextStyle(fontFamily: 'SF Pro Display', fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                    ],
                                                                  )
                                                                      : SizedBox(),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .person,
                                                                    size:
                                                                    12,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                                                    child:
                                                                    Text(
                                                                      overflow:
                                                                      TextOverflow.ellipsis,
                                                                      about
                                                                          .companyName,
                                                                      style: TextStyle(
                                                                          fontFamily: 'SF Pro Display',
                                                                          fontSize: 10,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.grey.shade500),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .currency_rupee,
                                                                  color: about.transactionType ==
                                                                      "Due"
                                                                      ? Colors
                                                                      .red
                                                                      : Colors
                                                                      .green,
                                                                  size: 14,
                                                                ),
                                                                Text(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  about
                                                                      .amount
                                                                      .toString(),
                                                                  style:
                                                                  TextStyle(
                                                                    fontFamily:
                                                                    'SF Pro Display',
                                                                    fontSize:
                                                                    16,
                                                                    fontWeight:
                                                                    FontWeight.w600,
                                                                    color: about.transactionType ==
                                                                        "Due"
                                                                        ? Colors.red
                                                                        : Colors.green,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  about
                                                                      .transactionType
                                                                      .toString(),
                                                                  style:
                                                                  TextStyle(
                                                                    fontFamily:
                                                                    'SF Pro Display',
                                                                    fontSize:
                                                                    16,
                                                                    fontWeight:
                                                                    FontWeight.w600,
                                                                    color: about.transactionType ==
                                                                        "Due"
                                                                        ? Colors.red
                                                                        : Colors.green,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                              children: [
                                                                Text(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  'Balance :'
                                                                      .tr,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'SF Pro Display',
                                                                      fontSize:
                                                                      10,
                                                                      fontWeight: FontWeight
                                                                          .w600,
                                                                      color:
                                                                      Colors.grey),
                                                                ),
                                                                Icon(
                                                                    Icons
                                                                        .currency_rupee,
                                                                    color: Colors
                                                                        .grey,
                                                                    size:
                                                                    10),
                                                                Text(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  about
                                                                      .totalAmount
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'SF Pro Display',
                                                                      fontSize:
                                                                      10,
                                                                      fontWeight: FontWeight
                                                                          .w600,
                                                                      color:
                                                                      Colors.grey),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      2),
                                                                  child:
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons.timelapse,
                                                                        size:
                                                                        12,
                                                                        color:
                                                                        Colors.grey,
                                                                      ),
                                                                      Text(
                                                                        overflow:
                                                                        TextOverflow.ellipsis,
                                                                        'Due on',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily: 'SF Pro Display',
                                                                          fontSize: 10,
                                                                          color: Colors.black45,
                                                                          fontWeight: FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.all(
                                                                      4.0),
                                                                  child:
                                                                  Text(
                                                                    overflow:
                                                                    TextOverflow.ellipsis,
                                                                    about
                                                                        .dueDateFormatted,
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SF Pro Display',
                                                                      fontSize:
                                                                      10,
                                                                      color:
                                                                      Colors.grey,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   heigh
                                              ],
                                            ),
                                          ),
                                        ),
                                        about.isDelete != 0
                                            ? Padding(
                                          padding: const EdgeInsets
                                              .symmetric(
                                              vertical: 10.0,
                                              horizontal: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              badges.Badge(
                                                  badgeContent: const Text(
                                                      'Deleted',
                                                      style: TextStyle(
                                                          fontSize:
                                                          15,
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600)),
                                                  badgeStyle: badges
                                                      .BadgeStyle(
                                                    shape: badges
                                                        .BadgeShape
                                                        .square,
                                                    badgeColor:
                                                    Colors.red,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        10,
                                                        vertical: 5),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        4),
                                                  )),
                                            ],
                                          ),
                                        )
                                            : SizedBox()
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return div();
                                },
                              ),
                            ],
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
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
          height: 175,
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
  const s_code({Key? key, required this.onconfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: screenheight(context, dividedby: 3.1),
        width: screenwidth(context, dividedby: 1.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
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
              'w y Z r',
              style: GoogleFonts.notoSans(
                color: Colors.grey,
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
                          'CONFIRM',
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
