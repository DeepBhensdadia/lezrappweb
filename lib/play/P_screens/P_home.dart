import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/play/P_cart.dart';
import '../../mainscreen.dart';

class P_home extends StatelessWidget {
  const P_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff294472),
          leading: InkWell(
            onTap: () {
              Get.off(MainScreen());
            },
            child: Image(
                height: 40,
                width: 40,
                image: AssetImage('assets/icon/favicon.ico')),
          ),
          title: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      'LezrApp',
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      'The Bisiness Game',
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(P_cart());
              },
              child: Image(
                height: 30,
                width: 30,
                image: AssetImage(
                  'assets/icon/cart_black.png',
                ),
              ),
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Rank',
                    style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image(
                    height: 60,
                    width: 60,
                    image: AssetImage(
                      'assets/dukon/rank_cup.png',
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      'false',
                      style: GoogleFonts.notoSans(
                        color: Color(0xff294472),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Explore Categories',
                    style: GoogleFonts.notoSans(
                      color: Color(0xff294472),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
