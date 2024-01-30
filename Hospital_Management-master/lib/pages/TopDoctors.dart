import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/widgets/text.dart';

import '../data/globals.dart';

class topDoctors extends StatefulWidget {
  const topDoctors({super.key});

  @override
  State<topDoctors> createState() => _topDoctorsState();
}

class _topDoctorsState extends State<topDoctors> {
  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeBG,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: AppbarGrad)),
        ),
        centerTitle: true,
        title: Text("Top Doctors",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.bold,
                    color: kWhite))),
      ),
      body: ListView.builder(
        itemCount: DoctorName.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: h * 0.25,
            width: w,
            margin: EdgeInsets.only(top: 15,left: 15,right: 15),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: kBlack,
                  offset: Offset(2, 4),
                  spreadRadius: -17,
                  blurRadius: 20
                )
              ]
            ),

            child: Row(
              children: [
                SizedBox(width: w * 0.05,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('${DoctorPics[index]}',width: w * 0.35,),
                  ],
                ),

                SizedBox(width: w * 0.05,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textWidget(msg: "${DoctorName[index]}", txtColor: kBlack, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.019),
                    SizedBox(height: h * 0.01,),
                    textWidget(msg: "${DoctorSpeciality[index]}", txtColor: kBlack, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.014),

                    SizedBox(height: h * 0.02,),
                    InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber("+918160011080");
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
                              blurRadius: 20,
                              spreadRadius: -17,
                              offset: Offset(2, 4)
                            )
                          ]
                        ),
                        child: textWidget(msg: "Call", txtColor: kWhite, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.02),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
