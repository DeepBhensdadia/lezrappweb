import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/api/const_apis.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';
import '../Widget/Addcustomer/textfield.dart';
import '../api_model/transaction/get_transaction.dart';
import '../getx controller/summarycontroller.dart';
import '../getx controller/transactioncontrollers/customercontroller.dart';
import '../getx controller/transactioncontrollers/transactionadd.dart';
import '../getx controller/transactioncontrollers/transactioncontroller.dart';
import '../helper.dart';
import '../mybusiness_screens/customer/customer_info.dart';
import '../new_widget/icon.dart';
import '../screens/Transactions/select_account.dart';

class AddTransaction extends StatefulWidget {
  final String? back;
  final Transaction? task;
  final String? id;
  AddTransaction({this.task, this.id, this.back});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  Transactionadd customeridname = Get.put(Transactionadd());
  TransactionConroller transaction_Conroller = Get.put(TransactionConroller());
  Summarycontroller summary = Get.put(Summarycontroller());
  bool img_temp = false;
  List<File> _imagePaths = [];
  Future<void> _pickotherimage() async {
    try {
      final pickedImages = await ImagePicker().pickMultiImage(imageQuality: 55);

      if (pickedImages.isNotEmpty) {
        for (var pickedImage in pickedImages) {
          File imageFile = File(pickedImage.path);
          var compressedImageBytes =
              await FlutterImageCompress.compressWithFile(
            imageFile.path,
            quality: 55, // Set your desired quality level
          );
          File compressedImageFile = File(imageFile
              .path); // Modify this to set the compressed image's file path
          await compressedImageFile.writeAsBytes(
              compressedImageBytes!.toList()); // Convert Uint8List to List<int>
          setState(() {
            _imagePaths.add(compressedImageFile);
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      imageQuality: 55,
      source: ImageSource.camera,
    );

    if (Selectedimage != null) {
      File imageFile = File(Selectedimage.path);
      var compressedImageBytes = await FlutterImageCompress.compressWithFile(
        imageFile.path,
        quality: 55, // Set your desired quality level
      );

      File compressedImageFile = File(imageFile.path);
      await compressedImageFile.writeAsBytes(compressedImageBytes!.toList()); //
      setState(() {
        _imagePaths.add(compressedImageFile);
      });
    } else {}
  }

  int cur = 1;
  TextEditingController amount = TextEditingController();
  TextEditingController Details = TextEditingController();
  TextEditingController tranDate = TextEditingController();
  TextEditingController DDate = TextEditingController();

  Customertransactioncontroller _customertransactioncontroller =
      Get.put(Customertransactioncontroller());
  DateTime selectedDateTime = DateTime.now();
  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2030, 1, 1),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        var formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
        print(formattedDateTime);
        tranDate.text = formattedDateTime;
      }
    }
  }

  addtransaction(
      {required String transactiondate,
      required String customerid,
      required String transactiontype,
      required String companyuserid,
      required String smstype}) async {
    context.loaderOverlay.show();

    // orderConroller.allpage =0;
    Map<String, dynamic> parameter = {
      'amount': amount.text,
      'transaction_date': transactiondate,
      'remark': Details.text,
      'customer_id': customerid,
      'transaction_type': transactiontype,
      // 'signature': '',
      'company_user_id': companyuserid,
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'due_date': DDate.text,
      'sms_type': smstype
    };
    final signature = await _controller.toPngBytes();
    if (signature != null) {
      final base64Signature = base64Encode(signature);
      parameter['signature'] = base64Signature;
    }
    await add_transaction_karo(parameter: parameter).then((value) async {
      if (_imagePaths.isNotEmpty) {
        // context.loaderOverlay.hide();
        // plzwait(context);
        for (File element in _imagePaths) {
          final bytes = await element.readAsBytes();
          final base64Image = base64Encode(bytes);
          Map<String, dynamic> parameter = {
            'transaction_id': value.transactionId.toString(),
            'company_id': saveuser()!.company.companyId,
            'user_id': saveuser()!.company.userId,
            'image': base64Image
          };
          await uploadtransactiojnimage(parameter: parameter).then((value) {
            // Fluttertoast.showToast(msg: value.message);
          }).onError((error, stackTrace) {
            print("error...$error");
          });
        }
      }
      summary.get_summarydetails();
      transaction_Conroller.allpage = 0;
      transaction_Conroller.getpages2(transaction_Conroller.customtype);
      _customertransactioncontroller.transaction.clear();
      _customertransactioncontroller.transactionnotdeleted.clear();
      _customertransactioncontroller.finish = false;
      _customertransactioncontroller.page = 0;
      _customertransactioncontroller.to_date = "";
      _customertransactioncontroller.from_date = "";
      _customertransactioncontroller.gettransaction(customerid);
      Get.back();
      log(value.toString());
      context.loaderOverlay.hide();
      showSuccessPopup(Get.context!);
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();

      print(error);
    });
  }

  edittransaction(
      {required String transactiondate,
      required String customerid,
      required String transactiontype,
      required String companyuserid,
      required String smstype}) async {
    context.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      'amount': amount.text,
      'transaction_date': transactiondate,
      'remark': Details.text,
      'customer_id': customerid,
      'transaction_type': transactiontype,
      'company_user_id': companyuserid,
      'company_id': saveuser()!.company.companyId,
      'user_id': saveuser()!.company.userId,
      'due_date': DDate.text,
      "transaction_id": widget.task?.transactionId,
      'sms_type': smstype
    };

    await update_transaction_karo(parameter: parameter).then((value) {
      _imagePaths.forEach((element) async {
        final bytes = await element.readAsBytes();
        final base64Image = base64Encode(bytes);
        Map<String, dynamic> parameter = {
          'transaction_id': value.transactionId.toString(),
          'company_id': saveuser()!.company.companyId,
          'user_id': saveuser()!.company.userId,
          'image': base64Image
        };

        await uploadtransactiojnimage(parameter: parameter).then((value) {
          Fluttertoast.showToast(msg: value.message);
        }).onError((error, stackTrace) {});
      });
      transaction_Conroller.allpage = 0;
      transaction_Conroller.getpages2(transaction_Conroller.customtype);
      _customertransactioncontroller.transaction.clear();
      _customertransactioncontroller.transactionnotdeleted.clear();
      _customertransactioncontroller.finish = false;
      _customertransactioncontroller.page = 0;
      _customertransactioncontroller.to_date = "";
      _customertransactioncontroller.from_date = "";
      _customertransactioncontroller.gettransaction(customerid);
      Get.back();
      log(value.toString());
      context.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      context.loaderOverlay.hide();

      print(error);
    });
  }

  @override
  void initState() {
    customeridname.account.clear();
    widget.task != null
        ? customeridname.account.text = widget.task!.customerName
        : "";
    customeridname.postsupplire.clear();
    customeridname.postcustomer.clear();
    customeridname
        .get_allcustomer(widget.task?.customerId.toString() ?? widget.id);
    amount.text = widget.task?.amount.toString() ?? "";
    Details.text = widget.task?.remark ?? "";
    cur = widget.task?.transactionType == "Paid" ? 2 : 1;
    super.initState();
  }

  bool isPasswordField = false;
  TextEditingController cpcha = TextEditingController();
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);
  Summarycontroller _summarycontroller = Get.put(Summarycontroller());
  final SignatureController _controller = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.grey.shade200);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var duedate = DateFormat('yyyy-MM-dd').format(widget.task?.dueDate != null
        ? DateTime.parse(widget.task?.dueDate ?? "")
        : DDate.text.isEmpty
            ? date
            : DateTime.parse(DDate.text));
    var transcationdate = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(widget.task?.transactionDate != null
            ? DateTime.parse(widget.task?.transactionDate ?? "")
            : tranDate.text.isEmpty
                ? date
                : DateTime.parse(tranDate.text));

    DDate.text = duedate;
    tranDate.text = transcationdate;
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
                color: custom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (widget.back?.isEmpty ?? true)
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
                          widget.task != null
                              ? "Edit Transaction"
                              : 'AddTransaction'.tr,
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
                            if (_summarycontroller
                                    .currantpackag.data.packageExpired ==
                                false) {
                              if (_formKey.currentState!.validate()) {
                                if (customeridname.customeridtest != null) {
                                  widget.task != null
                                      ? edittransaction(
                                          customerid: customeridname
                                                  .customeridtest?.customerId ??
                                              "",
                                          companyuserid: _summarycontroller.staff
                                                  .isTrue
                                              ? saveuser()?.user.companyUserId
                                              : "0",
                                          transactiondate: tranDate.text,
                                          transactiontype:
                                              cur == 1 ? "1" : "-1",
                                          smstype: customeridname.customeridtest
                                                      ?.customerTypeId ==
                                                  "1"
                                              ? cur == 1
                                                  ? "cpurchase"
                                                  : "cpayment"
                                              : cur == 1
                                                  ? "spurchase"
                                                  : "spayment")
                                      : addtransaction(
                                          customerid: customeridname
                                                  .customeridtest?.customerId ??
                                              "",
                                          companyuserid: _summarycontroller
                                                  .staff.isTrue
                                              ? saveuser()?.user.companyUserId
                                              : "0",
                                          transactiondate: tranDate.text,
                                          transactiontype:
                                              cur == 1 ? "1" : "-1",
                                          smstype: customeridname.customeridtest
                                                      ?.customerTypeId ==
                                                  "1"
                                              ? cur == 1
                                                  ? "cpurchase"
                                                  : "cpayment"
                                              : cur == 1
                                                  ? "spurchase"
                                                  : "spayment");
                                }
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Your package has expired. Please renew the package.");
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Account'.tr,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: custom,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        // height: 35,
                                        child: ValueListenableBuilder(
                                          valueListenable: isFieldEmpty,
                                          builder: (context, value, child) =>
                                              Container(
                                            width: double.infinity,
                                            // padding: const EdgeInsets.symmetric(horizontal: 20),
                                            decoration: BoxDecoration(
                                              // border: Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                            child: TextField(
                                              onTap: () {
                                                Get.to(
                                                  select_account(),
                                                );
                                              },
                                              readOnly: true,
                                              autocorrect: true,
                                              // autofocus: true,
                                              // maxLengthEnforcement: MaxLengthEnforcement.none,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                letterSpacing: 1,
                                              ),
                                              controller:
                                                  customeridname.account,
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
                                                suffixIcon: isPasswordField
                                                    ? CustomIconButton(
                                                        onPressed: (val) =>
                                                            setState(() =>
                                                                isPasswordField =
                                                                    val),
                                                      )
                                                    : const SizedBox(),
                                                counterText: '',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: custom,
                                                      width: 0.5),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: value
                                                        ? Colors.red
                                                        : Colors.green,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.search,
                                          color: custom,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(children: [
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
                                              color: custom,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5),
                                    SizedBox(
                                      height: 35,
                                      child: TextField(
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          letterSpacing: 1,
                                        ),
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: custom,
                                              width: 0.5,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: custom,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        controller: tranDate,
                                        readOnly: true,
                                        onTap: () {
                                          _selectDateTime(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _selectDateTime(context);
                                      },
                                      icon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: custom,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                              Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          pickgallarycamera();
                                        },
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: custom,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CommonTextField(
                                      // validation: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return 'Details is required';
                                      //   }
                                      //   return null;
                                      // },
                                      isPasswordField: false,
                                      controller: Details,
                                      labelText: 'Details'.tr,
                                      number: TextInputType.name,
                                      maxlength: 100),
                                ],
                              ),
                              (cur == 1)
                                  ? Stack(children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Due Date'.tr,
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
                                          SizedBox(width: 5),
                                          SizedBox(
                                            height: 35,
                                            child: TextField(
                                              style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 1,
                                              ),
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: custom,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: custom,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              controller: DDate,
                                              readOnly: true,
                                              onTap: () {
                                                showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            1900, 1, 1),
                                                        lastDate: DateTime(
                                                            2030, 1, 1))
                                                    .then(
                                                  (value) {
                                                    var ddate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(value!);
                                                    print(value);
                                                    DDate.text = ddate;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate:
                                                          DateTime(1900, 1, 1),
                                                      lastDate:
                                                          DateTime(2030, 1, 1))
                                                  .then(
                                                (value) {
                                                  var ddate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(value!);
                                                  print(value);
                                                  DDate.text = ddate;
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.calendar_month_rounded,
                                              color: custom,
                                            ),
                                          ),
                                        ],
                                      )
                                    ])
                                  : SizedBox(
                                      height: 0,
                                    ),
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
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Transaction Type'.tr,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        color: custom,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              cur = 1;
                                            });
                                          },
                                          child: Container(
                                            // width: (cur == 2) ? 150 : 165,
                                            height: screenheight(context,
                                                dividedby: 20),
                                            decoration: BoxDecoration(
                                              color: (cur == 1)
                                                  ? custom
                                                  : Colors.grey.shade200,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    (cur == 1)
                                                        ? Icon(
                                                            Icons
                                                                .task_alt_outlined,
                                                            color: Colors.white,
                                                          )
                                                        : SizedBox(),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      'ADD CREDIT'.tr,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: (cur == 1)
                                                            ? Colors.white
                                                            : Colors
                                                                .grey.shade600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              cur = 2;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: (cur == 2)
                                                  ? custom
                                                  : Colors.grey.shade200,
                                            ),
                                            height: screenheight(context,
                                                dividedby: 20),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  (cur == 2)
                                                      ? SizedBox(
                                                          width: 5,
                                                        )
                                                      : SizedBox(
                                                          width: 0,
                                                        ),
                                                  (cur == 2)
                                                      ? Icon(
                                                          Icons
                                                              .task_alt_outlined,
                                                          color: Colors.white,
                                                        )
                                                      : SizedBox(),
                                                  (cur == 1)
                                                      ? SizedBox(
                                                          width: 15,
                                                        )
                                                      : SizedBox(
                                                          width: 5,
                                                        ),
                                                  Text(
                                                    'RECEIVE PAYMENT'.tr,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: (cur == 2)
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              widget.task != null
                                  ? widget.task!.transactionImages.isNotEmpty ||
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
                                                itemCount: widget.task!
                                                    .transactionImages.length,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(widget
                                                                .task!
                                                                .transactionImages[
                                                                    index]
                                                                .imageFileName),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () async {
                                                            String cach =
                                                                generateCaptchaCode(
                                                                    4);

                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  cpcha.clear();
                                                                  return s_code(
                                                                    controll:
                                                                        cpcha,
                                                                    capchacode:
                                                                        cach,
                                                                    onconfirm:
                                                                        () async {
                                                                      if (cach ==
                                                                          cpcha
                                                                              .text) {
                                                                        context
                                                                            .loaderOverlay
                                                                            .show();
                                                                        Map<String,
                                                                                dynamic>
                                                                            parameter =
                                                                            {
                                                                          'transaction_image_id': widget
                                                                              .task!
                                                                              .transactionImages[index]
                                                                              .transactionImageId,
                                                                          'company_id': saveuser()!
                                                                              .company
                                                                              .companyId,
                                                                          'user_id': saveuser()!
                                                                              .company
                                                                              .userId,
                                                                        };

                                                                        await deletetransactionimage(parameter: parameter).then(
                                                                            (value) {
                                                                          context
                                                                              .loaderOverlay
                                                                              .hide();
                                                                          widget
                                                                              .task!
                                                                              .transactionImages
                                                                              .removeAt(index);
                                                                          Get.back();
                                                                          Fluttertoast.showToast(
                                                                              msg: value.message);
                                                                        }).onError((error,
                                                                            stackTrace) {
                                                                          context
                                                                              .loaderOverlay
                                                                              .hide();
                                                                          print(
                                                                              error);
                                                                        });
                                                                        setState(
                                                                            () {});
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "Security code doesn't match!!");
                                                                      }
                                                                    },
                                                                  );
                                                                });
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
                                                                    () async {
                                                                  setState(() {
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
                                                            _imagePaths[index]),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          _imagePaths
                                                              .removeAt(index);
                                                        });
                                                      },
                                                      icon: Icon(Icons.delete))
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                      : SizedBox(),
                              Visibility(
                                visible: widget.task != null ? false : true,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Signature(
                                        controller: _controller,
                                        height: 200,
                                        backgroundColor: Colors.grey.shade300,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sign here'.tr,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Display',
                                              color: custom,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _controller.clear();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 60,
                                            child: Center(
                                              child: Text(
                                                'Clear'.tr,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    color: custom,
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
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
              ),
            ),
            SizedBox(
              height: 15,
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
                    _pickotherimage();
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
