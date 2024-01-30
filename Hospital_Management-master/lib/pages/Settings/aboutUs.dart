import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/globals.dart';

import '../../widgets/text.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
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
                    Padding(padding: EdgeInsets.only(left: 20),
                    child: InkWell(onTap: () {
                      Navigator.pop(context);
                    },child: FaIcon(FontAwesomeIcons.arrowLeft,color: kWhite,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: textWidget(
                          msg: "About Us",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.014,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textWidget(
                    msg: "Know More About Us and About Our Doctors !",
                    txtColor: kDarkBlue3,
                    txtFontWeight: FontWeight.w600,
                    txtFontSize: h * 0.016)
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.3,
              width: w,
              decoration: BoxDecoration(
                  color: kWhite,
                  image: DecorationImage(
                      image: AssetImage("images/ab.jpg"), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(color: kBlack, spreadRadius: -17, blurRadius: 20)
                  ]),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: 520,
              width: w,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: kBlack,
                    blurRadius: 20,
                    spreadRadius: -17,
                  )
                ]
              ),
              child: Flexible(
                child: Text(
                  "ATS Pharmacy is a subsidiary of ATS Hospitals, a highly regarded pharmacy chain in India. It is the largest and first-ever Omni-Channel Pharmacy network in Asia, with a vast network of over 5500 outlets strategically located in key locations across the country. The delivery service covers over 19000+ pin codes, making it highly accessible to people throughout India.\n\n        The pharmacy is accredited with an International Quality Certification, which speaks to its commitment to providing authentic and reasonably priced medication round the clock. The 24-hour pharmacies and home delivery network are designed to ensure customers' convenience, while the customer care is available at any time of the day. \n\n        Quality is the foundation of ATS Pharmacy's operations. Over the last two decades, the pharmacy has gained extensive experience in pharmacy operations management, and it is dedicated to offering the best services in the industry. The pharmacy is adequately stocked with a comprehensive range of medicines, over-the-counter (OTC), and fast-moving consumer goods (FMCG) products. The qualified and experienced staff are available to address all your needs. \n\n        ATS Pharmecy in is a one-stop online destination with a vast range of over 70,000 products in various categories such as vitamins and supplements, baby care, personal care, health, and nutritional foods, and OTC. In addition, the pharmacy has over 400 Apollo Branded products available in categories like vitamins and supplements, health food, oral care, skincare, among others.",                   overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: kDarkBlue3,
                      fontWeight: FontWeight.w500,
                      fontSize: h * 0.016,
                    )
                  ),
                )
              ),
            )
          ],
        ),
      ),
    ));
  }
}
