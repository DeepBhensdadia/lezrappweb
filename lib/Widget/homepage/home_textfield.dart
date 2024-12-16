import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Dashboard/editbusiness_screen.dart';
import 'package:lezrapp/Dashboard/search_screen.dart';
import 'package:lezrapp/api_model/get_summary.dart';
import 'package:lezrapp/getx%20controller/summarycontroller.dart';
import 'package:lezrapp/helper.dart';
import '../../Icons_row/reminder/remainder_screen.dart';
import '../../api/const_apis.dart';
import '../../getx controller/remidercontroller.dart';

class First_Textfield extends StatelessWidget {
  final int remider;

  const First_Textfield({Key? key, required  this.remider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemiderController remider123 = Get.put(RemiderController());
Summarycontroller _scrollcontroll = Get.put(Summarycontroller());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        height: 40,
        child: Row(
          children: [
            // SizedBox(
            //   width: 2.5,
            // ),
            InkWell(
              onTap: () {
                Get.to(
                  editbusiness_screen(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Colors.black,
                      width: 0.7,
                    ),
                  ),
                ),
                child: _scrollcontroll.staff.isTrue ?
                saveuser()?.user.image != null ?
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: Image(
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                      image:NetworkImage(saveuser()?.user.image)),
                ):ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: Image(
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/user.png')),
                ):saveuser()?.company.companyPhoto == null ?  ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: Image(
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/user.png')),
                ):ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: Image(
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                      image:NetworkImage(saveuser()?.company.companyPhoto)),
                ),
              ),
            ),
            VerticalDivider(
              width: 0,
              thickness: 0.5,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                )),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Icon(Icons.search, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                  readOnly: true,
                  onTap: () {
                    Get.to(search_screen());
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      // prefixIcon: Icon(Icons.search),
                      fillColor: Colors.purple,
                      border: InputBorder.none,
                      hintText: 'Search'.tr),
                ),
              ),
            ),
            // VerticalDivider(
            //   width: 0,
            //   thickness: 0.5,
            //   color: Colors.black,
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.black,
                    width: 0.7,
                  ),
                ),
              ),
              child: Badge(

                alignment: AlignmentDirectional(screenwidth(context,dividedby: 30), 2),
                padding: EdgeInsets.all(2),
                isLabelVisible: remider == 0 ? false : true,
                label: Text(
                 jsonEncode( remider),
                  style: TextStyle(color: Colors.white,fontSize: screenwidth(context,dividedby: 80)),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(remainder_screen(),);
                 remider123.get_all_remider();
                  },
                  icon: Icon(
                    Icons.notifications,
                    size: screenwidth(context,dividedby: 40),
                    color: Color(0xff294472),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
