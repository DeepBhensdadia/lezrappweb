import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class refund_policy extends StatelessWidget {
  const refund_policy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff294472),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Refund Policy',
              style: TextStyle(
                  letterSpacing: 0.2,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '•   Refund policy',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    ' Since the Mobile Application offers non- '
                    '\n tangible, irrevocable goods we do not '
                    '\n provide refunds after the product is '
                    '\n purchased, which you acknowledge prior'
                    ' \n to purchasing any product in the Mobile '
                    '\n Application.',
                    style: TextStyle( fontFamily:'SF Pro Display',fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 0.5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'You may however sign up for a free fully '
                    '\n functioning 14 day trial and try the service '
                    '\n before making a purchase.',
                    style: TextStyle( fontFamily: 'SF Pro Display',fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 0.5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '•   Contact us',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'If you have any questions, concerns, or '
                    '\ncomplaints regarding this refund policy, '
                    '\nwe encourage you to contact us using the '
                    '\ndetails below: '
                    '\nsupport@lezrapp.com',
                    style: TextStyle(  fontFamily: 'SF Pro Display',fontWeight: FontWeight.bold,letterSpacing: 0.5),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
