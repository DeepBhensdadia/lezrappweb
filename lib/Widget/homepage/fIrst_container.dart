// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/helper.dart';

class First_Container extends StatelessWidget {
  final String name;
  final String rupees;

  final void Function() onpress;

  const First_Container(
      {Key? key,
      required this.name,
      required this.rupees,
      required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        // padding: EdgeInsets.zero,
        // minSize: 35,
        // color: Color(0xff294472),
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff294472),
            borderRadius: BorderRadius.circular(5)
          ),
          width: screenwidth(context, dividedby: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name.tr,
                  style: TextStyle(fontFamily: 'SF Pro Display',color: Color(0xffF1BC5E), fontSize: 12),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 130,
                child: Text(
                  rupees,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
