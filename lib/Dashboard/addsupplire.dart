import 'dart:io';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lezrapp/api_model/customers/get_customers_api.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Const.dart';
import '../Widget/Addcustomer/phonenumber_custom.dart';
import '../Widget/Addcustomer/textfield.dart';
import '../Widget/customertextfield_controller.dart';
import '../getx controller/customer/addcustomerdata.dart';
import '../getx controller/customer/getcustomersdatamybussiness.dart';

class AddSupplire extends StatefulWidget {
  final Customer? about;
  AddSupplire({super.key, this.about});

  @override
  State<AddSupplire> createState() => _AddSupplireState();
}

class _AddSupplireState extends State<AddSupplire> {
  AddSuppliredata addcuscontroller = Get.put(AddSuppliredata());
  AddCustomerdata addcuscontrollerdata = Get.put(AddCustomerdata());

  Contact? _selectedContact;

  void _requestContactsPermission() async {
    PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      await _pickContact();
    } else {
      print("notgranted");
    }
  }

  Future<void> _pickContact() async {
    if (await Permission.contacts.request().isGranted) {
      try {
        Contact? contact = await ContactsService.openDeviceContactPicker();
        setState(() {
          _selectedContact = contact;
        });

        if (_selectedContact?.displayName != null) {
          addcuscontroller.namecontroller_1.text =
              _selectedContact!.displayName ?? "";
        }
        if (_selectedContact?.phones != null) {
          if (_selectedContact?.phones?.length == 1) {
            addcuscontroller.phonecontroller_1.text =
                _selectedContact?.phones?.first.value ?? "";
            addcuscontroller.adddata(customertypeid: "2");
            cleartext(addcuscontroller);
          } else {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('${_selectedContact?.phones?[index].value}'),
                      onTap: () {
                        if (_selectedContact?.displayName != null) {
                          addcuscontroller.namecontroller_1.text =
                              _selectedContact!.displayName ?? "";
                        }
                        String? number = _selectedContact?.phones?[index].value
                            ?.replaceAll("+91", "");
                        addcuscontroller.phonecontroller_1.text = number ?? "";
                        Navigator.pop(context);
                        addcuscontroller.adddata(customertypeid: "2");
                        cleartext(addcuscontroller);
                      },
                    );
                  },
                );
              },
            );
          }
        }
      } catch (e) {
        // Handle error if the contact picker fails
        print('Contact picker error: $e');
      }
    } else {
      // Handle case when the user denies the contacts permission
      print('Contacts permission denied');
    }
  }

  File? profilepic;
  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      imageQuality: 25,
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
      imageQuality: 25,
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    addcuscontroller.namecontroller_1.text = widget.about?.customerName ?? "";
    addcuscontroller.phonecontroller_1.text =
        widget.about?.customerMobileNo ?? "";
    addcuscontroller.gstincontroller_1.text = widget.about?.customerGstin ?? "";
    addcuscontroller.addresscontroller_1.text =
        widget.about?.customerAddress ?? "";
    addcuscontroller.remarkcontroller_1.text =
        widget.about?.customerRemark ?? "";
    addcuscontroller.emaicontrollerl_1.text = widget.about?.customerEmail ?? "";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        appBar: AppBar(
          backgroundColor: custom,
          // automaticallyImplyLeading: false,
          title: Text(
            widget.about != null ? "Editsupplier " : 'AddSupplier'.tr,
            style: TextStyle(
                fontFamily: 'SF Pro Display',
                letterSpacing: 0.2,
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _requestContactsPermission();
              },
              icon: const Icon(
                size: 30,
                Icons.contacts,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  widget.about != null
                      ? addcuscontrollerdata.editdata(
                          customerphotu: profilepic,
                          customertypeid: widget.about?.customerTypeId ?? "2",
                          CUSTOMEID: widget.about?.customerId ?? "")
                      : addcuscontroller.adddata(
                          customerphotu: profilepic, customertypeid: "2");
                  Get.back();
                  cleartext(addcuscontroller);
                }
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
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          widget.about != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InkWell(
                                    onTap: () {
                                      pickgallarycamera();
                                    },
                                    child: profilepic != null
                                        ? Container(
                                            alignment: Alignment.bottomCenter,
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: FileImage(File(
                                                        profilepic!.path))),
                                                border: Border.all(
                                                    width: 1, color: custom),
                                                shape: BoxShape.circle),
                                            child: Container(
                                              height: 45,
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff909196)
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
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
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
                                          )
                                        : widget.about!.customerPhoto.isNotEmpty
                                            ? Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            widget.about!
                                                                .customerPhoto)),
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
                                              )
                                            : Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
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
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      pickgallarycamera();
                                    },
                                    child: profilepic != null
                                        ? Container(
                                            alignment: Alignment.bottomCenter,
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: FileImage(File(
                                                        profilepic!.path))),
                                                border: Border.all(
                                                    width: 1, color: custom),
                                                shape: BoxShape.circle),
                                            child: Container(
                                              height: 45,
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff909196)
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
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
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
                                          )
                                        : Container(
                                            alignment: Alignment.bottomCenter,
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/img/user.png')),
                                                border: Border.all(
                                                    width: 1, color: custom),
                                                shape: BoxShape.circle),
                                            child: Container(
                                              height: 45,
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff909196)
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
                                                padding:
                                                    EdgeInsets.only(bottom: 20),
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CommonTextField(
                                  isPasswordField: false,
                                  maxlength: 200,
                                  number: TextInputType.name,
                                  controller: addcuscontroller.namecontroller_1,
                                  labelText: "Name".tr,
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name is required';
                                    }
                                    return null;
                                  },
                                ),
                                ValueListenableBuilder(
                                  valueListenable: isFieldEmpty,
                                  builder: (context, value, child) =>
                                      Custom_phonenumber_field(
                                    onchanged: (value) {
                                      if (value.isEmpty) {
                                        isFieldEmpty.value = true;
                                      } else {
                                        if (addcuscontroller.phonecontroller_1
                                                .text.length <=
                                            9) {
                                          isFieldEmpty.value = true;
                                        } else {
                                          isFieldEmpty.value = false;
                                        }
                                      }
                                    },
                                    color: value ? Colors.red : Colors.green,
                                    maxlength: 10,
                                    number: TextInputType.phone,
                                    controller:
                                        addcuscontroller.phonecontroller_1,
                                    labelText: "Mobil No.".tr,
                                    // validation: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return 'Mobile No. is required';
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                ),
                                CommonTextField(
                                  isPasswordField: false,
                                  maxlength: 300,
                                  number: TextInputType.text,
                                  controller:
                                      addcuscontroller.addresscontroller_1,
                                  labelText: "Address".tr,
                                  // validation: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Address is required';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                CommonTextField(
                                  isPasswordField: false,
                                  maxlength: 200,
                                  number: TextInputType.emailAddress,
                                  controller:
                                      addcuscontroller.emaicontrollerl_1,
                                  labelText: "Email".tr,
                                  // validation: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Email is required';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                CommonTextField(
                                  isPasswordField: false,
                                  maxlength: 15,
                                  number: TextInputType.text,
                                  controller:
                                      addcuscontroller.gstincontroller_1,
                                  labelText: "GSTIN".tr,
                                ),
                                CommonTextField(
                                  isPasswordField: false,
                                  maxlength: 500,
                                  number: TextInputType.text,
                                  controller:
                                      addcuscontroller.remarkcontroller_1,
                                  labelText: "Remark".tr,
                                ),
                                SizedBox(
                                  height: 130,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 5,
              color: Color(0xffF1BC5E),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              height: 0,
              thickness: 5,
              color: custom,
            ),
          ],
        ),
      ),
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
