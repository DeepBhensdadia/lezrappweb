import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/new_widget/textfild.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api_model/login/staff_login_model.dart';
import '../../new_widget/bottun.dart';
import '../../sharedpref.dart';

class newotp_screen extends StatefulWidget {
  final String mobileno;
  newotp_screen({Key? key, required this.mobileno}) : super(key: key);

  @override
  State<newotp_screen> createState() => _newotp_screenState();
}

class _newotp_screenState extends State<newotp_screen> {
  TextEditingController newotpcontroller = TextEditingController();
  changephonenumber() async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      // "${saveuser()!.company.auth}":"",
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'company_mobile_no': widget.mobileno,
    };
    await editphonenumber(parameter: parameter).then((value) {
      SLogin saveuser =
      sLoginFromJson(SharedPref.get(prefKey: PrefKey.saveuser)!);
      if (value.profile != null) {
        saveuser = saveuser.copyWith(
            company: Company.fromJson((value.profile.toJson())));

        SharedPref.save(
            value: jsonEncode(saveuser.toJson()), prefKey: PrefKey.saveuser);
      }
      Fluttertoast.showToast(msg: value.message);
      log(jsonEncode(saveuser).toString());
      Get.back();
      Get.context!..loaderOverlay.hide();
      showSuccessPopup(Get.context!);
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print("....$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Number'),
        backgroundColor: custom,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Verify",
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter the OTP sent to +91${widget.mobileno}",
              style: GoogleFonts.notoSans(
                  color: Colors.grey.shade600, fontSize: 15),
            ),
            SizedBox(
              height: 90,
            ),
            common2_0(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: newotpcontroller,
              hintText: "......",
              isPasswordField: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () async {
                  await verifyotp(
                          mobileno: widget.mobileno, otp: newotpcontroller.text)
                      .then((value) {
                    if (value.type == "success")
                    changephonenumber();
                  }).onError((error, stackTrace) {
                    print(error);
                  });
                  // Get.off(editbusiness_screen());
                },
                name: "VERIFY"),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                await resendotp(mobileno: widget.mobileno).then((value) {
                  Fluttertoast.showToast(msg: value.message.toString())
                      .onError((error, stackTrace) {
                    print(error);
                  });
                });
              },
              child: Text(
                "RESEND OTP",
                style: GoogleFonts.notoSans(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
