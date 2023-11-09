import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/set_pin.dart';
import 'package:lezrapp/mybusiness_screens/settings_screens/setting_screens.dart';
import 'package:lezrapp/sharedpref.dart';

import '../../controller.dart';
import '../../helper.dart';

class confirm_password extends StatefulWidget {
  final String code;
  const confirm_password({Key? key, required this.code}) : super(key: key);

  @override
  State<confirm_password> createState() => _confirm_passwordState();
}

class _confirm_passwordState extends State<confirm_password> {
  Controller c = Get.put(Controller());

  var selectedindex = 0;
  String codeconfirm = '';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: Colors.black.withBlue(40),
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff294472),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Set PIN',
                        style: GoogleFonts.comfortaa(
                            letterSpacing: 0.2,
                            fontSize: 20,
                            color: Color(0xff294472),
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: screenheight(context, dividedby: 16)),
              child: Image(
                image: AssetImage('assets/icon/set_pin_dark.png'),
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Confirm pin',
              style: GoogleFonts.notoSans(
                  color: Color(0xff294472),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DigitHolder(
                    selectedIndex: selectedindex,
                    index: 0,
                    width: width,
                    code: codeconfirm,
                  ),
                  DigitHolder(
                    selectedIndex: selectedindex,
                    index: 1,
                    width: width,
                    code: codeconfirm,
                  ),
                  DigitHolder(
                    selectedIndex: selectedindex,
                    index: 2,
                    width: width,
                    code: codeconfirm,
                  ),
                  DigitHolder(
                    selectedIndex: selectedindex,
                    index: 3,
                    width: width,
                    code: codeconfirm,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenheight(context, dividedby: 4)),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(1),
                          numbers: '1',
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(2),
                          numbers: '2',
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(3),
                          numbers: '3',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(4),
                          numbers: '4',
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(5),
                          numbers: '5',
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(6),
                          numbers: '6',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(7),
                          numbers: '7',
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(8),
                          numbers: '8',
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(9),
                          numbers: '9',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            backspace();
                          },
                          icon: Icon(
                            Icons.backspace_outlined,
                            color: Color(0xff294472),
                            size: 22,
                          ),
                        ),
                      ),
                      Expanded(
                        child: numbers_widget(
                          onTap: () => addDigit(0),
                          numbers: '0',
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  addDigit(int digit) {
    if (codeconfirm.length > 3) {
      return;
    }
    setState(() {
      codeconfirm = codeconfirm + digit.toString();
      print('Code is $codeconfirm');
      selectedindex = codeconfirm.length;
      if (codeconfirm.length == 4) {
        if (widget.code == codeconfirm) {
          setState(() {
            c.state.value = true;
          });
          SharedPref.save(value: codeconfirm, prefKey: PrefKey.setpin);
          Fluttertoast.showToast(msg: "Success..");
          Get.off(setting_screen());
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: Text("Password does not match?"),
                actions: [TextButton(onPressed: () {
                  Get.back();
                  Get.off(set_pin());
                  setState(() {
                    codeconfirm = "";
                  });
                }, child: Text("Ok"))]),
          );
        }
      }
    });
  }

  backspace() {
    if (codeconfirm.length == 0) {
      return;
    }
    setState(() {
      codeconfirm = codeconfirm.substring(0, codeconfirm.length - 1);
      selectedindex = codeconfirm.length;
    });
  }
}
