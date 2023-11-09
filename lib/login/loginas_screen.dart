import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
import 'package:lezrapp/login/adminlogin_screen.dart';
import 'package:lezrapp/login/stafflogin_screen.dart';

import '../helper.dart';
import '../screens/splash_screen.dart';

class loginas_screen extends StatefulWidget {
  const loginas_screen({Key? key}) : super(key: key);

  @override
  State<loginas_screen> createState() => _loginas_screenState();
}

class _loginas_screenState extends State<loginas_screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 40,),
                  Iconwithnamelogo()
                ],
              ),
              SizedBox(height: 90,),
              Ink(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff294472),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(adminlogin_screen());
                  },
                  child: Center(
                    child: Text(
                        "SIGNUP / LOGIN AS ADMIN", style:TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Color(0xffE1BE71),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Get.to(stafflogin_screen());
                },
                child: Ink(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xff294472),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                        "LOGIN AS STAFF", style:TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Color(0xffE1BE71),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
