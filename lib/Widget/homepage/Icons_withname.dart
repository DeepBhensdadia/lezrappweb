// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper.dart';

class Icon_With_Name extends StatefulWidget {
  final String Stringimage;
  final String name;
  const Icon_With_Name(
      {Key? key,
      required this.Stringimage,
      required this.name,
      required this.onPressed})
      : super(key: key);
  final void Function() onPressed;

  @override
  State<Icon_With_Name> createState() => _Icon_With_NameState();
}

class _Icon_With_NameState extends State<Icon_With_Name> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: CircleBorder(),
      minWidth: screenwidth(context, dividedby: 7),
      onPressed: widget.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
              width: screenwidth(context, dividedby: 10),
              height: screenheight(context, dividedby: 30),
              image: AssetImage(widget.Stringimage)),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.name.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: screenheight(context,dividedby: 60),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
