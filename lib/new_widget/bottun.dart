// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper.dart';

class CustomButton extends StatelessWidget {
  final String name;

  const CustomButton({Key? key, required this.onPressed, required this.name})
      : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: screenwidth(context, dividedby: 1),
      height: screenheight(context, dividedby: 13),

      decoration: const BoxDecoration(
        color: Color(0xff294472),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // gradient: LinearGradient(colors: [
        //   Color(0xffA44D80),
        //   Color(0xff75689E),
        // ])
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            name,
            style:
             TextStyle(fontFamily: 'SF Pro Display',color: Color(0xffE1BE71), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
