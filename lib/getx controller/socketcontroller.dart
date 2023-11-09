import 'package:get/get.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/sharedpref.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class SocketCotroller extends GetxController {
  late IO.Socket socket;
  WebBrowserInfo? webInfo;
  String message = '';

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (kIsWeb) {
        webInfo = await deviceInfo.webBrowserInfo;
      } else {
        // Handle mobile platform code as shown in the previous response
      }
    } catch (e) {
      print('Error getting device information: $e');
    }
  }

  getreiew() {
    getDeviceInfo();
    message = "";
    socket = IO.io('https://socket-server-l9lt.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connect', (_) {
      // socket.emit('terminfo','${webInfo?.browserName.name}');
      print('Connected to the server');
      print(' ${webInfo?.browserName.name}');
    });

    socket.on('socketid', (data) {
      message = data;
      socket.emit('webLoggedInit', {
        'socketId': '$data',
        'systemInfo': '${webInfo?.browserName.name}',
        'webSocketId': '',
        'token': ''
      });
      update();
      print('Message received: $data');
    });

    socket.on('disconnect', (_) {
      print('Disconnected from the server');
    });

    socket.on('onConnectToApp', (data) {
      print("wuppieee....");
      print(data);
      Get.delete();
      SharedPref.deleteAll();
      SharedPref.save(value: data["companyInfo"], prefKey: PrefKey.saveuser);
      MainScreengo();
    });
  }
}
