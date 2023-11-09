import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lezrapp/api_model/type_model.dart';
import 'package:screenshot/screenshot.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../helper.dart';
import 'card.dart';
import 'cardcontroller.dart';

class card_widget extends StatefulWidget {
  const card_widget({
    Key? key,
  }) : super(key: key);

  @override
  State<card_widget> createState() => _card_widgetState();
}

class _card_widgetState extends State<card_widget> {
  CardContrller card = Get.put(CardContrller());
  int index = 0;
  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );


  @override
  Widget build(BuildContext context) {
    final List Pages = [
      c1(),
      c2(),
      c3(),
      c4(),
      c5(),
      c6(),
      c7(),
      c8(),
      c9(),
      c10(),
      c11(),
      c12(),
      c13(),
      c14(),
      c15(),
      c16(),
      c17(),
      c18(),
      c19(),
      c20(),
      c21(),
      c22(),
    ];
    return SizedBox(
      // color: Colors.red,
      height: screenheight(context, dividedby: 3.5),
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
              });
            },
              // reverse: true,
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: Pages.length,
              itemBuilder: (context, index) => Screenshot(

                  child: Pages[index], controller: card.screenshotController)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: Pages.length,
                      effect: WormEffect(
                        activeDotColor: const Color(0xff294472),
                        dotColor: Colors.grey.shade200,
                        dotHeight: 8,
                        dotWidth: 8,
                        type: WormType.thin,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
