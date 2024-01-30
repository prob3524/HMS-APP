import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/data/globals.dart';

import '../data/pageTransitions.dart';
import '../widgets/text.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  var h, w;

  TextEditingController search = TextEditingController();

  bool searchResult = false;

  List<String> SearchNames = [];
  List<String> SearchImage = [];
  List<String> SearchPassion = [];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: kHomeBG,
          body: Container(
            height: h * 0.8,
            child: Column(
              children: [
                Container(
                  height: h * 0.06,
                  width: w,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: kBlack,
                            blurRadius: 10,
                            spreadRadius: -10,
                            offset: Offset(2, 4))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Image.asset(
                        'images/search.png',
                        width: w * 0.05,
                        color: kBlack,
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Container(
                        height: h * 0.06,
                        width: w * 0.7,
                        padding: EdgeInsets.only(top: 2),
                        child: TextField(
                          controller: search,
                          keyboardType: TextInputType.name,
                          cursorColor: kBlack,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: h * 0.018)),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              searchResult = true;
                              setState(() {});

                              SearchNames.clear();
                              SearchImage.clear();
                              SearchPassion.clear();

                              for(int i = 0; i < DoctorName.length; i++){

                                if(DoctorName[i].toLowerCase().contains(value.trim().toLowerCase())){
                                  SearchNames.add(DoctorName[i]);
                                  SearchImage.add(DoctorPics[i]);
                                  SearchPassion.add(DoctorSpeciality[i]);
                                }

                              }
                              setState(() {

                              });

                            } else {
                              searchResult = false;
                              setState(() {});
                            }

                          },
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Disease , Medicine or Hospitals",
                              hintStyle: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: kBlack.withOpacity(0.3),
                                      fontWeight: FontWeight.w600,
                                      fontSize: h * 0.018))),
                        ),
                      )
                    ],
                  ),
                ),
                searchResult
                    ? Expanded(
                      child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: SearchNames.length,
                  itemBuilder: (context, index) {
                      return Card(
                        color: kWhite,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: ListTile(
                          leading: Image.asset(SearchImage[index],width: w * 0.08,),
                          title: textWidget(msg: SearchNames[index], txtColor: kDarkBlue3, txtFontWeight: FontWeight.w700, txtFontSize: h * 0.02),
                          subtitle: textWidget(msg: SearchPassion[index], txtColor: kDarkBlue3, txtFontWeight: FontWeight.w400, txtFontSize: h * 0.016),
                        ),
                      );
                  },
                ),
                    )
                    : Expanded(
                      child: Column(
                        children: [
                          Container(
                              height: h * 0.28,
                              width: w * 0.9,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: kBlack,
                                        spreadRadius: -17,
                                        blurRadius: 20,
                                        offset: Offset(2, 4))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: h * 0.11,
                                        width: h * 0.11,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: kHomeBG,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlack,
                                                  offset: Offset(2, 4),
                                                  spreadRadius: -17,
                                                  blurRadius: 20)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'images/doctor1.png',
                                              width: w * 0.1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: textWidget(
                                                  msg: "Doctors",
                                                  txtColor: kBlack,
                                                  txtFontWeight: FontWeight.w600,
                                                  txtFontSize: h * 0.02),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: h * 0.11,
                                        width: h * 0.11,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xffc4edc5),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlack,
                                                  offset: Offset(2, 4),
                                                  spreadRadius: -17,
                                                  blurRadius: 20)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'images/pills.png',
                                              width: w * 0.1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: textWidget(
                                                  msg: "Medicines",
                                                  txtColor: kBlack,
                                                  txtFontWeight: FontWeight.w600,
                                                  txtFontSize: h * 0.018),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: h * 0.11,
                                        width: h * 0.11,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xffece3bf),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlack,
                                                  offset: Offset(2, 4),
                                                  spreadRadius: -17,
                                                  blurRadius: 20)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'images/appointment.png',
                                              width: w * 0.1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: textWidget(
                                                  msg: "Appointment",
                                                  txtColor: kBlack,
                                                  txtFontWeight: FontWeight.w600,
                                                  txtFontSize: h * 0.015),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: h * 0.11,
                                        width: h * 0.11,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xffece3bf),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlack,
                                                  offset: Offset(2, 4),
                                                  spreadRadius: -17,
                                                  blurRadius: 20)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'images/heartdisease.png',
                                              width: w * 0.1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: textWidget(
                                                  msg: "Disease",
                                                  txtColor: kBlack,
                                                  txtFontWeight: FontWeight.w600,
                                                  txtFontSize: h * 0.02),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: h * 0.11,
                                        width: h * 0.11,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xffedc4c4),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlack,
                                                  offset: Offset(2, 4),
                                                  spreadRadius: -17,
                                                  blurRadius: 20)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'images/hospital.png',
                                              width: w * 0.1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: textWidget(
                                                  msg: "Hospitals",
                                                  txtColor: kBlack,
                                                  txtFontWeight: FontWeight.w600,
                                                  txtFontSize: h * 0.02),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: h * 0.11,
                                        width: h * 0.11,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xffbfecdf),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlack,
                                                  offset: Offset(2, 4),
                                                  spreadRadius: -17,
                                                  blurRadius: 20)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'images/support.png',
                                              width: w * 0.1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: textWidget(
                                                  msg: "Help Desk",
                                                  txtColor: kBlack,
                                                  txtFontWeight: FontWeight.w600,
                                                  txtFontSize: h * 0.017),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: DoctorName.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: kWhite,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                                  child: ListTile(
                                    leading: Image.asset(DoctorPics[index],width: w * 0.08,),
                                    title: textWidget(msg: DoctorName[index], txtColor: kDarkBlue3, txtFontWeight: FontWeight.w700, txtFontSize: h * 0.02),
                                    subtitle: textWidget(msg: DoctorSpeciality[index], txtColor: kDarkBlue3, txtFontWeight: FontWeight.w400, txtFontSize: h * 0.016),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),

              ],
            ),
          )),
    );
  }
}
