import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getx controller/transactioncontrollers/transactioncontroller.dart';

bottomsheetsort(BuildContext context,Function() ondatewise,Function() onhightolow,Function() onlowtohigh) {
  TransactionConroller transactionConroller = Get.put(TransactionConroller());

  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    'Sort by'.tr,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                RawMaterialButton(
                    child: Row(
                      children: [
                        Text(
                          'DateWise'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    // color:Colors.red,
                    onPressed: ondatewise),
                RawMaterialButton(
                    child: Row(
                      children: [
                        Text(
                          'High To Low'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: onhightolow ),
                RawMaterialButton(
                    child: Row(
                      children: [
                        Text(
                          'Low To High'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: onlowtohigh)
              ],
            ),
          ),
        );
      });
}

bottomsheetfilter(BuildContext context,Function() ontap,Function() ontapall) {

  showModalBottomSheet(

      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    'Filter by'.tr,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                // RawMaterialButton(
                //     child: Row(
                //       children: [
                //         Text(
                //           'This Month'.tr,
                //           style: TextStyle(
                //               fontFamily: 'SF Pro Display',
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //               color: Colors.black),
                //         ),
                //       ],
                //     ),
                //     // color:Colors.red,
                //     onPressed: () {
                //       Get.back();
                //     }),
                // RawMaterialButton(
                //   child: Row(
                //     children: [
                //       Text(
                //         'Last Month'.tr,
                //         style: TextStyle(
                //             fontFamily: 'SF Pro Display',
                //             fontSize: 16,
                //             fontWeight: FontWeight.w500,
                //             color: Colors.black),
                //       ),
                //     ],
                //   ),
                //   onPressed: () {
                //     Get.back();
                //   },
                // ),
                RawMaterialButton(
                    child: Row(
                      children: [
                        Text(
                          'Custom'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: ontap),
                RawMaterialButton(
                    child: Row(
                      children: [
                        Text(
                          'ALL'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: ontapall),
              ],
            ),
          ),
        );
      });
}

datedialogbox(BuildContext context,void Function(String)? onchangedfrom,void Function(String)? onchangedto,Function() onsearch) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        "Filter Date".tr,
        style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff294472)),
      ),
      actions: <Widget>[
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From',
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff294472)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                onChanged: onchangedfrom
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'To',
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff294472)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                // decoration: InputDecoration(),
                // dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                // icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",

                onChanged: onchangedto
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CupertinoButton(
                color: Color(0xff294472),
                child: Text('Search'),
                onPressed: onsearch),
            SizedBox(
              height: 10,
            ),
          ],
        )
      ],
    ),
  );
}
