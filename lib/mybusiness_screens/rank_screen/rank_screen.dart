import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/api/const_apis.dart';
import '../../Const.dart';
import '../../api_model/rank_api/rank_list.dart';
import '../../helper.dart';
import 'package:http/http.dart' as http;

class rank_screen extends StatefulWidget {
  const rank_screen({Key? key}) : super(key: key);

  @override
  State<rank_screen> createState() => _rank_screenState();
}

class _rank_screenState extends State<rank_screen> {
  ScrollController scrollcontroller = ScrollController();
  List r_img = [
    'assets/gif/1.png',
    'assets/gif/2.png',
    'assets/gif/3.png',
  ];

  int currentPage = 0; // Current page number
  bool isLoading = false; // Indicator for API loading
  bool show = false; // Indicator for API loading
List<MyCompanyRank> companies = [];
 late RankList detail;
  getrankvisedata() {
    get_rank(currentPage).then((value) {
      companies.addAll(value.companies);
      detail = value;
      setState(() {
        isLoading = false;
        show = true;
      });
    }).onError((error, stackTrace) {
    setState(() {
      isLoading = false;
    });
      print(error);
    });
  }

  @override
  void initState() {
    getrankvisedata();
    scrollcontroller.addListener(_scrolllisten);
    super.initState();
  }

  void _scrolllisten() {
    if (scrollcontroller.position.pixels == scrollcontroller.position.maxScrollExtent) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        currentPage += 20;
        print(currentPage);
        getrankvisedata();
      }
    } else {
      print(currentPage);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff45256E),
              Color(0xffE18C31),
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              children: [
                Container(
                  color: Colors.transparent,
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
                            'Leaderboard'.tr,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                letterSpacing: 0.2,
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: show == true ?  SingleChildScrollView(
            controller: scrollcontroller,
            child: Column(
              children: [
                Image(
                  height: 100,
                  image: AssetImage(
                    'assets/dukon/rank_cup.png',
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    // height: screenheight(context, dividedby: 0.5),
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      itemCount: detail.toppers.length,
                      itemBuilder: (context, index) {
                        MyCompanyRank about = detail.toppers[index];
                        return Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                screenwidth(context, dividedby: 50),
                              ),
                              Text(
                                '${about.rowNumber.toString()}.',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                NetworkImage(about.companyPhoto),
                                radius: 23,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenwidth(context,
                                        dividedby: 3),
                                    child: Text(
                                      about.companyName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: screenwidth(context,
                                        dividedby: 4),
                                    child: Text(
                                      about.myPoints,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Image(
                                  height: 40,
                                  width: 44,
                                  image: AssetImage(r_img[index]))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      // height: screenheight(context, dividedby: 0.5),
                      child: ListView.builder(
                        // scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          MyCompanyRank about = detail.myCompanyRank;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                  screenwidth(context, dividedby: 50),
                                ),
                                Text(
                                  '${about.rowNumber.toString()}.',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(about.companyPhoto),
                                  radius: 23,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: screenwidth(context,
                                          dividedby: 3),
                                      child: Text(
                                        about.companyName,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: screenwidth(context,
                                          dividedby: 4.2),
                                      child: Text(
                                        about.myPoints,
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    // height: screenheight(context, dividedby: 0.5),
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        MyCompanyRank about = companies[index];
                        return Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                screenwidth(context, dividedby: 50),
                              ),
                              Text(
                                '${about.rowNumber.toString()}.',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                NetworkImage(about.companyPhoto),
                                radius: 23,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenwidth(context,
                                        dividedby: 3),
                                    child: Text(
                                      about.companyName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width: screenwidth(context,
                                        dividedby: 4),
                                    child: Text(
                                      about.myPoints,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (isLoading)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: custom,),
                  ),
              ],
            ),
          ) : Center(child: CircularProgressIndicator(color: custom,),)
      ),
    ));
  }
}
