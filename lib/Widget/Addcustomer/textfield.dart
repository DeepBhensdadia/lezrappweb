import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../customertextfield_controller.dart';
import '../../new_widget/icon.dart';

class CommonTextField extends StatefulWidget {
   CommonTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
    this.validation,

    this.isPasswordField = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;
   String? Function(String?)? validation;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  textfild text = Get.put(textfild());
  bool isPasswordField = false;

  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
SizedBox(height: 10,),
          Row(
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
          SizedBox(
            // height: 35,
            child: ValueListenableBuilder(
              valueListenable: isFieldEmpty,
              builder: (context, value, child) => Container(
                width: double.infinity,
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  // border: Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
validator: widget.validation,
                  keyboardType: widget.number,
                  maxLength: widget.maxlength,
                  autocorrect: true,
                  // autofocus: true,
                  // maxLengthEnforcement: MaxLengthEnforcement.none,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: widget.controller,
                  cursorColor: Colors.black87,
                  cursorHeight: 20,

                  cursorWidth: 1.5,
                  obscureText: isPasswordField,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      isFieldEmpty.value = true;
                    } else {
                      isFieldEmpty.value = false;
                    }
                  },

                  decoration: InputDecoration(
                      suffixIcon: widget.isPasswordField
                          ? CustomIconButton(
                        onPressed: (val) => setState(() => isPasswordField = val),
                      )
                          : const SizedBox(),
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff294472),width: 0.5),),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: value ? Colors.red : Colors.green,
                        ),
                      )),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class pass_2 extends StatefulWidget {
   pass_2({Key? key,
    required this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
    this.validation,
    this.isPasswordField = false,}) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;
  String? Function(String?)? validation;
  @override
  State<pass_2> createState() => _pass_2State();
}

class _pass_2State extends State<pass_2> {
  textfild text = Get.put(textfild());
  bool isPasswordField = true;

  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
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
        SizedBox(
          // height: 35,
          child: ValueListenableBuilder(
            valueListenable: isFieldEmpty,
            builder: (context, value, child) => Container(
              width: double.infinity,
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                // border: Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextFormField(
                validator: widget.validation,
                keyboardType: widget.number,
                maxLength: widget.maxlength,
                autocorrect: true,
                // autofocus: true,
                // maxLengthEnforcement: MaxLengthEnforcement.none,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                controller: widget.controller,
                cursorColor: Colors.black87,
                cursorHeight: 30,

                cursorWidth: 1.5,
                obscureText: isPasswordField,
                onChanged: (value) {
                  if (value.isEmpty) {
                    isFieldEmpty.value = true;
                  } else {
                    isFieldEmpty.value = false;
                  }
                },

                decoration: InputDecoration(
                    suffixIcon: widget.isPasswordField
                        ? CustomIconButton(
                      onPressed: (val) => setState(() => isPasswordField = val),
                    )
                        : const SizedBox(),
                    counterText: '',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff294472),width: 0.5),),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: value ? Colors.red : Colors.green,
                      ),
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class phonetext extends StatefulWidget {
   phonetext({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.number,
    required this.colors,
    required this.maxlength,
    required this.onChanged,
     this.validation,
    this.isPasswordField = true,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;
  final void Function(String)? onChanged;
  final Color colors;
  String? Function(String?)? validation;

  @override
  State<phonetext> createState() => _phonetextState();
}

class _phonetextState extends State<phonetext> {
  textfild textcontroller = Get.put(textfild());
  bool isPasswordField = false;
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
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
        Container(
          // height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: TextFormField(
            validator: widget.validation,
            keyboardType: widget.number,
            maxLength: widget.maxlength,
            autocorrect: true,
            autofocus: false,
            // maxLengthEnforcement: MaxLengthEnforcement.none,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            controller: widget.controller,
            cursorColor: Colors.black87,
            cursorHeight: 30,
            cursorWidth: 1.5,
            obscureText: isPasswordField,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff294472),width: 0.5),),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: widget.colors),
                )),
            // border: InputBorder.none,
            // fillColor: Colors.purple,
            // focusedBorder: OutlineInputBorder(borderSide: )
          ),
        ),
      ],
    );
  }
}
