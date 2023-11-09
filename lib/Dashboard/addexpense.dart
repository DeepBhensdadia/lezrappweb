import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/Widget/Addcustomer/textfield.dart';
import 'package:lezrapp/api_model/expense/expense_api.dart';
import 'package:lezrapp/api_model/expense/get_expense_api.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:search_choices/search_choices.dart';
import '../api/const_apis.dart';
import '../Widget/customertextfield_controller.dart';
import '../getx controller/order_expense/addexpence_order.dart';
import '../getx controller/order_expense/orderexpensecontroller.dart';
import '../getx controller/summarycontroller.dart';
import '../helper.dart';
import '../mybusiness_screens/customer/customer_info.dart';

class AddExpense extends StatefulWidget {
  final String? back;
  final Expense_all? about;
  AddExpense( {this.about, this.back});
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  // addorder_expense expensecontroller = Get.put(addorder_expense());
  Orderexpensecontroller orderConroller = Get.put(Orderexpensecontroller());

  List<File> _imagePaths = [];

  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      imageQuality: 25,
      source: ImageSource.camera,
    );

    if (Selectedimage != null) {
      File convertedFile = File(Selectedimage.path);
      setState(() {
        _imagePaths.add(convertedFile);
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
        _imagePaths.add(convertedFile);
      });

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  String ex_type = '';
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  bool img_temp = false;
  TextEditingController amount = TextEditingController();
  TextEditingController Details = TextEditingController();
  TextEditingController Date = TextEditingController();
  addexpense({required String expensetypeid, required String date}) async {
    context.loaderOverlay.show();

    orderConroller.allpage = 0;
    Map<String, dynamic> parameter = {
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'amount': amount.text,
      'date': date,
      'remark': Details.text,
      'expense_type_id': expensetypeid,
      'company_user_id':  _summarycontroller.staff.isTrue ? saveuser()?.user.companyUserId :"0"
    };
    await add_karo_expense(parameter: parameter).then((value) {
      if(_imagePaths.isNotEmpty){
        _imagePaths.forEach((element) async {
          final bytes = await element.readAsBytes();
          final base64Image = base64Encode(bytes);
          Map<String, dynamic> parameter = {
            'expense_id': value.expenseId.toString(),
            'company_id': saveuser()!.company.companyId,
            'user_id': saveuser()!.company.userId,
            'image': base64Image
          };

          await uloadexpensesimage(parameter: parameter).then((value) {
            Fluttertoast.showToast(msg: value.message);
          }).onError((error, stackTrace) {});
        });
      }
      orderConroller.getexpense2();
      log(value.toString());
      context.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();

      print(error);
    });
  }

  editexpense(
      {required String expensetypeid,
      required String expenseid,
      required String date}) async {
    context.loaderOverlay.show();

    orderConroller.allpage = 0;
    Map<String, dynamic> parameter = {
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'amount': amount.text,
      'date': date,
      'remark': Details.text,
      'expense_type_id': expensetypeid,
      'company_user_id': _summarycontroller.staff.isTrue ? saveuser()?.user.companyUserId :"0",
      "expense_id": expenseid
    };
    await update_karo_expense(parameter: parameter).then((value) {
      if(_imagePaths.isNotEmpty){
        _imagePaths.forEach((element) async {
          final bytes = await element.readAsBytes();
          final base64Image = base64Encode(bytes);
          Map<String, dynamic> parameter = {
            'expense_id': value.expenseId.toString(),
            'company_id': saveuser()!.company.companyId,
            'user_id': saveuser()!.company.userId,
            'image': base64Image
          };

          await uloadexpensesimage(parameter: parameter).then((value) {
            Fluttertoast.showToast(msg: value.message);
          }).onError((error, stackTrace) {});
        });
      }
      orderConroller.getexpense2();
      log(value.toString());
      context.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();

      print(error);
    });
  }
TextEditingController cpcha = TextEditingController();
  @override
  void initState() {
    amount.text = widget.about?.amount ?? "";
    Details.text = widget.about?.remark ?? "";
    ex_type = widget.about?.expenseTypeId ?? "";
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var formattedDate = DateFormat('yyyy-MM-dd').format(
        widget.about != null ? DateTime.parse(widget.about?.date ?? "") : date);
    Date.text = formattedDate;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: [
              Container(
                height: 56,
                color:custom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if(widget.back?.isEmpty ?? true)
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
                          widget.about != null
                              ? "Edit Expense"
                              : 'AddExpense'.tr,
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
                            if(_formKey.currentState!.validate()){
                              await widget.about != null
                                  ? editexpense(
                                  expensetypeid: ex_type,
                                  expenseid:
                                  widget.about!.expenseId,
                                  date: Date.text)
                                  : addexpense(
                                  expensetypeid: ex_type,
                                  date: Date.text);}
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
        body: FutureBuilder(
          future: get_expenceproducts(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              Welcome type = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    CommonTextField(
                                        validation: (value) {
                                          if (value!.isEmpty) {
                                            return 'Amount is required';
                                          }
                                          return null;
                                        },
                                        isPasswordField: false,
                                        controller: amount,
                                        labelText: 'Amount'.tr,
                                        number: TextInputType.number,
                                        maxlength: 100),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Type'.tr,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Display',
                                                  color:custom,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5),
                                        // expens_type(
                                        //   onSelection: (p0) {
                                        //     setState(() {
                                        //       ex_type = p0!;
                                        //     });
                                        //   },
                                        //   expens: type.expenseTypes,
                                        //   initialvalue: widget.about?.expenseId,
                                        // )
                                        Container(
                                          height: 50,
                                          width: double.maxFinite,
                                          child: DropdownButtonFormField<ExpenseType>(

                                            decoration: InputDecoration(
                                              hintText: '-Expense Type-',
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:custom,
                                                    width: 0.5),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            value:
                                            widget.about != null
                                                ? type.expenseTypes.firstWhere(
                                                    (element) =>
                                                element.expenseTypeId ==
                                                    widget.about?.expenseTypeId,
                                                orElse:() =>  type.expenseTypes.first)                                            : null,
                                            onChanged: (value) {
                                              ex_type = value?.expenseTypeId ?? "";
                                            },
                                            items: type.expenseTypes.map((e) {
                                              // ex_type = e.expenseTypeId;
                                              // print(ex_type);
                                              return DropdownMenuItem<ExpenseType>(
                                                value: e,
                                                child: Container(
                                                  width: 200,
                                                  child: Text(
                                                    e.expenseTitle,
                                                    style: TextStyle(
                                                        fontFamily: 'SF Pro Display',
                                                        // overflow: TextOverflow.ellipsis,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                // onTap: () {
                                                //   print(ex_type);
                                                // },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 195,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(20, 15, 0, 0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Change option".tr,
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                    'SF Pro Display',
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: Color(
                                                                        0xff909196)
                                                                        .withOpacity(
                                                                        1),
                                                                  ),
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
                                                                      child: Icon(
                                                                        Icons
                                                                            .camera_alt,
                                                                        color: Color(
                                                                            0xff909196)
                                                                            .withOpacity(
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 18,
                                                                    ),
                                                                    Center(
                                                                        child: Text(
                                                                            "Camera"
                                                                                .tr,
                                                                            style: TextStyle(
                                                                                fontFamily:
                                                                                'SF Pro Display',
                                                                                fontSize:
                                                                                16,
                                                                                fontWeight:
                                                                                FontWeight.w400,
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
                                                                        child: Icon(
                                                                            Icons
                                                                                .image_rounded,
                                                                            color: Color(0xff909196)
                                                                                .withOpacity(1))),
                                                                    SizedBox(
                                                                      width: 18,
                                                                    ),
                                                                    Center(
                                                                      child: Text(
                                                                        "Gallery"
                                                                            .tr,
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SF Pro Display',
                                                                          fontSize:
                                                                          16,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          color: Colors
                                                                              .black,
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
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                child: Row(
                                                                  children: [
                                                                    Center(
                                                                      child: Icon(
                                                                        Icons
                                                                            .cancel,
                                                                        color: Color(
                                                                            0xff909196)
                                                                            .withOpacity(
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 18,
                                                                    ),
                                                                    Center(
                                                                      child: Text(
                                                                        "Close".tr,
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SF Pro Display',
                                                                          fontSize:
                                                                          16,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          color: Colors
                                                                              .black,
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
                                              },
                                              icon: Icon(
                                                Icons.camera_alt,
                                                color:custom,
                                              )),
                                        ],
                                      ),
                                      CommonTextField(
                                        isPasswordField: false,
                                        controller: Details,
                                        labelText: 'Details'.tr,
                                        number: TextInputType.name,
                                        maxlength: 100,
                                        validation: (value) {
                                          if (value!.isEmpty) {
                                            return 'Detail is required';
                                          }
                                          return null;
                                        },),
                                    ]),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Date'.tr,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Display',
                                                  color:custom,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5),
                                        SizedBox(
                                          height: 35,
                                          child: TextFormField(
                                            style: GoogleFonts.notoSans(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: 1,
                                            ),
                                            decoration:  InputDecoration(
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:custom,
                                                  width: 0.5,
                                                ),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:custom,
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            controller: Date,
                                            readOnly: true,
                                            onTap: () {
                                              showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate:
                                                  DateTime(2000, 1, 1),
                                                  lastDate:
                                                  DateTime(2030, 1, 1))
                                                  .then((value) {
                                                print(value);
                                                Date.text = DateFormat("yyyy-MM-dd")
                                                    .format(value ?? date);
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    widget.about != null
                                        ? widget.about!.images.isNotEmpty ||
                                        _imagePaths.isNotEmpty
                                        ? Column(
                                      children: [
                                        // widget.task!.transactionImages.isNotEmpty?
                                        Container(
                                          height: 100,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            scrollDirection:
                                            Axis.horizontal,
                                            itemCount: widget
                                                .about!.images.length,
                                            itemBuilder:
                                                (context, index) {
                                              return Row(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration:
                                                    BoxDecoration(
                                                      image:
                                                      DecorationImage(
                                                        image: NetworkImage(
                                                            widget
                                                                .about!
                                                                .images[
                                                            index]
                                                                .image),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed:
                                                          () async {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            cpcha.clear();
                                                            String cach = generateCaptchaCode(4);
                                                            return s_code(
                                                              capchacode: cach,
                                                              controll: cpcha,
                                                              onconfirm:
                                                                  () async {
                                                                if (cach ==
                                                                    cpcha
                                                                        .text) {
                                                                  context.loaderOverlay.show();
                                                                  Map<String,
                                                                      dynamic>
                                                                  parameter = {
                                                                    'expense_image_id':
                                                                    widget
                                                                        .about!
                                                                        .images[
                                                                    index]
                                                                        .expenseImageId,
                                                                  };

                                                                  await deleteexpenseimage(
                                                                      parameter:
                                                                      parameter)
                                                                      .then(
                                                                          (value) {
                                                                        widget.about!
                                                                            .images
                                                                            .removeAt(
                                                                            index);
                                                                        Fluttertoast
                                                                            .showToast(
                                                                            msg: value
                                                                                .message);
                                                                        context.loaderOverlay.hide();
                                                                      }).onError((error,
                                                                      stackTrace) {print(error);  context.loaderOverlay.hide();});
                                                                  setState(() {});
                                                                  Get.back();

                                                                } else {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                      msg:
                                                                      "Security code doesn't match!!");
                                                                }
                                                              },
                                                            );
                                                          },
                                                        );

                                                      },
                                                      icon: Icon(
                                                          Icons.delete))
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        //     :SizedBox(),
                                        _imagePaths.isNotEmpty
                                            ? Container(
                                          height: 100,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            scrollDirection:
                                            Axis.horizontal,
                                            itemCount:
                                            _imagePaths.length,
                                            itemBuilder:
                                                (context, index) {
                                              return Row(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration:
                                                    BoxDecoration(
                                                      image:
                                                      DecorationImage(
                                                        image: FileImage(
                                                            _imagePaths[
                                                            index]),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed:
                                                          () {
                                                        setState(
                                                                () {
                                                              _imagePaths
                                                                  .removeAt(
                                                                  index);
                                                            });
                                                      },
                                                      icon: Icon(Icons
                                                          .delete))
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                            : SizedBox(),
                                      ],
                                    )
                                        : SizedBox()
                                        : _imagePaths.isNotEmpty
                                        ? Container(
                                      height: 100,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _imagePaths.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: FileImage(
                                                        _imagePaths[
                                                        index]),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _imagePaths
                                                          .removeAt(
                                                          index);
                                                    });
                                                  },
                                                  icon:
                                                  Icon(Icons.delete))
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
                    color:custom,
                  ),
                ],
              );
            }
            return Scaffold(
              body: Center(child: CircularProgressIndicator(color: custom)),
            );
          },
        ),
      ),
    );
  }
}

class expens_type extends StatefulWidget {
  final List<ExpenseType> expens;
  final String? initialvalue;
  final void Function(String?) onSelection;

  const expens_type(
      {super.key,
      required this.expens,
      this.initialvalue,
      required this.onSelection});

  @override
  State<expens_type> createState() => _expens_typeState();
}

class _expens_typeState extends State<expens_type> {
  String? _selectedvalue;

  @override
  void initState() {
    // TODO: implement initState
    _selectedvalue = widget.initialvalue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 50,
          width: screenwidth(context, dividedby: 1),
          // decoration: Const().decorationfield,
          child: SearchChoices<String>.single(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            underline: Container(
              color: Colors.transparent,
            ),
            items: widget.expens
                .map<DropdownMenuItem<String>>(
                  (element) => DropdownMenuItem<String>(
                    value: element.expenseTypeId,
                    child: Text(element.expenseTitle),
                  ),
                )
                .toList(),
            value: _selectedvalue,
            hint: "Select Expence",
            searchHint: "Select Expence",
            onChanged: (value) {
              setState(() {
                _selectedvalue = value;
                print(value);
              });
              widget.onSelection(value);
            },
            searchFn: (String keyword, List<DropdownMenuItem> items) {
              List<int> filterdata = [];
              if (items.isNotEmpty && keyword.isNotEmpty) {
                keyword.split(" ").forEach((k) {
                  int i = 0;
                  for (DropdownMenuItem item in items) {
                    if (!filterdata.contains(i) &&
                        k.isNotEmpty &&
                        ((item.child as Text)
                            .data
                            .toString()
                            .toLowerCase()
                            .contains(k.toLowerCase()))) {
                      filterdata.add(i);
                    }
                    i++;
                  }
                });
              }
              if (keyword.isEmpty) {
                filterdata = Iterable<int>.generate(items.length).toList();
              }
              return (filterdata);
            },
            searchResultDisplayFn: (
                {required displayItem,
                required emptyListWidget,
                required itemTapped,
                required itemsToDisplay,
                required scrollController,
                required thumbVisibility}) {
              return Expanded(
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: thumbVisibility,
                  child: itemsToDisplay.isEmpty
                      ? emptyListWidget
                      : ListView.builder(
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            int itemIndex = itemsToDisplay[index].item1;
                            DropdownMenuItem item = itemsToDisplay[index].item2;
                            bool isItemSelected = itemsToDisplay[index].item3;
                            return InkWell(
                              onTap: () {
                                itemTapped(
                                  itemIndex,
                                  item.value,
                                  isItemSelected,
                                );
                              },
                              child: displayItem(
                                item,
                                isItemSelected,
                              ),
                            );
                          },
                          itemCount: itemsToDisplay.length,
                        ),
                ),
              );
            },
            isExpanded: true,
            displayClearIcon: false,
            dialogBox: true,
          ),
        ),
      ],
    );
    //   Container(
    //   height: 50,
    //   width: screenwidth(context, dividedby: 1),
    //   decoration: Const().decorationfield,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10,),
    //     child: ValueListenableBuilder(
    //       valueListenable: valueNotifier,
    //       builder: (context, value, child) => DropdownButton<String>(
    //         underline: Container(color: Colors.transparent),
    //         hint: const Text('Select Bar Association'),
    //         // iconSize: ,
    //         // icon: Icon(Icons.arrow_drop_down),
    //         isExpanded: true,
    //         // itemHeight: 10,
    //         value: value,
    //         items: widget.bar_assoc
    //             .map<DropdownMenuItem<String>>(
    //               (element) => DropdownMenuItem<String>(
    //             value: element.userId,
    //             child: Text(element.lawFirmCollege),
    //           ),
    //         )
    //             .toList(),
    //         onChanged: (value) {
    //           widget.onSelection(value);
    //           valueNotifier.value = widget.bar_assoc
    //               .where((element) => element.userId.contains(value!))
    //               .toList()[0]
    //               .userId;
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
