import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customertextfield_controller.dart';

class Custom_phonenumber_field extends StatefulWidget {
  final void Function(String)? onchanged;

  final color;
   Custom_phonenumber_field({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
    this.isPasswordField = true,
    this.onchanged,
    this.color,
    this.validation,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;
  String? Function(String?)? validation;

  @override
  State<Custom_phonenumber_field> createState() =>
      _Custom_phonenumber_fieldState();
}

class _Custom_phonenumber_fieldState extends State<Custom_phonenumber_field> {
  // textfild text = Get.put(textfild());
  bool isPasswordField = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            Text(
              widget.labelText,
              maxLines: 1,
              style:  TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Color(0xff294472),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          // height: 35,
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            // border: Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "🇮🇳 +91  ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w600),
              ),
              Expanded(
                child: TextFormField(
                  validator: widget.validation,
                  keyboardType: widget.number,
                  maxLength: widget.maxlength,
                  autocorrect: true,
                  // autofocus: true,
                  // maxLengthEnforcement: MaxLengthEnforcement.none,
                  style: GoogleFonts.notoSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: widget.controller,
                  cursorColor: Colors.black87,
                  cursorHeight: 20,

                  cursorWidth: 1.5,
                  obscureText: isPasswordField,
                  onChanged: widget.onchanged,

                  decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff294472),width: 0.5),),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: widget.color,
                        ),
                      )),
                  // border: InputBorder.none,
                  // fillColor: Colors.purple,
                  // focusedBorder: OutlineInputBorder(borderSide: )
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
      ],
    );
  }
}
