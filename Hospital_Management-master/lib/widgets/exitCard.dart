import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/widgets/text.dart';

import '../data/globals.dart';
import '../data/haptic.dart';

class exitCard extends StatefulWidget {
  @override
  State<exitCard> createState() => _exitCardState();
}

class _exitCardState extends State<exitCard> {
  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return AlertDialog(
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
                      style: GoogleFonts.poppins(textStyle:  TextStyle(
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
                  onTap: () {
                    lightImpact();
                    Navigator.pop(context);
                    Navigator.pop(context);
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
    );
  }
}