import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/const_apis.dart';

class P_cash extends StatelessWidget {
  const P_cash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff294472),
          title: Text(
            'Available Cash',
            style: GoogleFonts.notoSans(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(8),
                ),
            child: Row(
              children: [
                Image(
                    width: 150,
                    height: 80,
                    image: AssetImage('assets/user_profile/2000.jpeg')),
                SizedBox(width: 5,),
                Text(
                  'X',
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(width: 5,),
                Text(
                  '10,000',
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
                SizedBox(width: 30),
                Text(
                  getformettedamount(text: '20,000.00'),
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
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
              height: 35,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        getformettedamount(text: '20,000.00'),
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
