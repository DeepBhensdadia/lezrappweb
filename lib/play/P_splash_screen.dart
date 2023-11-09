import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/play/P_main.dart';

import '../helper.dart';

class P_splash extends StatefulWidget {
  const P_splash({Key? key}) : super(key: key);

  @override
  State<P_splash> createState() => _P_splashState();
}

class _P_splashState extends State<P_splash> {
  @override

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) {
              return P_main();
            },
          ),
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff294472),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:  Image(
              height: 110,
              width: 110,
              fit: BoxFit.cover,
              image: AssetImage('assets/imgs/new/logo.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LezrApp",
                style: GoogleFonts.notoSans(
                  // letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Presents",
                style: GoogleFonts.notoSans(
                  // letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The Business Game",
                style: GoogleFonts.notoSans(
                  // letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
