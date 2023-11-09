import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../api/const_apis.dart';
import '../api_model/setting_api/get_all_subscriptions.dart';

class appinfo extends StatelessWidget {
  const appinfo({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
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
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: get_vesion(),
          builder: (context,AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              LezrappVesion? about = snapshot.data;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "LezrApp™",
                        style: GoogleFonts.comfortaa(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),

                      SizedBox(
                        height: 14,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                          image: AssetImage("assets/imgs/flogo.png"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "App Version is :- ${ about!.version.toString()}",
                        style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF2C4475),
                ));
          },
        ),
      ),
    );
  }
}
