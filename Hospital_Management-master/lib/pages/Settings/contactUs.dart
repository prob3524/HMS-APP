import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/globals.dart';
import '../../widgets/text.dart';

class contactUs extends StatefulWidget {
  const contactUs({super.key});

  @override
  State<contactUs> createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kHomeBG,
        appBar: PreferredSize(
          child: Container(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: w,
                  height: h * 0.1,
                  decoration: BoxDecoration(color: kDarkBlue3, boxShadow: [
                    BoxShadow(color: kBlack, blurRadius: 20, spreadRadius: -17)
                  ]),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: kWhite,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: textWidget(
                            msg: "Contact Us",
                            txtColor: kWhite,
                            txtFontWeight: FontWeight.w600,
                            txtFontSize: h * 0.025),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          preferredSize: Size(w, h * 0.065),
        ),
        body: Column(
          children: [
            SizedBox(height: h * 0.025,),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textWidget(
                    msg: "ATS Pharmacies Limited",
                    txtColor: kDarkBlue3,
                    txtFontWeight: FontWeight.w600,
                    txtFontSize: h * 0.027)
              ],
            ),

            SizedBox(height: h * 0.02),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textWidget(
                    msg: "Beside Royal Heaven,\nMota Varachha\nSurat - 395002",
                    txtColor: kDarkBlue3,
                    txtFontWeight: FontWeight.w500,
                    txtFontSize: h * 0.018)
              ],
            ),

            SizedBox(height: h * 0.02),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textWidget(
                    msg: "For Queries related to Online Orders Please Contact us At :",
                    txtColor: kDarkBlue3,
                    txtFontWeight: FontWeight.w500,
                    txtFontSize: h * 0.018)
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                InkWell(
                  onTap: () async {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }
// ···
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'anadhsuhagiya65@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Type Your Query ??',
                      }),
                    );

                    launchUrl(emailLaunchUri);
                  },
                  child: textWidget(
                      msg: "contactusnow@apollopharmacy.org",
                      txtColor: kError,
                      txtFontWeight: FontWeight.w500,
                      txtFontSize: h * 0.018),
                )
              ],
            ),

            SizedBox(height: h * 0.02),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                Flexible(
                  child: Text(
                    "For queries related to Apollo Pharmacy Store experience Please contact us at:",
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: kDarkBlue3,
                        fontSize: h * 0.018,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                ),
                SizedBox(width: w * 0.03,)
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                InkWell(
                  onTap: () async {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }
// ···
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'anadhsuhagiya65@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Type Your Query ??',
                      }),
                    );

                    launchUrl(emailLaunchUri);
                  },
                  child: textWidget(
                      msg: "customerservice@ATSpharmacy.org",
                      txtColor: kError,
                      txtFontWeight: FontWeight.w500,
                      txtFontSize: h * 0.018),
                ),
                SizedBox(width: w * 0.03,)
              ],
            ),


            SizedBox(height: h * 0.02),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                Flexible(
                  child: Text(
                    "Call Now For Any Query :",
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: kDarkBlue3,
                            fontSize: h * 0.018,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ),
                ),
                SizedBox(width: w * 0.03,)
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                InkWell(
                  onTap: () async {
                    FlutterPhoneDirectCaller.callNumber("+918160011080");
                  },
                  child: textWidget(
                      msg: "8160011080",
                      txtColor: kError,
                      txtFontWeight: FontWeight.w500,
                      txtFontSize: h * 0.018),
                ),
                SizedBox(width: w * 0.03,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
