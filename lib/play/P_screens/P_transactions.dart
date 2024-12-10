import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/const_apis.dart';

class P_transactions extends StatefulWidget {
  const P_transactions({Key? key}) : super(key: key);

  @override
  State<P_transactions> createState() => _P_transactionsState();
}

class _P_transactionsState extends State<P_transactions> {
  int s = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: (s % 2 == 0) ? 56 : 102,
          flexibleSpace: Column(
            children: [
              Container(
                height: 56,
                color: const Color(0xff294472),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Transaction History',
                          style: GoogleFonts.notoSans(
                              letterSpacing: 0.2,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    s++;
                                  });
                                },
                                icon: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Color(0xffF1BC5E),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              (s % 2 == 0)
                  ? SizedBox(
                      height: 0,
                    )
                  : Container(
                      height: 46,
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
                          hintText: 'Search Contacts',
                          hintStyle: GoogleFonts.notoSans(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 10,
                // ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 7,
                      height: 0,
                      color: Colors.grey.shade300,
                    );
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Image(
                              height: 150,
                              width: 100,
                              image: AssetImage(
                                'assets/user_profile/home.jpeg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Container(
                                height: 130,
                                color: Colors.white,
                                // height: screenheight(context,dividedby: 11),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              '5 Bhk Cottage @ Dharampur, and...',
                                              // maxLines: 3,
                                              style: GoogleFonts.notoSans(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  getformettedamount(text: '47,500,000.00'),
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Quantity: 1 Bought on:2021-05-08',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Sold: ',
                                                    style: GoogleFonts.notoSans(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    '1 ',
                                                    style: GoogleFonts.notoSans(
                                                        fontSize: 14,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    'Sold on: 2021-05-08',
                                                    style: GoogleFonts.notoSans(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                ),
                Divider(
                  thickness: 7,
                  height: 0,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              color: Colors.white,
              height: 63,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchases',
                        style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        getformettedamount(text: '3,400,030.00'),
                        style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'sold',
                        style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        getformettedamount(text: '3,400,030.00'),
                        style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
