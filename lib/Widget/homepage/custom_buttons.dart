import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper.dart';

class Custom_buttons extends StatelessWidget {
  final String Stringimage;
  final String name;
  final bool yes;
  final void Function() onPressed;

  const Custom_buttons(
      {Key? key,
      required this.Stringimage,
      required this.onPressed,
      required this.name,
      required this.yes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenheight(context, dividedby: 120),
        bottom: screenheight(context, dividedby: 70),
      ),
      child: Container(
        height: 50,
        // width: screenwidth(context,dividedby: 4),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: (yes==true)?BorderRadius.only(
              bottomRight: Radius.circular(10), topRight: Radius.circular(10)):BorderRadius.only(
              bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
        ),
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // color: Colors.white,
            // padding: const EdgeInsets.all(8),
            onTap: onPressed,
            child: Row(
              children: [
                Image(
                    width: 50,
                    height: 50,

                    image: AssetImage(Stringimage)),
                SizedBox(
                  width: screenwidth(context, dividedby: 30),
                ),
                Text(
                  name.tr,
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: screenheight(context, dividedby: 60),
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
