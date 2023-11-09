import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';

import 'enternew_number.dart';

class chenge_phonenumber extends StatelessWidget {
  const chenge_phonenumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Change number'),
        backgroundColor:custom,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 13, 0, 13),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  ' Changing your phone number will migrate '
                  '\n your account info, files & settings.',
                  textAlign: TextAlign.start,

                  style: TextStyle(
                    letterSpacing: 0.5,
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  ' Before processing, please confirm that you '
                  '\n are able to receive SMS at your new number.',
                  textAlign: TextAlign.start,
                  style:TextStyle(
                      letterSpacing: 0.5,
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  ' If you have both a new phone & a new '
                  '\n number, first chnage your number on your '
                  '\n old phone.',
                  textAlign: TextAlign.start,
                  style:TextStyle(
                      letterSpacing: 0.5,
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: BoxDecoration(
                  color: custom,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 40,
                width: 90,
                child: InkWell(
                  onTap: () {
                    Get.off(
                      enternewnumber_screen(),
                    );
                  },
                  child: Center(
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
