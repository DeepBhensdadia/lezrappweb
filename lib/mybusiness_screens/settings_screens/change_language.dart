import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lezrapp/sharedpref.dart';
import '../../Dashboard/language changes/languages.dart';
import '../../helper.dart';

class change_language extends StatefulWidget {
  const change_language({Key? key}) : super(key: key);

  @override
  State<change_language> createState() => _change_languageState();
}

class _change_languageState extends State<change_language> {
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
              'Change Language'.tr,
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
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 8),
          //   child: DropdownButton<Language>(
          //     underline: SizedBox(),
          //     icon: const Icon(
          //       Icons.language,
          //       color: Colors.black,
          //     ),
          //     onChanged: (Language? language) {
          //       // print(language!.languageCode.toString());
          //       // context.setLocale(Locale(language.languageCode.toString(),
          //       // language.languageContry.toString()));
          //       Get.updateLocale(Locale(language!.languageCode.toString(),
          //           language.languageContry.toString()));
          //     },
          //     items: Language.languageList()
          //         .map<DropdownMenuItem<Language>>(
          //           (e) => DropdownMenuItem<Language>(
          //             value: e,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: <Widget>[
          //                 Text(
          //                   e.flag,
          //                   style: const TextStyle(fontSize: 30),
          //                 ),
          //                 Text(e.name),
          //               ],
          //             ),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Language.languageList().length,
            itemBuilder: (context, index) {
              Language language = Language.languageList()[index];
              return ListTile(
                onTap: () {
                  Get.updateLocale(Locale(language.languageCode.toString(),
                      language.languageContry.toString()));
                  SharedPref.save(value: language.languageCode.toString(), prefKey: PrefKey.languagecode);
                  SharedPref.save(value: language.languageContry.toString(), prefKey: PrefKey.langcontry);
                },
                title: Text(
                  language.name,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Text(
                  language.flag,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
