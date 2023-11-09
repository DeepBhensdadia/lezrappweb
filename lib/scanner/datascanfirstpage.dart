import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lezrapp/getx%20controller/socketcontroller.dart';
import 'package:lezrapp/sharedpref.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';
import '../Const.dart';

class DataQRscanner extends StatefulWidget {
  const DataQRscanner({Key? key}) : super(key: key);

  @override
  State<DataQRscanner> createState() => _DataQRscannerState();
}

class _DataQRscannerState extends State<DataQRscanner> {
  SocketCotroller socketcontro = Get.put(SocketCotroller());
  @override
  void initState() {
    socketcontro.getreiew();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SocketCotroller>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To use LezrApp on your computer :",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "1. Open LezrApp on your phone",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "2. Tap Menu and select LezrApp Web",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "3. Point your phone to this screen to capture the code",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.message.isNotEmpty
                    ? QrImageView(
                        data: controller.message,
                        version: QrVersions.auto,
                        size: 200.0,
                        embeddedImage: AssetImage("assets/new/qrimg.png"),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: custom,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
