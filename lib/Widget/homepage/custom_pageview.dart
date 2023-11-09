import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api/const_apis.dart';
import '../../api_model/get_alltutorials.dart';
import '../../helper.dart';
import 'package:http/http.dart' as http;

class Customer_Pageview extends StatefulWidget {
  const Customer_Pageview({Key? key}) : super(key: key);

  @override
  State<Customer_Pageview> createState() => _Customer_PageviewState();
}

class _Customer_PageviewState extends State<Customer_Pageview> {
  int index = 0;
  PageController controller = PageController(
    viewportFraction: 1,
    keepPage: true,
  );

  late Timer _timer;
  List img = [];

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      index == 5 ? index = 0 : index;

      setState(() {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
        index++;
      });
    });
  }

  late Future<void> _launched;
  Future<void> _launchedyoutube(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{"my_header_key": "my_header_value"});
    } else {
      throw "Not launcher $url";
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('error:${snapshot.error}');
    } else {
      return Text('data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_tutorials(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          GetAlltutorials detail = snapshot.data;
          return SizedBox(
            // color: Colors.red,
            height: screenheight(context, dividedby: 5),
            child: Stack(
              children: [
                PageView.builder(
                  // reverse: true,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: detail.data.length,
                  itemBuilder: (context, index) {
                    Datum about = detail.data[index];
                    return InkWell(
                      onTap: () => setState(() {
                        _launched = _launchedyoutube(about.ytId);
                      }),
                      child: Container(
                        height: screenheight(context, dividedby: 1.2),
                        decoration: const BoxDecoration(
                            // color: Color(0xff909196).withOpacity(0.1),
                            // borderRadius: BorderRadius.circular(10.0),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(about.image),
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                            controller: controller,
                            count: detail.data.length,
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
        return SizedBox(
          height: screenheight(
            context,
            dividedby: 5,
          ),
        );
      },
    );
  }
}
