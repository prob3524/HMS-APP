import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/widgets/text.dart';

import '../data/globals.dart';

class InfoCard extends StatefulWidget {
  int index;

  InfoCard(this.index);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isTapped = true;
  bool isExpand = false;

  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: kWhite.withOpacity(0.6),
      content: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          isTapped = !isTapped;
          setState(() {});
        },
        onHighlightChanged: (value) {
          isExpand = value;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped
              ? isExpand
                  ? h * 0.45
                  : h * 0.35
              : isExpand
                  ? h * 0.6
                  : h * 0.61,
          width: isExpand ? w * 0.8 : w * 0.82,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: isTapped
              ? SingleChildScrollView(
                child: Column(
                    children: [
                      Image.asset(
                        DoctorPics[widget.index],
                        height: h * 0.3,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textWidget(
                              msg: "${DoctorName[widget.index]}",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.02),
                          Image.asset(
                            "images/down.png",
                            height: h * 0.02,
                          )
                        ],
                      )
                    ],
                  ),
              )
              : SingleChildScrollView(
                child: Column(
                    children: [
                      Image.asset(
                        DoctorPics[widget.index],
                        height: h * 0.3,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      textWidget(
                          msg: "${DoctorName[widget.index]}",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: textWidget(
                                msg: "${DoctorSpeciality[widget.index]}",
                                txtColor: kBlack,
                                txtFontWeight: FontWeight.w500,
                                txtFontSize: h * 0.018),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Flexible(
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.6,
                                alignment: Alignment.center,
                                child: Text(
                                  "Experienced and compassionate Cardiologist dedicated to providing exceptional cardiac care. Specialized in diagnosing and treating a wide range of cardiovascular conditions. Utilizes the latest medical advancements and technology to ensure accurate diagnoses and effective treatment plans. Committed to promoting heart health and improving patients' quality of life. Trusted by patients for delivering personalized care and achieving positive outcomes.",
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                                    color: kBlack,
                                    fontWeight: FontWeight.w400,
                                    fontSize: h * 0.014,
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "images/up.png",
                        height: h * 0.02,
                      )
                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
