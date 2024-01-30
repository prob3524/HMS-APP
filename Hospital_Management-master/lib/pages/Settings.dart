import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/Model.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Settings/aboutUs.dart';
import 'package:realestate/pages/Settings/contactUs.dart';
import 'package:realestate/pages/Settings/privacyPolicy.dart';
import 'package:realestate/pages/Settings/terms_conditions.dart';
import 'package:realestate/pages/login.dart';
import 'package:realestate/pages/profile.dart';
import 'package:realestate/widgets/settingContainers.dart';
import 'package:realestate/widgets/text.dart';
import 'package:http/http.dart' as http;

import '../data/haptic.dart';
import '../widgets/appointmentForm.dart';
import '../widgets/frostedGlass.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var h, w;

  String? ID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ID = Model.prefs!.getString('id') ?? "";
    print("iD : $ID");

  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kHomeBG,
        body: Container(
          height: h * 0.789,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                        "https://lottie.host/8e46a603-9d73-4681-8bfa-c1afc03370d0/QdW72FctqA.json",
                        width: w * 0.3),
                    textWidget(
                        msg: "Settings",
                        txtColor: kDarkBlue3,
                        txtFontWeight: FontWeight.bold,
                        txtFontSize: h * 0.03)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, FadeRoute1(aboutUs()));
                    },
                    child: settingsContainer(
                        Aicon: "images/about.png", Aname: "About Us")),
                SizedBox(
                  height: h * 0.018,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, FadeRoute1(contactUs()));
                  },
                  child: settingsContainer(
                      Aicon: "images/contactUs.png", Aname: "Contact Us"),
                ),
                SizedBox(
                  height: h * 0.018,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, FadeRoute1(termsConditions()));
                  },
                  child: settingsContainer(
                      Aicon: "images/terms.png", Aname: "Terms & Conditions"),
                ),
                SizedBox(
                  height: h * 0.018,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, FadeRoute1(privacyPolicy()));
                  },
                  child: settingsContainer(
                      Aicon: "images/privacy.png", Aname: "Privacy Policy"),
                ),

                SizedBox(
                  height: h * 0.018,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, FadeRoute1(Profile()));
                    },
                    child: settingsContainer(
                        Aicon: "images/profile.png", Aname: "Update Profile")),
                SizedBox(
                  height: h * 0.018,
                ),
                InkWell(
                    onTap: () async {

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return FrostedGlass(widget: AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            backgroundColor: kWhite.withOpacity(0.6),
                            content: Container(
                              height: h * 0.25,
                              width: w * 0.7,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                          child: Text(
                                            "Are you sure you want to Delete This Account ?",
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(textStyle:  TextStyle(
                                                color: kBlack,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w500)),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          lightImpact();
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: h * 0.05,
                                          width: w * 0.3,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kError,
                                              borderRadius: BorderRadius.circular(14),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: kBlack,
                                                    spreadRadius: -17,
                                                    blurRadius: 20,
                                                    offset: Offset(2, 4))
                                              ]),
                                          child: textWidget(
                                              msg: "No",
                                              txtColor: kWhite,
                                              txtFontWeight: FontWeight.w600,
                                              txtFontSize: h * 0.025),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          lightImpact();
                                          Navigator.pop(context);

                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return FrostedGlass(
                                                  widget: AlertDialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                    backgroundColor: kWhite.withOpacity(0.6),
                                                    content: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(height: h * 0.05,width: h * 0.05,child: CircularProgressIndicator(color: kDarkBlue3,strokeWidth: 5,)),
                                                          SizedBox(width: w * 0.1,),
                                                          textWidget(msg: "Please Wait", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02)
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              );
                                            },
                                          );

                                          Model.prefs!.clear();


                                          print("ID : $ID");

                                          var link = Uri.parse("https://flutteranadh.000webhostapp.com/Hospital/delete.php");

                                          Map m = {
                                            'id': ID,
                                          };

                                          print("URL");
                                          var response = await http.post(link, body: m);

                                          print("Response");
                                          Navigator.pop(context);

                                          if (response.statusCode == 200) {
                                            print("response : ${response.body}");
                                            Map map = jsonDecode(response.body);

                                            int result = map['result'];
                                            print("result :- $result");
                                            if (result == 1) {

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12)),
                                                  width: w * 0.9,
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Center(
                                                    child: Text(
                                                      'Your Account has Deleted...!',
                                                      style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(
                                                              color: kWhite,
                                                              fontWeight: FontWeight.bold)),
                                                    ),
                                                  ),
                                                  backgroundColor: kGreen,
                                                  duration: Duration(seconds: 2),
                                                ),
                                              );

                                              Navigator.pushReplacement(context, FadeRoute1(login()));
                                            }
                                            else if(result == 0){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12)),
                                                  width: w * 0.9,
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text(
                                                    'System Error',
                                                    style: GoogleFonts.montserrat(
                                                        textStyle: TextStyle(
                                                            color: kWhite,
                                                            fontWeight: FontWeight.bold)),
                                                  ),
                                                  backgroundColor: kError,
                                                  duration: Duration(seconds: 1),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: h * 0.05,
                                          width: w * 0.3,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kGreen,
                                              borderRadius: BorderRadius.circular(14),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: kBlack,
                                                    spreadRadius: -17,
                                                    blurRadius: 20,
                                                    offset: Offset(2, 4))
                                              ]),
                                          child: textWidget(
                                              msg: "Yes",
                                              txtColor: kWhite,
                                              txtFontWeight: FontWeight.w600,
                                              txtFontSize: h * 0.025),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                      );






                    },
                    child: settingsContainer(
                        Aicon: "images/delete.png", Aname: "Delete Account")),
                SizedBox(
                  height: h * 0.018,
                ),
                InkWell(
                    onTap: () {
                      Model.prefs!.clear();
                      Navigator.pushReplacement(context, FadeRoute1(login()));
                    },
                    child: settingsContainer(
                        Aicon: "images/logout.png", Aname: "Log Out")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
