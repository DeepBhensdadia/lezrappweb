import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Widget/CG.dart';
import 'package:lezrapp/api_model/getcomapnystaff.dart';
import 'package:lezrapp/helper.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../Const.dart';
import '../../Widget/Addcustomer/textfield.dart';
import '../../Widget/customertextfield_controller.dart';
import '../../api/const_apis.dart';
import '../../getx controller/staff/staffcontroller.dart';

class add_staff extends StatefulWidget {
  final User? staffdetails;
  const add_staff({Key? key, this.staffdetails}) : super(key: key);

  @override
  State<add_staff> createState() => _add_staffState();
}

class _add_staffState extends State<add_staff> {
  File? profilepic;
  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (Selectedimage != null) {
      File convertedFile = File(Selectedimage.path);
      setState(() {
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
        profilepic = convertedFile;
      });

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);
  Staffcontroller _staffcontroller = Get.put(Staffcontroller());

  var regExp = r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$';
  // RegExp phone=RegExp(regExp);
  bool img_temp = false;
  bool state = false;
  updatestaff() async {
    context.loaderOverlay.show();
    // orderConroller.allpage =0;
    Map<String, dynamic> parameter = {
      "user_name": _staffcontroller.namecontroller.text,
      "mobile_no": _staffcontroller.phonecontroller.text,
      "is_active": state.toString(),
      "password": _staffcontroller.passwordcontroller.text,
      "company_id": saveuser()!.company.companyId,
      "user_id": saveuser()!.company.userId,
      "company_user_id": widget.staffdetails?.companyUserId
    };
    if (profilepic != null) {
      final bytes = await profilepic!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['image'] = base64Image;
    }
    await update_user_staff(parameter: parameter).then((value) {
      _staffcontroller.staff.clear();
      _staffcontroller.getsataffusers2();
      // transaction_Conroller.getpages2("0");

      Fluttertoast.showToast(msg: value.message ?? "");
      log(value.toString());
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      print(error);
    });
  }

  addstaff() async {
    context.loaderOverlay.show();
    // orderConroller.allpage =0;
    Map<String, dynamic> parameter = {
      "user_name": _staffcontroller.namecontroller.text,
      "mobile_no": _staffcontroller.phonecontroller.text,
      "is_active": state.toString(),
      "password": _staffcontroller.passwordcontroller.text,
      "company_id": saveuser()!.company.companyId,
      "user_id": saveuser()!.company.userId
    };
    if (profilepic != null) {
      final bytes = await profilepic!.readAsBytes();
      final base64Image = base64Encode(bytes);
      parameter['image'] = base64Image;
    }
    await add_user_staff(parameter: parameter).then((value) {
      _staffcontroller.staff.clear();
      _staffcontroller.getsataffusers2();
      // context.loaderOverlay.hide();
      // transaction_Conroller.getpages2("0");
      Fluttertoast.showToast(msg: value.message ?? "");
      showSuccessPopup(Get.context!);
      log(value.toString());
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();
      print(error);
    });
  }

  @override
  void initState() {
    _staffcontroller.namecontroller.text = widget.staffdetails?.userName ?? "";
    _staffcontroller.phonecontroller.text = widget.staffdetails?.mobileNo ?? "";
    state = widget.staffdetails?.isActive ?? false;

    // image = widget.staffdetails?.userName ?? "";
    // textcontroller.namecontroller.text = widget.staffdetails?.userName ?? "";

    // TODO: implement initState
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  bool imagecheck = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        appBar: AppBar(
          backgroundColor: custom,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: 60,
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
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.staffdetails != null
                          ? "Edit Staff"
                          : 'Add Staff'.tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                        widget.staffdetails != null
                            ? updatestaff()
                            : addstaff();}
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
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
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
                   widget.staffdetails != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {
                                showmodelottomsheet();
                              },
                              child: profilepic != null ? Container(
                                alignment: Alignment.bottomCenter,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,

                                        image:
                                            FileImage(File(profilepic!.path))),
                                    border: Border.all(width: 1, color: custom),
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
                              ): widget.staffdetails!.image.isNotEmpty ?Container(
                                alignment: Alignment.bottomCenter,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                        image:
                                        NetworkImage(widget.staffdetails!.image)),
                                    border: Border.all(width: 1, color: custom),
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
                              ):Container(
                                alignment: Alignment.bottomCenter,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage('assets/img/user.png')),
                                    border: Border.all(width: 1, color: custom),
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
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: GestureDetector(
                              onTap: () {
                                showmodelottomsheet();
                              },
                              child:profilepic != null ? Container(
                                alignment: Alignment.bottomCenter,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                        FileImage(File(profilepic!.path))),
                                    border: Border.all(width: 1, color: custom),
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
                              ): Container(
                                alignment: Alignment.bottomCenter,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                        image:
                                           AssetImage('assets/img/user.png')),
                                    border: Border.all(width: 1, color: custom),
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ValueListenableBuilder(
                              valueListenable: isFieldEmpty,
                              builder: (context, value, child) => phonetext(
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phonenumber is required';
                                    }
                                    return null;
                                  },
                                  controller: _staffcontroller.phonecontroller,
                                  labelText: "Mobil No.".tr,
                                  onChanged: (value) {
                                    if (_staffcontroller
                                            .phonecontroller.text.length <=
                                        9) {
                                      isFieldEmpty.value = true;
                                    } else {
                                      isFieldEmpty.value = true;
                                    }
                                  },
                                  number: TextInputType.phone,
                                  colors: value ? Colors.red : Colors.green,
                                  maxlength: 10),
                            ),
                            CommonTextField(
                              isPasswordField: false,
                              maxlength: 200,
                              number: TextInputType.name,
                              controller: _staffcontroller.namecontroller,
                              labelText: "Name".tr,
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Name is required';
                                }
                                return null;
                              },
                            ),
                            pass_2(
                              isPasswordField: true,
                              maxlength: 300,
                              number: TextInputType.text,
                              controller: _staffcontroller.passwordcontroller,
                              labelText: "Password".tr,
                              // validation: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'password is required';
                              //   }
                              //   return null;
                              // },
                            ),
                            pass_2(
                              isPasswordField: true,
                              maxlength: 500,
                              number: TextInputType.emailAddress,
                              controller: _staffcontroller.confirmpasswordcontroller,
                              labelText: "Confirm Password".tr,
                              // validation: (value) {
                              //   if (value == _staffcontroller.passwordcontroller.text) {
                              //     return "password doesn't Match";
                              //   }
                              //   return null;
                              // },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Active',
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
                                    FlutterSwitch(
                                      width: 40.0,
                                      height: 20.0,
                                      activeColor: Color(0xff294472),
                                      valueFontSize: 0,
                                      toggleSize: 10.0,
                                      value: state,
                                      borderRadius: 20.0,

                                      showOnOff: true,
                                      onToggle: (val) {
                                        setState(
                                          () {
                                            state = val;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Color(0xff294472),
                              thickness: 0.5,
                              // height: screenheight(context, dividedby: 11),
                            ),
                            SizedBox(
                              height: screenheight(context, dividedby: 3.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showmodelottomsheet() {
    showModalBottomSheet(
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
                            child: Icon(Icons.cancel,
                                color: Color(0xff909196).withOpacity(1))),
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
