import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/helper.dart';
import 'package:lezrapp/mainscreen.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/set_pin.dart';
import 'package:lezrapp/sharedpref.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../Const.dart';
import '../api/const_apis.dart';
import '../api_model/login/saveusermodel.dart';
import '../api_model/login/staff_login_model.dart';
import '../getx controller/summarycontroller.dart';
import '../login/loginas_screen.dart';
import '../scanner/datascanfirstpage.dart';
import 'enterpinscreen.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

String? pincode = SharedPref.get(prefKey: PrefKey.setpin) != null ? SharedPref.get(prefKey: PrefKey.setpin) : null ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Color(0xA597E1FF).withOpacity(0.9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: screenheight(context, dividedby: 4),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Iconwithnamelogo()
            ],
          ),
          Expanded(
            child: SizedBox(
              // height: kweb() ?screenheight(context, dividedby: 6.9)  :  screenwidth(context, dividedby: 2.9),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 103),
            child: Text(
              "rakhe har hisaab \n sambhalkar",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.comfortaa(color: Color(0xff294472), fontSize: 20),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 55,
                  width: 75,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/imgs/footer_digital.png')),
              Image(
                height: 55,
                width: 75,
                fit: BoxFit.cover,
                image: AssetImage('assets/imgs/footer-ssl.png'),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        saveuser() != null ?
         MainScreengo() :
        Get.off(DataQRscanner());
      },
    );
  }


}

class Iconwithnamelogo extends StatelessWidget {
  const Iconwithnamelogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 200,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
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
                    // letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 14,
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
    );
  }
}
