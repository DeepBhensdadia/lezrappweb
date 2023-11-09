import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../../Const.dart';
import '../../api/const_apis.dart';
import '../../api_model/type_model.dart';
import 'card_widget.dart';
import 'cardcontroller.dart';

class businesscard extends StatefulWidget {
  const businesscard({Key? key}) : super(key: key);

  @override
  State<businesscard> createState() => _businesscardState();
}

class _businesscardState extends State<businesscard> {
  CardContrller card = Get.put(CardContrller());
  @override
  Widget build(BuildContext context) {
    TextEditingController Changeemail = TextEditingController(text: card.emailuser);
    TextEditingController B_Name = TextEditingController(text: card.Bussinessname);
    TextEditingController Location = TextEditingController(text: card.location);
    TextEditingController Owner_name = TextEditingController(text: card.Ownname);
    TextEditingController Changephone = TextEditingController(text: card.phonenumer);
    return SafeArea(
      child: Scaffold(
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
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'BusinessCard'.tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         size: 30,
                //         Icons.download,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
        body: FutureBuilder(
          future: get_products(),
          builder: (context,AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              Categary type = snapshot.data;
             return SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(6),
                 child: Card(
                   child: Column(
                     children: [
                       card_widget(),
                       card_textfild(
                           onchange: (p0) {
                             card.updatebussinessnameText(p0);
                           },
                           icon: Icon(
                             Icons.business,
                             color: custom,
                           ),
                           controller: B_Name,
                           labelText: 'Business Name'.tr,
                           number: TextInputType.name,
                           maxlength: 100),
                       Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(top: 30, left: 15),
                             child: Row(
                               children: [
                                 Text(
                                   'Business Type'.tr,
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
                           ),
                           DropdownButtonFormField<BusinessType>(
                             decoration: InputDecoration(
                               prefixIcon: Icon(Icons.ac_unit,color:custom,),
                               hintText: '-Business Type-',

                               focusedBorder: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                     color: Color(0xff294472),
                                     width: 0.5),
                               ),
                               border: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                             value: type.businessTypes.firstWhere((element) => element.businessType == saveuser()?.company.businessType),
                             items: type.businessTypes
                                 .map(
                                   (e) =>
                                   DropdownMenuItem<BusinessType>(
                                     value: e,
                                     child:
                                     Container(
                                       width: 200,
                                       child: Text(
                                         e.businessType,
                                         style: TextStyle(
                                             fontFamily: 'SF Pro Display',
                                             // overflow: TextOverflow.ellipsis,
                                             fontSize: 15),
                                       ),
                                     ),
                                   ),
                             )
                                 .toList(),
                             onChanged: (value) {
                               card.businesstypetext(value!.businessType);

                             },
                           ),
                         ],
                       ),
                       card_textfild(
                           onchange: (p0) {
                             card.locationtext(p0);
                           },
                           icon: Icon(
                             Icons.location_on_sharp,
                             color: Color(0xff294472),
                           ),
                           controller: Location,
                           labelText: 'Business Location'.tr,
                           number: TextInputType.name,
                           maxlength: 100),
                       card_textfild(
                           onchange: (p0) {
                             card.phonenumbertext(p0);
                           },
                           icon: Icon(
                             Icons.phone_outlined,
                             color: Color(0xff294472),
                           ),
                           controller: Changephone,
                           labelText: 'Mobile Number'.tr,
                           number: TextInputType.name,
                           maxlength: 100),
                       card_textfild(
                           onchange: (p0) {
                             card.ownnametext(p0);
                           },
                           icon: Icon(
                             Icons.account_circle,
                             color: Color(0xff294472),
                           ),
                           controller: Owner_name,
                           labelText: 'Owner Name'.tr,
                           number: TextInputType.name,
                           maxlength: 100),
                       card_textfild(
                           onchange: (p0) {
                             card.Useremail(p0);
                           },
                           icon: Icon(
                             Icons.mail,
                             color: Color(0xff294472),
                           ),
                           controller: Changeemail,
                           labelText: 'Business Email'.tr,
                           number: TextInputType.name,
                           maxlength: 100),
                       SizedBox(
                         height: 20,
                       ),
                     ],
                   ),
                 ),
               ),
             );
            }
            return Center(child: CircularProgressIndicator(color: custom));
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: InkWell(
            onTap: () async {
              print("cap");
              final image = await card.screenshotController.capture();

              // Save the screenshot to a temporary directory
              final directory = await Directory.systemTemp.createTemp();
              final imagePath = '${directory.path}/BussinessCard.png';
              final File file = File(imagePath);
              await file.writeAsBytes(image!);

              // Share the image via WhatsApp
              await Share.shareFiles([imagePath], text: 'Hey, please save my business card for any enquiries');
            },
            child: Container(
              height: 40,
              child: Center(
                child: Text(
                  'SHARE'.tr,
                  style: GoogleFonts.notoSans(color: Colors.white),
                ),
              ),
              color: Color(0xff294472),
            ),
          ),
        ),
      ),
    );
  }
}

class card_textfild extends StatefulWidget {
  const card_textfild({
    Key? key,
    required this.icon,
     this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
     this.onchange,
    this.isPasswordField = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final Widget icon;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;
  final void Function(String)? onchange;

  @override
  State<card_textfild> createState() => _card_textfildState();
}

class _card_textfildState extends State<card_textfild> {
  // textfild text = Get.put(textfild());
  bool isPasswordField = false;
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 15),
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
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              keyboardType: widget.number,
              maxLength: widget.maxlength,
              // autocorrect: true,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
              controller: widget.controller,
              cursorColor: Colors.black87,
              cursorHeight: 30,
              cursorWidth: 1.5,
              obscureText: isPasswordField,
              onChanged: widget.onchange,
              // onChanged: (value) {
              //   if (value.isEmpty) {
              //     isFieldEmpty.value = true;
              //   } else {
              //     isFieldEmpty.value = false;
              //   }
              // },
              decoration: InputDecoration(
                prefixIcon: widget.icon,
                counterText: '',
                // border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: value ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class cardcreatecomapnytextfield extends StatefulWidget {
  const cardcreatecomapnytextfield({
    Key? key,
    required this.icon,
     this.controller,
    required this.labelText,
    required this.number,
    required this.maxlength,
     this.onchange,
    this.isPasswordField = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final Icon icon;
  final TextInputType number;
  final bool isPasswordField;
  final int maxlength;
  final void Function(String)? onchange;

  @override
  State<cardcreatecomapnytextfield> createState() => _cardcreatecomapnytextfieldState();
}

class _cardcreatecomapnytextfieldState extends State<cardcreatecomapnytextfield> {
  // textfild text = Get.put(textfild());
  bool isPasswordField = false;
  final ValueNotifier<bool> isFieldEmpty = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
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
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              keyboardType: widget.number,
              maxLength: widget.maxlength,
              // autocorrect: true,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              controller: widget.controller,
              cursorColor: Colors.black87,
              cursorHeight: 20,
              cursorWidth: 1.5,
              obscureText: isPasswordField,
              onChanged: widget.onchange,
              // onChanged: (value) {
              //   if (value.isEmpty) {
              //     isFieldEmpty.value = true;
              //   } else {
              //     isFieldEmpty.value = false;
              //   }
              // },
              decoration: InputDecoration(
                prefixIcon: widget.icon,
                counterText: '',
                // border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: value ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
