import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';

import '../../Widget/Addcustomer/textfield.dart';
import '../../api/const_apis.dart';
import 'otp_screentochangeno.dart';

class enternewnumber_screen extends StatelessWidget {
  enternewnumber_screen({Key? key}) : super(key: key);

  TextEditingController newnumber = TextEditingController();
  TextEditingController oldnumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Change number'),
        backgroundColor:custom,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 13, 0, 13),
        child: Column(
          children: [
            CommonTextField(
                isPasswordField: false,
                controller: oldnumber,
                labelText: 'Enter your old phone number',
                number: TextInputType.number,
                maxlength: 10),
            CommonTextField(
                isPasswordField: false,
                controller: newnumber,
                labelText: 'Enter your new phone number',
                number: TextInputType.number,
                maxlength: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: BoxDecoration(
                    color:custom,
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: 90,
                child: InkWell(
                  onTap: () async {
                    if(saveuser()?.company.companyMobileNo == oldnumber.text){
                    await sendotp(mobileno: newnumber.text).then((value) {
                      Fluttertoast.showToast(msg: value.type);
                      Get.off(newotp_screen(
                        mobileno: newnumber.text,
                      ));
                    }).onError((error, stackTrace) {
                      print(error);
                    });}else{
                      Fluttertoast.showToast(msg: "Old Phone number is not match");
                    }
                  },
                  child: Center(
                    child: Text("NEXT",
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
