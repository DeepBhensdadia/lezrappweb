import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lezrapp/getx%20controller/summarycontroller.dart';
import 'package:lezrapp/mybusiness_screens/business_card/businesscard_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../Const.dart';
import '../Widget/Addcustomer/textfield.dart';
import '../api/const_apis.dart';
import '../api_model/login/staff_login_model.dart';
import '../api_model/type_model.dart';
import '../getx controller/editprofile.dart';
import '../sharedpref.dart';
import 'editbusiness/change_phonenumber.dart';

class editbusiness_screen extends StatefulWidget {
  editbusiness_screen({Key? key}) : super(key: key);

  @override
  State<editbusiness_screen> createState() => _editbusiness_screenState();
}

class _editbusiness_screenState extends State<editbusiness_screen> {
  Editprofile edit = Get.put(Editprofile());
  File? profilepic;
  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (Selectedimage != null) {
      File convertedFile = File(Selectedimage.path);
      setState(() {
        img_temp = true;
        profilepic = convertedFile;
      });

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  Future<void> pickcoverimagegallary() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (Selectedimage != null) {
      File convertedFile = File(Selectedimage.path);
      setState(() {
        img_temp = true;
        profilepic = convertedFile;
      });

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  bool img_temp = false;

  TextEditingController B_Name =
      TextEditingController(text: saveuser()?.company.companyName);
  TextEditingController l_Name =
      TextEditingController(text: saveuser()?.company.companyAddress);
  // TextEditingController Location = TextEditingController(text: "surat");
  TextEditingController Changephone =
      TextEditingController(text: saveuser()?.company.companyMobileNo);
  TextEditingController Changeemail =
      TextEditingController(text: saveuser()?.company.companyEmail);
  TextEditingController GSTNumber =
      TextEditingController(text: saveuser()?.company.companyGstin);
  TextEditingController Website =
      TextEditingController(text: saveuser()?.company.companyWebsite);
  TextEditingController Description =
      TextEditingController(text: saveuser()?.company.companyDescription);
  TextEditingController Bank_Name =
      TextEditingController(text: saveuser()?.company.bankName);
  TextEditingController AC_Number =
      TextEditingController(text: saveuser()?.company.acNo);
  TextEditingController IFSC_Code =
      TextEditingController(text: saveuser()?.company.ifscCode);

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController staffname = TextEditingController();
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  @override
  void initState() {
    edit.businesstype();
    if (saveuser()?.user != null) {
      staffname.text = saveuser()?.user.userName;
    }
    super.initState();
  }

  updatestaff() async {
    // orderConroller.allpage =0;
    Map<String, dynamic> parameter = {
      "user_name": staffname.text,
      "mobile_no": saveuser()!.user.mobileNo,
      "is_active": "true",
      "password": confirmpassword.text,
      "company_id": saveuser()!.company.companyId,
      "user_id": saveuser()!.company.userId,
      "company_user_id": saveuser()!.user.companyUserId
    };
    if (profilepic != null) {
      final bytes = await profilepic!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['image'] = base64Image;
    }
    await update_user_staff(parameter: parameter).then((value) {
      Fluttertoast.showToast(msg: value.message ?? "");
      log(value.toString());
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  adddata() async {
    Get.context!.loaderOverlay.show();

    Map<String, dynamic> parameter = {
      // "${saveuser()!.company.auth}":"",
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'company_name': B_Name.text,
      'company_type_id': saveuser()!.company.companyTypeId,
      'is_subscribe': saveuser()!.company.isSubscribe == true ? "1" : "0",
      'company_email': Changeemail.text,
      'company_gstin': GSTNumber.text,
      'company_address': l_Name.text,
      'company_mobile_no': Changephone.text,
      'company_website': Website.text,
      'company_description': Description.text,
      'bank_name': Bank_Name.text,
      'ac_no': AC_Number.text,
      'ifsc_code': IFSC_Code.text
    };
    if (profilepic != null) {
      final bytes = await profilepic!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['company_photo'] = base64Image;
    }
    await editorupdateprofe(parameter: parameter).then((value) {
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
      Get.context!..loaderOverlay.hide();
      showSuccessPopup(Get.context!);
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print("....$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              children: [
                Container(
                  height: 56,
                  color: custom,
                  child: Row(
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
                                color: Colors.white,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Edit Business'.tr,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                letterSpacing: 0.2,
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              _summarycontroller.staff.isTrue
                                  ? updatestaff()
                                  : adddata();
                            },
                            child: Text(
                              'SAVE'.tr,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: _summarycontroller.staff.isTrue
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        saveuser()?.user.image != null || profilepic != null
                            ? profilepic != null
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: InkWell(
                                      onTap: () {
                                        pickgallarycamera();
                                      },
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: FileImage(
                                                    File(profilepic!.path))),
                                            border: Border.all(
                                                width: 1,
                                                color: custom),
                                            shape: BoxShape.circle),
                                        child: Container(
                                          height: 45,
                                          alignment: Alignment.bottomCenter,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff909196)
                                                .withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(100),
                                              bottomRight: Radius.circular(100),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              'Add Pictures'.tr,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Display',
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: InkWell(
                                      onTap: () {
                                        pickgallarycamera();
                                      },
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    saveuser()?.user.image)),
                                            border: Border.all(
                                                width: 1,
                                                color: custom),
                                            shape: BoxShape.circle),
                                        child: Container(
                                          height: 45,
                                          alignment: Alignment.bottomCenter,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff909196)
                                                .withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(100),
                                              bottomRight: Radius.circular(100),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              'Add Pictures'.tr,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Display',
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                            : Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    pickgallarycamera();
                                  },
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/img/user.png')),
                                        border: Border.all(
                                            width: 1,
                                            color:custom),
                                        shape: BoxShape.circle),
                                    child: Container(
                                      height: 45,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff909196)
                                            .withOpacity(0.3),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          'Add Pictures'.tr,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: card_textfild(
                          icon: Icon(
                            Icons.business,
                            color: custom,
                          ),
                          isPasswordField: true,
                          controller: staffname,
                          labelText: 'Business Name'.tr,
                          number: TextInputType.name,
                          maxlength: 100),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CommonTextField(
                        controller: password,
                        labelText: 'Password',
                        number: TextInputType.text,
                        maxlength: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CommonTextField(
                        controller: confirmpassword,
                        labelText: 'Confirm Password',
                        number: TextInputType.text,
                        maxlength: 20,
                      ),
                    )
                  ],
                )
              : GetBuilder<Editprofile>(
                  builder: (controller) => controller.show.isFalse
                      ? Center(
                          child: CircularProgressIndicator(
                            color: custom,
                          ),
                        )
                      : NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (notification) {
                            notification.disallowIndicator();
                            return false;
                          },
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Card(
                                elevation: 25,
                                shadowColor: Colors.black,
                                child: Column(
                                  children: [
                                    saveuser()?.company.companyPhoto != null ||
                                            profilepic != null
                                        ? profilepic != null
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: InkWell(
                                                  onTap: () {
                                                    pickgallarycamera();
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                File(profilepic!
                                                                    .path))),
                                                        border: Border.all(
                                                            width: 1,
                                                            color:custom),
                                                        shape: BoxShape.circle),
                                                    child: Container(
                                                      height: 45,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                                0xff909196)
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  100),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  100),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 20),
                                                        child: Text(
                                                          'Add Pictures'.tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: InkWell(
                                                  onTap: () {
                                                    pickgallarycamera();
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                saveuser()
                                                                    ?.company
                                                                    .companyPhoto)),
                                                        border: Border.all(
                                                            width: 1,
                                                            color:custom),
                                                        shape: BoxShape.circle),
                                                    child: Container(
                                                      height: 45,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                                0xff909196)
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  100),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  100),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 20),
                                                        child: Text(
                                                          'Add Pictures'.tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: GestureDetector(
                                              onTap: () {
                                                pickgallarycamera();
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/img/user.png')),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: custom),
                                                    shape: BoxShape.circle),
                                                child: Container(
                                                  height: 45,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff909196)
                                                            .withOpacity(0.3),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(100),
                                                      bottomRight:
                                                          Radius.circular(100),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20),
                                                    child: Text(
                                                      'Add Pictures'.tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    Divider(
                                      color: Colors.transparent,
                                      thickness: 0.5,
                                      indent: 150,
                                      endIndent: 150,
                                    ),
                                    Container(
                                      height: 23,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.pink),
                                      child: Center(
                                        child: Text(
                                          'Admin',
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        card_textfild(
                                            icon: Icon(
                                              Icons.business,
                                              color: custom
                                            ),
                                            isPasswordField: true,
                                            controller: B_Name,
                                            labelText: 'Business Name'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.business,
                                              color: custom,
                                            ),
                                            controller: l_Name,
                                            labelText: 'Location'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30, left: 15, right: 45),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Mobil Number.'.tr,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                        custom,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(chenge_phonenumber());
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(8),
                                                      // height: 23,
                                                      // width: 70,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.pink),
                                                      child: Center(
                                                        child: Text(
                                                          'Change Number.',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              color: Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ValueListenableBuilder(
                                              valueListenable: isFieldEmpty,
                                              builder:
                                                  (context, value, child) =>
                                                      Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "🇮🇳 +91  ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Expanded(
                                                      child: TextField(
                                                        keyboardType:
                                                            TextInputType.name,
                                                        maxLength: 100,
                                                        // autocorrect: true,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        controller: Changephone,
                                                        cursorColor:
                                                            Colors.black87,
                                                        cursorHeight: 30,
                                                        cursorWidth: 1.5,
                                                        // obscureText: isPasswordField,
                                                        // onChanged: widget.onchange,
                                                        // onChanged: (value) {
                                                        //   if (value.isEmpty) {
                                                        //     isFieldEmpty.value = true;
                                                        //   } else {
                                                        //     isFieldEmpty.value = false;
                                                        //   }
                                                        // },
                                                        decoration:
                                                            InputDecoration(
                                                          // prefixIcon: widget.icon,
                                                          counterText: '',
                                                          // border: InputBorder.none,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 0.5),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              width: 2,
                                                              color: value
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .green,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.email,
                                              color:custom,
                                            ),
                                            controller: Changeemail,
                                            labelText: 'Email'.tr,
                                            number: TextInputType.emailAddress,
                                            maxlength: 100),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.numbers,
                                              color:custom,
                                            ),
                                            controller: GSTNumber,
                                            labelText: 'GSTIN',
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        // Stack(children: [
                                        //   Column(
                                        //     children: [
                                        //       Padding(
                                        //         padding:
                                        //             const EdgeInsets.only(top: 30, left: 15),
                                        //         child: Row(
                                        //           children: [
                                        //             Text(
                                        //               'Website',
                                        //               maxLines: 1,
                                        //               style: GoogleFonts.notoSans(
                                        //                   color: Color(0xff294472),
                                        //                   fontSize: 16,
                                        //                   fontWeight: FontWeight.w600),
                                        //               textAlign: TextAlign.center,
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //       ValueListenableBuilder(
                                        //         valueListenable: isFieldEmpty,
                                        //         builder: (context, value, child) => Container(
                                        //           decoration: BoxDecoration(
                                        //             borderRadius: BorderRadius.circular(10.0),
                                        //           ),
                                        //           child: TextField(
                                        //             keyboardType: TextInputType.name,
                                        //             autocorrect: true,
                                        //             style: const TextStyle(
                                        //               color: Colors.black,
                                        //               letterSpacing: 1,
                                        //             ),
                                        //             controller: Website,
                                        //             cursorColor: Colors.black87,
                                        //             cursorHeight: 30,
                                        //             cursorWidth: 1.5,
                                        //             onChanged: (value) {
                                        //               if (value.isEmpty) {
                                        //                 isFieldEmpty.value = true;
                                        //               } else {
                                        //                 isFieldEmpty.value = false;
                                        //               }
                                        //             },
                                        //             decoration: InputDecoration(
                                        //               counterText: '',
                                        //               enabledBorder: UnderlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color: Colors.grey, width: 0.5),
                                        //               ),
                                        //               focusedBorder: UnderlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                   width: 2,
                                        //                   color:
                                        //                       value ? Colors.red : Colors.green,
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   Image(
                                        //       height: 25,
                                        //       width: 25,
                                        //       image: AssetImage(
                                        //           'assets/new/browser.png')),
                                        // ]),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.web,
                                              color:custom,
                                            ),
                                            controller: Website,
                                            labelText: 'Website'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.description,
                                              color: custom,
                                            ),
                                            controller: Description,
                                            labelText: 'Description'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, left: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Select Business Type'.tr,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    color: custom,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        DropdownButtonFormField<BusinessType>(
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.ac_unit,
                                              color: custom,
                                            ),
                                            hintText: '-Business Type-',
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: custom,
                                                  width: 0.5),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          value: edit.categori.businessTypes
                                              .firstWhere((element) =>
                                                  element.businessType ==
                                                  saveuser()
                                                      ?.company.businessType),
                                          items: edit.categori.businessTypes
                                              .map(
                                                (e) => DropdownMenuItem<
                                                    BusinessType>(
                                                  value: e,
                                                  child: Container(
                                                    width: 200,
                                                    child: Text(
                                                      e.businessType,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          // overflow: TextOverflow.ellipsis,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (value) {
                                            // card.businesstypetext(value!.businessType);
                                          },
                                        ),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.account_balance,
                                              color: custom,
                                            ),
                                            controller: Bank_Name,
                                            labelText: 'Bank Name'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.numbers,
                                              color:custom,
                                            ),
                                            controller: AC_Number,
                                            labelText: 'Account Number'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        card_textfild(
                                            icon: Icon(
                                              Icons.numbers,
                                              color: custom,
                                            ),
                                            controller: IFSC_Code,
                                            labelText: 'IFSC Code'.tr,
                                            number: TextInputType.name,
                                            maxlength: 100),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                )),
    );
  }

  pickgallarycamera() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 195,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Change option".tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff909196).withOpacity(1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    Get.back();
                    pickcoverimagecamera();
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                            child: Icon(Icons.camera_alt,
                                color: Color(0xff909196).withOpacity(1))),
                        const SizedBox(
                          width: 18,
                        ),
                        Center(
                            child: Text("Camera".tr,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Get.back();

                    pickcoverimagegallary();
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                            child: Icon(Icons.image_rounded,
                                color: Color(0xff909196).withOpacity(1))),
                        SizedBox(
                          width: 18,
                        ),
                        Center(
                          child: Text(
                            "Gallery".tr,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Center(
                          child: Text(
                            "Close".tr,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
