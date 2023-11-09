import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/screens/agreement_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class intro_screen extends StatefulWidget {
  const intro_screen({Key? key}) : super(key: key);

  @override
  State<intro_screen> createState() => _intro_screenState();
}

class _intro_screenState extends State<intro_screen> {
  List images = [
    'assets/intro/s1.png',
    'assets/intro/s2.png',
    'assets/intro/s3.png',
    'assets/intro/s4.png',
  ];
  int curimg = 0;
  PageController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(
        viewportFraction: 1, keepPage: true, initialPage: curimg);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xffEEEEEE),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return false;
                },
                child: PageView.builder(
                  onPageChanged: (value) {
                    curimg = value;
                  },
                  controller: controller,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                images[index],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/intro/11.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/intro/12.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 48,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.off(
                                agreement_screen(),
                              );
                            },
                            child: Text(
                              "SKIP",
                              style: GoogleFonts.comfortaa(
                                  color: Color(0xff294472),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: controller!,
                            count: images.length,
                            effect: WormEffect(
                              activeDotColor: Color(0xff294472),
                              dotHeight: 10,
                              dotWidth: 10,
                              type: WormType.thin,
                              // strokeWidth: 5,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              (curimg == images.length - 1)
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return agreement_screen();
                                        },
                                      ),
                                    )
                                  : setState(
                                      () {
                                        controller?.nextPage(
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.easeIn);
                                        print(curimg);
                                      },
                                    );
                            },
                            child: Text(
                              "NEXT",
                              style: GoogleFonts.comfortaa(
                                  color: Color(0xff294472),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
