import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezrapp/scanner/page1.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;



class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late IO.Socket socket;
  String message = '';

  @override
  void initState() {
    socket = IO.io('https://node-js-server-0fvv.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.emit("disconnect",(_){});
    // Listen for events
    socket.on('connect', (_) {
      print('Connected to the server');
    });

    socket.on('message', (data) {
      setState(() {
        message = data;
      });
      print('Message received: $data');
    });

    socket.on('disconnect', (_) {
      print('Disconnected from the server');
    });
    print('hello');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),

        ],
      ),
    );
  }
  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.resumeCamera();
    log("Hello");
    controller.scannedDataStream.listen((scanData) {
      // log(scanData.code.toString());
      // Fluttertoast.showToast(msg: scanData.code.toString());

      HapticFeedback.vibrate();
      setState(() {
        result = scanData;
        // log(result.toString());
        if (result != null) {
          print(result.toString());
          socket.emit('login', scanData.code.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SocketExample(),
              ));
          controller.stopCamera();
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}