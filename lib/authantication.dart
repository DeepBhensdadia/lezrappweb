import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezrapp/mainscreen.dart';
import 'package:local_auth/local_auth.dart';

class Authantication extends StatefulWidget {
  const Authantication({Key? key}) : super(key: key);

  @override
  State<Authantication> createState() => _AuthanticationState();
}

class _AuthanticationState extends State<Authantication> {
   final auth = LocalAuthentication();
  String authorized = " not authorized";
  bool _canCheckBiometric = false;
  late List<BiometricType> _availableBiometric;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: "Scan your finger to authenticate",
          // useErrorDialogs: true,
          // stickyAuth: true
          options:
          AuthenticationOptions(stickyAuth: true, useErrorDialogs: true));
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      authorized =
      authenticated ? "Authorized success" : "Failed to authenticate";
      authenticated == true
          ? Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ))
          : null;
      print(authorized);
    });
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;

    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
     Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];

    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  @override
  void initState() {
    _checkBiometric();

    _getAvailableBiometric();
    _authenticate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authentication'),centerTitle: true,backgroundColor: Color(0xff294472),),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.yellow,
                onPressed: (){
                  _authenticate();
                },
                child: Text('Authntication for login'),
              ),
              MaterialButton(
                color: Colors.yellow,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                },
                child: Text('Go To Main Screen'),
              ),
            ],
          ),
        ),
      )
    );
  }
}
