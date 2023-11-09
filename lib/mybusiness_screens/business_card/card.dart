import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/Const.dart';

import '../../helper.dart';
import 'cardcontroller.dart';



class c1 extends StatelessWidget {
  const c1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "1");
  }
}class c2 extends StatelessWidget {
  const c2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "2");
  }
}class c3 extends StatelessWidget {
  const c3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "3");
  }
}class c4 extends StatelessWidget {
  const c4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "4");
  }
}class c5 extends StatelessWidget {
  const c5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "5");
  }
}

class c6 extends StatelessWidget {
  const c6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "6");
  }
}

class c7 extends StatelessWidget {
  const c7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "7");
  }
}

class c8 extends StatelessWidget {
  const c8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "8");
  }
}

class c9 extends StatelessWidget {
  const c9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "9");
  }
}

class c10 extends StatelessWidget {
  const c10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardCenterwidget(context, "10");
  }
}

class c11 extends StatelessWidget {
  const c11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardCenterwidget(context, "11");
  }
}

class c12 extends StatelessWidget {
  const c12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardCenterwidget(context, "12");
  }
}

class c13 extends StatelessWidget {
  const c13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "13");
  }
}

class c14 extends StatelessWidget {
  const c14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "14");
  }
}

class c15 extends StatelessWidget {
  const c15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "15");
  }
}

class c16 extends StatelessWidget {
  const c16({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "16");
  }
}

class c17 extends StatelessWidget {
  const c17({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "17");
  }
}

class c18 extends StatelessWidget {
  const c18({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardCenterwidget(context, "18");
  }
}

class c19 extends StatelessWidget {
  const c19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardCenterwidget(context, "19");
  }
}

class c20 extends StatelessWidget {
  const c20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "20");
  }
}

class c21 extends StatelessWidget {
  const c21({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "21");
  }
}

class c22 extends StatelessWidget {
  const c22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardwidget(context, "22");
  }
}

cardwidget(context, index) {
  return GetBuilder<CardContrller>(
    builder: (controller) => Container(
      height: screenheight(context, dividedby: 1.2),
      decoration: const BoxDecoration(
          // color: Color(0xff909196).withOpacity(0.1),
          // borderRadius: BorderRadius.circular(10.0),
          ),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/new/card/$index.png'),
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.Bussinessname,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.busitype,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ],
              ),

              // Text(
              //   controller.Ownname,
              //   style: TextStyle(
              //       fontFamily: 'SF Pro Display',
              //       color: Colors.black,
              //       fontSize: 14),
              // ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.emailuser,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        controller.phonenumer,
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),

              Text(
                controller.location,
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    color: Colors.black,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

cardCenterwidget(context, index) {
  return GetBuilder<CardContrller>(
    builder: (controller) => Container(
      height: screenheight(context, dividedby: 1.2),
      decoration: const BoxDecoration(
          // color: Color(0xff909196).withOpacity(0.1),
          // borderRadius: BorderRadius.circular(10.0),
          ),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/new/card/$index.png'),
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.Bussinessname,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.busitype,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       controller.Ownname,
              //       style: TextStyle(
              //           fontFamily: 'SF Pro Display',
              //           color: Colors.black,
              //           fontSize: 14),
              //     ),
              //   ],
              // ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.emailuser,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                     controller.phonenumer,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ],
              ),

              Text(
                controller.location,
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    color: Colors.black,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
