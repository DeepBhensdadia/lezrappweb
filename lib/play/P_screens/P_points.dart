import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class P_points extends StatelessWidget {
  const P_points({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff294472),
          title: Text(
            'Statement of Points',
            style: GoogleFonts.notoSans(),
          ),
        ),
      ),
    );
  }
}
