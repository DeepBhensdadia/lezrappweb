import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Icons_row/photo.dart';
import 'package:lezrapp/api_model/expense/get_expense_api.dart';

import '../api/const_apis.dart';

class bill extends StatelessWidget {
  bill(  {Key? key,
    required this.about,
  }) : super(key: key);

  final Expense_all about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff294472),
        title: Row(
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
              about.expenseTitle,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  letterSpacing: 0.2,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_outlined, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.note_alt_sharp, color: Colors.white)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  color: Color(0xffF1BC5C),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            about.expenseTitle,
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            'Expense For',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.grey.shade700,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.wallet,
                                    color: Color(0xffF1BC5C), size: 35),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
    getformettedamount(text: '${about.amount} Paid'),
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            'Payment',
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined,
                                    color: Color(0xffF1BC5C), size: 35),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            about.dateFormatted,
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            'Expense date',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.grey.shade700,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.chat_rounded,
                                    color: Color(0xffF1BC5C), size: 35),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            (about.remark!="")? about.remark:'No remark',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 210,
                                          child: Text(
                                            'Remark',
                                            style:TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.grey.shade700,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      height: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
            (about.images.isNotEmpty)
                ? GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:about.images.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
              itemBuilder: (context, index) {
                dynamic  image =
                    about.images[index];
                return Padding(
                  padding:
                  const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(Expenseimage(
                              about.images));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      image.image)),
                              color: Colors.white,
                              borderRadius:
                              BorderRadius
                                  .circular(8),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color:
                                  Colors.grey,
                                )
                              ]),
                          // child: Column(
                          //   children: [
                          //     ClipRRect(
                          //       borderRadius:
                          //       BorderRadius
                          //           .circular(
                          //           8),
                          //       child: Image(
                          //         fit: BoxFit.cover,
                          //         // height: 100,
                          //         //   width: 100,
                          //           image: NetworkImage(
                          //               image
                          //                   .imageFileName)),
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
                : SizedBox(),
            // Row(
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         Get.to(photo('assets/user_profile/download.png'));
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(8),
            //           boxShadow: [
            //             BoxShadow(
            //               blurRadius: 3,
            //               color: Colors.grey,
            //             )
            //           ]
            //         ),
            //         child: Column(
            //           children: [
            //             ClipRRect(
            //               borderRadius: BorderRadius.circular(8),
            //               child: Image(
            //                   image:
            //                       AssetImage('assets/user_profile/download.png')),
            //             ),
            //             SizedBox(height: 5,),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
