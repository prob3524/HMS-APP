import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/DoctorsLists.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/haptic.dart';
import 'package:realestate/widgets/text.dart';

import 'DoctorsDetails.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({super.key});

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kHomeBG,
        body: Container(
          height: h * 0.782,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: ListofDoctors.DoctorsLists.length,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  lightImpact();

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DoctorsDetails(index);
                  },));

                },
                child: Container(
                  height: h * 0.1,
                  width: w * 0.9,
                  margin: EdgeInsets.only(left: 15,right: 15,top: 10),
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            color: kBlack,
                            spreadRadius: -17,
                            blurRadius: 20,
                            offset: Offset(2, 4))
                      ]),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset(
                          '${ListofDoctors.DoctorsLists[index]['img']}',
                          width: w * 0.1,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: w * 0.6,
                          child: Flexible(
                            child: Text(
                              "${ListofDoctors.DoctorsLists[index]['name']}",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: kDarkBlue3,
                                      fontWeight: FontWeight.w800,
                                      fontSize: h * 0.02)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
