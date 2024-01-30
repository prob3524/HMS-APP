
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/widgets/appointmentForm.dart';
import 'package:realestate/widgets/frostedGlass.dart';
import 'package:realestate/widgets/text.dart';

import '../data/calanderData.dart';

class appointment extends StatefulWidget {
  const appointment({super.key});

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  var h, w;

  TextEditingController disease = TextEditingController();

  int? SelectDateIndex;
  int? SelectTimeIndex;
  int? SelectDoctorIndex;

  List<String> selectDate = [];
  List<String> selectTime = [];
  List<String> selectDoctor = [];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    DateTime today = DateTime.now();
    DateTime nextMonth = DateTime(today.year, today.month + 1, 1);
    DateTime lastDayNextMonth =
        DateTime(nextMonth.year, nextMonth.month + 1, 0);

    List<String> dateList = generateDateList(today, lastDayNextMonth);
    List<String> weekdayNames = getWeekdayNames();

    return SafeArea(
      child: Scaffold(
          backgroundColor: kHomeBG,
          body: Container(
            height: h * 0.777,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          ),
                          textWidget(
                              msg: "Schedule",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.027)
                        ],
                      ),

                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                    height: h * 0.13,
                    width: w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: dateList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {

                            if(selectDate.isEmpty){
                              SelectDateIndex = index;
                              selectDate.add("${dateList[index].substring(8, 10)} ${weekdayNames[DateTime.parse(dateList[index]).weekday - 1].substring(0, 3)}");
                            }
                            else{
                              SelectDateIndex = null;
                              selectDate.removeLast();
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: h * 0.09,
                            width: w * 0.15,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: SelectDateIndex == index ? kDarkBlue3.withOpacity(0.2) : kWhite.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                              border: SelectDateIndex == index
                                  ? Border.all(color: kDarkBlue3, width: 2)
                                  : null,
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: kBlack,
                              //       offset: Offset(2, 4),
                              //       blurRadius: 20,
                              //       spreadRadius: -17)
                              // ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: textWidget(
                                      msg: "${dateList[index].substring(8, 10)}",
                                      txtColor: kBlack,
                                      txtFontWeight: FontWeight.w700,
                                      txtFontSize: h * 0.02),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: textWidget(
                                      msg:
                                          "${weekdayNames[DateTime.parse(dateList[index]).weekday - 1].substring(0, 3)}",
                                      txtColor: kBlack,
                                      txtFontWeight: FontWeight.w700,
                                      txtFontSize: h * 0.02),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          ),
                          textWidget(
                              msg: "Timing",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.027)
                        ],
                      ),


                    ],
                  ),
                  Container(
                    height: h * 0.07,
                    width: w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: Timing.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {

                            if(selectTime.isEmpty){
                              SelectTimeIndex = index;
                              selectTime.add(Timing[index]);
                            }
                            else{
                              SelectTimeIndex = null;
                              selectTime.removeLast();
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: h * 0.06,
                            width: w * 0.3,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: SelectTimeIndex == index ? kDarkBlue3.withOpacity(0.2) : kWhite.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(14),
                                border: SelectTimeIndex == index
                                    ? Border.all(color: kDarkBlue3, width: 2)
                                    : null
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: kBlack,
                                //       offset: Offset(2, 4),
                                //       blurRadius: 20,
                                //       spreadRadius: -17)
                                // ],
                                ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: textWidget(
                                  msg: "${Timing[index]}",
                                  txtColor: kBlack,
                                  txtFontWeight: FontWeight.w700,
                                  txtFontSize: h * 0.02),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.05,
                          ),
                          textWidget(
                              msg: "Doctors",
                              txtColor: kBlack,
                              txtFontWeight: FontWeight.bold,
                              txtFontSize: h * 0.027)
                        ],
                      ),

                    ],
                  ),
                  Container(
                    height: h * 0.16,
                    width: w,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: DoctorName.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {

                            if(selectDoctor.isEmpty){
                              SelectDoctorIndex = index;
                              selectDoctor.add(DoctorName[index]);
                            }
                            else{
                              SelectDoctorIndex = null;
                              selectDoctor.removeLast();
                            }
                            setState(() {});
                          },
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: h * 0.09,
                                    width: w * 0.7,
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.only(left: 15),
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: SelectDoctorIndex == index ? kDarkBlue3.withOpacity(0.2) : kWhite.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(14),
                                        border: SelectDoctorIndex == index
                                            ? Border.all(
                                                color: kDarkBlue3, width: 2)
                                            : null
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: kBlack,
                                        //       offset: Offset(2, 4),
                                        //       blurRadius: 20,
                                        //       spreadRadius: -17)
                                        // ],
                                        ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: textWidget(
                                              msg: "${DoctorName[index]}",
                                              txtColor: kBlack,
                                              txtFontWeight: FontWeight.w700,
                                              txtFontSize: h * 0.018),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: textWidget(
                                              msg: "${DoctorSpeciality[index]}",
                                              txtColor: kBlack,
                                              txtFontWeight: FontWeight.w500,
                                              txtFontSize: h * 0.016),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: h * 0.18,
                                width: w * 0.25,
                                margin: EdgeInsets.only(top: 15, left: 25),
                                child: Image.asset('${DoctorPics[index]}'),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.025,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "Common Disease",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.027)
                    ],
                  ),
                  Container(
                    height: h * 0.06,
                    width: w,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: kBlack,
                              blurRadius: 10,
                              spreadRadius: -10,
                              offset: Offset(2, 4))
                        ]),
                    child: Container(
                      height: h * 0.06,
                      width: w * 0.7,
                      padding: EdgeInsets.only(top: 2, left: 15),
                      child: TextField(
                        controller: disease,
                        keyboardType: TextInputType.name,
                        cursorColor: kBlack,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: h * 0.018)),
                        onTap: () {},
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mention your Commom Disease",
                            hintStyle: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: kBlack.withOpacity(0.3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: h * 0.018))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "Note :",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.027)
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Carry Case File.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Be Safe and stay Home.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Provide accurate information.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Bring necessary documents.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Mention Reason for an Appointment.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      textWidget(
                          msg: "- Follow the respective instructions.",
                          txtColor: kBlack,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.015),
                    ],
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {

                      String appoDate = selectDate.isEmpty ? "" : selectDate[0];
                      String appoTime = selectTime.isEmpty ? "" : selectTime[0];
                      String appoDoctor = selectDoctor.isEmpty ? "" : selectDoctor[0];
                      String reason = disease.text.trim();

                      if(appoDate.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Select Appointment Date',
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
                      else if(appoTime.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Select Appointment Time',
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
                      else if(appoDoctor.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Select Doctor',
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
                      else{
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return FrostedGlass(widget: appointmentForm(appoDate,appoTime,appoDoctor,reason));
                          },
                        );
                      }


                    },
                    child: Container(
                      height: h * 0.07,
                      width: w,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: AppbarGrad,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: textWidget(
                          msg: "Book an Appointment",
                          txtColor: kWhite,
                          txtFontWeight: FontWeight.bold,
                          txtFontSize: h * 0.02),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
