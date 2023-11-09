import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lezrapp/Const.dart';
import 'package:lezrapp/screens/splash_screen.dart';
import 'package:lezrapp/sharedpref.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'Dashboard/language changes/AppTranslations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool save =
        SharedPref.get(prefKey: PrefKey.langcontry) != null ? true : false;
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
            child: Image.network(
                height: 70,
                width: 70,
                "https://web.lezrapp.com/www/assets/imgs/Rolling.gif"),
          ),
          overlayOpacity: 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().screenWidth < 1200 ? 600 : 150.w,
                child: GetMaterialApp(
                  smartManagement: SmartManagement.onlyBuilder,
                  translations: AppTranslations(),
                  locale: save == true
                      ? Locale(
                          SharedPref.get(prefKey: PrefKey.languagecode) ?? 'en',
                          SharedPref.get(prefKey: PrefKey.langcontry) ?? 'US',
                        )
                      : Locale('en', 'US'),
                  theme: ThemeData(
                    primaryColor: custom,
                    fontFamily: 'fontFamily: SF Pro Display',
                  ),
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
