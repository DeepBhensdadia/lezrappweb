import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widget/customertextfield_controller.dart';
import 'icon.dart';

class CommonTextField2 extends StatefulWidget {
   CommonTextField2({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textAlign,
     this.mexnumber,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
   int? mexnumber;
  final TextAlign textAlign;
  final TextInputType keyboardType;

  @override
  State<CommonTextField2> createState() => _CommonTextField2State();
}

class _CommonTextField2State extends State<CommonTextField2> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff909196).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: TextField(
            cursorColor: Colors.black,
            cursorHeight: 30,
            textAlign: widget.textAlign,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
            ),
            maxLength: widget.mexnumber,
            controller: widget.controller,
            obscureText: false,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              // fillColor: Colors.purple,
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.notoSans(fontSize: 15, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

class common2_0 extends StatefulWidget {
  const common2_0({Key? key,
    required this.controller,
    required this.hintText,
    required this.textAlign,
    required this.keyboardType,
    this.isPasswordField=false,}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final bool isPasswordField;

  @override
  State<common2_0> createState() => _common2_0State();
}

class _common2_0State extends State<common2_0> {
  bool isPasswordField = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff909196).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: TextField(
            cursorColor: Colors.black,
            cursorHeight: 30,
            textAlign: widget.textAlign,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
            ),
            controller: widget.controller,
            obscureText: isPasswordField,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              // fillColor: Colors.purple,
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.notoSans(fontSize: 15, color: Colors.grey),
              suffixIcon: widget.isPasswordField
                  ? CustomIconButton(
                onPressed: (val) => setState(() => isPasswordField = val),
              )
                  : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}



class edit_trxtfild extends StatefulWidget {
  edit_trxtfild({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
    this.isPasswordField = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;

  @override
  State<edit_trxtfild> createState() => _edit_trxtfildState();
}

class _edit_trxtfildState extends State<edit_trxtfild> {
  textfild textcontroller = Get.put(textfild());
  late bool isPasswordField = false;
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Row(
            children: [
              Text(
                widget.labelText,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    color: Color(0xff294472),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isFieldEmpty,
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                keyboardType: widget.number,
                maxLength: widget.maxlength,
                autocorrect: true,
                autofocus: false,
                // maxLengthEnforcement: MaxLengthEnforcement.none,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.black,
                  letterSpacing: 1,
                ),
                controller: widget.controller,
                cursorColor: Colors.black87,
                cursorHeight: 30,
                cursorWidth: 1.5,
                obscureText: widget.isPasswordField,
                onChanged: (value) {
                  if (value.isEmpty) {
                    isFieldEmpty.value = true;
                  } else {
                    isFieldEmpty.value = false;
                    // isFieldEmpty.value = false;/
                  }
                },
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff294472),width: 1)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                  ),
                  suffixIcon: widget.isPasswordField
                      ? CustomIconButton(
                    onPressed: (val) =>
                        setState(() => isPasswordField = val),
                  )
                      : const SizedBox(),
                ),
                // border: InputBorder.none,
                // fillColor: Colors.purple,
                // focusedBorder: OutlineInputBorder(borderSide: )
              ),
            ),
          ),
        ),
      ],
    );
  }
}