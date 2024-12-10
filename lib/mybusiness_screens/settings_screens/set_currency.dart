import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:loader_overlay/loader_overlay.dart';

import '../../api/const_apis.dart';
import '../../api_model/login/staff_login_model.dart';
import '../../getx controller/summarycontroller.dart';
import '../../sharedpref.dart';

class set_Currency extends StatefulWidget {
  const set_Currency({Key? key}) : super(key: key);

  @override
  State<set_Currency> createState() => _set_CurrencyState();
}

class _set_CurrencyState extends State<set_Currency> {
  List<dynamic> jsonData = [];
  Future<void> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/currency.json');
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      // Access the "data" key to get the list of currencies
      jsonData = jsonResponse['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
              'Set Currency'.tr,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  letterSpacing: 0.2,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        backgroundColor: Color(0xff294472),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: jsonData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              // Get.context!.loaderOverlay.show();
              await setcurrency(currency: jsonData[index]['symbol'])
                  .then((value) async {
                SLogin saveuser =
                    sLoginFromJson(SharedPref.get(prefKey: PrefKey.saveuser)!);
                if (value.profile != null) {
                  saveuser = saveuser.copyWith(
                      company: Company.fromJson((value.profile!.toJson())));

                  SharedPref.save(
                      value: jsonEncode(saveuser.toJson()),
                      prefKey: PrefKey.saveuser);
                }
                print(saveuser.toString());
                Get.put(Summarycontroller()).get_summarydetails();
                Get.back();
                // SLogin? valudata = saveuser();
                // valudata?.company.currency = value.profile?.currency;
                // SharedPref.save(
                //     value: jsonEncode(valudata?.toJson()),
                //     prefKey: PrefKey.saveuser);
              }).onError((error, stackTrace) {
                print("....$error");
              });
              // Get.updateLocale(Locale(currency.languageCode.toString(),
              //     language.languageContry.toString()));
              // SharedPref.save(value: language.languageCode.toString(), prefKey: PrefKey.languagecode);
              // SharedPref.save(value: language.languageContry.toString(), prefKey: PrefKey.langcontry);
            },
            title: Text(
              '${jsonData[index]['code']} ( ${jsonData[index]['symbol']} )',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Text(
              '🇮🇳',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
