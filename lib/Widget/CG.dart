import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CG extends StatefulWidget {
  const CG({Key? key}) : super(key: key);

  @override
  State<CG> createState() => _CGState();
}

class _CGState extends State<CG> {
  ImagePicker _picker = ImagePicker();
  XFile? image;
  bool img_temp = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Change option",
                  style: GoogleFonts.notoSans(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff909196)
                          .withOpacity(1)),
                ),
              ],
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: () async {
                image = await _picker.pickImage(
                    source: ImageSource.camera);
                setState(() {
                  img_temp = true;
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Center(
                        child: Icon(
                            Icons.camera_alt,
                            color: Color(0xff909196)
                                .withOpacity(1))),
                    const SizedBox(
                      width: 18,
                    ),
                    Center(
                        child: Text("Camera",
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w400,
                                color:
                                Colors.black)))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                image = await _picker.pickImage(
                    source: ImageSource.gallery);
                setState(() {
                  img_temp = true;
                  Navigator.pop(context);
                });
              },
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Center(
                        child: Icon(
                            Icons.image_rounded,
                            color: Color(0xff909196)
                                .withOpacity(1))),
                    SizedBox(
                      width: 18,
                    ),
                    Center(
                        child: Text("Gallery",
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w400,
                                color:
                                Colors.black)))
                  ],
                ),
              ),
            ),
            SizedBox(height: 7,),
            InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Center(
                        child: Icon(
                            Icons.cancel,
                            color: Colors.black)),
                    SizedBox(
                      width: 18,
                    ),
                    Center(
                        child: Text("Close",
                            style: GoogleFonts.notoSans(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.w600,
                                color:
                                Colors.black,),),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}

class DD extends StatefulWidget {
  const DD({Key? key}) : super(key: key);

  @override
  State<DD> createState() => _DDState();
}

class _DDState extends State<DD> {
  var _value = '-1';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff294472), width: 0.5),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text(
              '-Select Type-',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '-1',
          ),
          DropdownMenuItem(
            child: Text(
              'Toys Store',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '1',
          ),
          DropdownMenuItem(
            child: Text(
              'Office Supply Store',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '2',
          ),
          DropdownMenuItem(
            child: Text(
              'Tobacco Shop',
              style:GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '3',
          ),
          DropdownMenuItem(
            child: Text(
              'Travel Agency',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '4',
          ),
          DropdownMenuItem(
            child: Text(
              'Superstore',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '5',
          ),
          DropdownMenuItem(
            child: Text(
              'Pan Shop',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '6',
          ),
          DropdownMenuItem(
            child: Text(
              'Office Equipements Shop',
              style: GoogleFonts.notoSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: '7',
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
