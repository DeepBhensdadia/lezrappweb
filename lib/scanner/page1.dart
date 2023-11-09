import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/scanner/scanner.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketExample extends StatefulWidget {
// final String data;
//
//   const SocketExample({super.key, required this.data});
  @override
  _SocketExampleState createState() => _SocketExampleState();
}

class _SocketExampleState extends State<SocketExample> {
  // late IO.Socket socket;
  // String message = '';
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // Connect to the server
  //   socket = IO.io('http://192.168.1.9:3000', <String, dynamic>{
  //     'transports': ['websocket'],
  //   });
  //
  //   // Listen for events
  //   socket.on('connect', (_) {
  //     print('Connected to the server');
  //   });
  //
  //   socket.on('message', (data) {
  //     setState(() {
  //       message =data;
  //     });
  //     print('Message received: $data');
  //   });
  //
  //   socket.on('disconnect', (_) {
  //     print('Disconnected from the server');
  //   });
  //   print('hello');
  //   // socket.emit('message', widget.data);
  // }

  // @override
  // void dispose() {
  //   socket.disconnect();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xff294472),
        //   centerTitle: true,
        //   title: Text('Scan to connect'),
        // ),
        appBar: AppBar(
          backgroundColor: Color(0xff294472),
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Container(
                height: 60,
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
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Scan to connect'.tr,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Visit web.lezrapp.com/www on \n your computer and scan QR \n code".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
            SizedBox(
              height: 270,
            ),
            MaterialButton(
              color: Color(0xff294472),
              height: 60,
              minWidth: 200,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRViewExample(),
                  ),
                );
                print('hello gys');
              },
              child: Text(
                "Scan data".tr,
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
