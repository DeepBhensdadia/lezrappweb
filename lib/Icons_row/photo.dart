import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/helper.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class photo extends StatelessWidget {
  List<dynamic> image;
  int indexs;
  photo(this.image, this.indexs);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: indexs);
    Future<void> _shareImage(url) async {
      context.loaderOverlay.show();

      String imageUrl = url;

      // Download the image and save it locally
      http.Response response = await http.get(Uri.parse(imageUrl));
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/image.jpg');
      await tempFile.writeAsBytes(response.bodyBytes);
      context.loaderOverlay.hide();
      // Share the image
      await Share.shareFiles([tempFile.path]);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: image.length,

          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      PhotoView(

                        // tightMode: true,
                        minScale: 0.2,
                        maxScale: 0.2,
                        imageProvider: NetworkImage(image[index].imageFileName),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _pageController.previousPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.ease);
                                  },
                                  icon: Icon(Icons.arrow_back_ios,color:Colors.grey)),
                              IconButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.ease);

                                  },
                                  icon: Icon(Icons.arrow_forward_ios,color:Colors.grey)),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                      // Container(
                      //   height: screenheight(context, dividedby: 1.5),
                      //   width: screenwidth(context, dividedby: 1),
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       // fit: BoxFit.fill,
                      //       image:
                      //     ),
                      //   ),
                      // ),
                      ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Transaction Image ${index + 1}',
                          style: GoogleFonts.notoSans(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            _shareImage(image[index].imageFileName);
                          },
                          icon: Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Expenseimage extends StatelessWidget {
  List<dynamic> image;
  Expenseimage(this.image);

  @override
  Widget build(BuildContext context) {
    Future<void> _shareImage(url) async {
      context.loaderOverlay.show();

      String imageUrl = url;

      // Download the image and save it locally
      http.Response response = await http.get(Uri.parse(imageUrl));
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/imageexpens.jpg');
      await tempFile.writeAsBytes(response.bodyBytes);
      context.loaderOverlay.hide();
      // Share the image
      await Share.shareFiles([tempFile.path]);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Expanded(
                    child: PhotoView(
                  imageProvider: NetworkImage(image[index].image),
                )
                    // child: Container(
                    //   height: screenheight(context, dividedby: 1.5),
                    //   width: screenwidth(context, dividedby: 1),
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       // fit: BoxFit.fill,
                    //       image: NetworkImage(image[index].image),
                    //     ),
                    //   ),
                    // ),
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Expense Image ${index + 1}',
                      style: GoogleFonts.notoSans(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        _shareImage(image[index].imageFileName);
                      },
                      icon: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
