import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper.dart';
import '../login/loginas_screen.dart';

class agreement_screen extends StatefulWidget {
  agreement_screen({Key? key}) : super(key: key);

  @override
  State<agreement_screen> createState() => _agreement_screenState();
}

class _agreement_screenState extends State<agreement_screen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 40,),
                  Container(
                    // color: Colors.red,
                    height: 200,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:  Image(
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/imgs/new/logo.png'),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 35,
                          width: 133,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LezrApp",
                                style: GoogleFonts.comfortaa(
                                    // fontFamily: 'SF Pro Display',
                                  // letterSpacing: 1,
                                    color: Colors.black,
                                    fontSize: screenwidth(context,dividedby: 18),
                                    fontWeight: FontWeight.w600),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "TM",
                                    style: GoogleFonts.comfortaa(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 60, 5, 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          " For us nothing is more \n important than your data.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Color(0xff737373),
                              fontWeight: FontWeight.w500,
                              fontSize: 27),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            " Our Privacy Policy contains info about the data \n"
                            " we collect and your choices about how we use \n "
                            "your data. The Terms are re-organized & \n "
                            "contain important info about how our users \n "
                            "can resolve legal disputes with us through \n "
                            "arbitration.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                color: Color(0xFF565253),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.5,
                      endIndent: 5,
                      indent: 5,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          side: BorderSide(color: Color(0xff565253)),
                          activeColor: Color(0xff294472),
                          value: check,
                          onChanged: (value) {
                            setState(() {
                              check = value!;
                            });
                          },
                        ),
                        Text(
                          " I agree to updated Privacy Policy, \n Terms of Use and License Agreement.",
                          textAlign: TextAlign.start,
                          style:TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: Color(0xff292526),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    (check==true)?
                    Container(
                      height: 37,
                      width: 160,
                      color: Color(0xff294472),
                      child: InkWell(
                        onTap: () {
                          Get.off(loginas_screen());
                        },
                        child: Center(
                          child: Text(
                            "I  AGREE",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ): Container(
                      height: 37,
                      width: 160,
                      color: Color(0xff96A2BA),
                      child: Center(
                        child: Text(
                          "I  AGREE",
                          style: GoogleFonts.comfortaa(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}