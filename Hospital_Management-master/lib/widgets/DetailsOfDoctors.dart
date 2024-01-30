import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:realestate/data/DoctorsLists.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Drawer/drawerScreen.dart';
import 'package:realestate/pages/appointment.dart';
import 'package:realestate/widgets/text.dart';

class DetailsOfDoctors extends StatefulWidget {
  
  
  
  int Widindex;
  int index;

  DetailsOfDoctors(this.Widindex, this.index);

  @override
  State<DetailsOfDoctors> createState() => _DetailsOfDoctorsState();
}

class _DetailsOfDoctorsState extends State<DetailsOfDoctors> {
  var h , w;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        height: h * 0.6,
        width: w * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: h * 0.3,
                  width: w * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                  ),
                  child: Image.asset("${ListofDoctors.DoctorsLists[widget.Widindex]['doctors'][widget.index]['img1']}",fit: BoxFit.cover,),
                ),

                SizedBox(height: h * 0.02,),
                textWidget(msg: "${ListofDoctors.DoctorsLists[widget.Widindex]['doctors'][widget.index]['name1']}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.023),
                SizedBox(height: h * 0.018,),
                textWidget(msg: "${ListofDoctors.DoctorsLists[widget.Widindex]['name']}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.017),
                SizedBox(height: h * 0.018,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textWidget(msg: "${ListofDoctors.DoctorsLists[widget.Widindex]['doctors'][widget.index]['degree']}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.015),
                    textWidget(msg: "${ListofDoctors.DoctorsLists[widget.Widindex]['doctors'][widget.index]['language']}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.015),
                  ],
                ),
                SizedBox(height: h * 0.018,),
                textWidget(msg: "Experiance : ${ListofDoctors.DoctorsLists[widget.Widindex]['doctors'][widget.index]['experiance']}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.015),
                SizedBox(height: h * 0.018,),
                textWidget(msg: "Visiting Charge : ${ListofDoctors.DoctorsLists[widget.Widindex]['doctors'][widget.index]['visitCharge']}/-", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.015),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(context, FadeRoute1(drawerScreen(1)));
                  },
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: AppbarGrad, begin: Alignment.centerLeft, end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: kBlack,
                          spreadRadius: -17,
                          blurRadius: 20,
                          offset: Offset(2, 4)
                        )
                      ]
                    ),
                    child: textWidget(msg: "Book Appointment", txtColor: kWhite, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.019),
                  ),
                ),

                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    FlutterPhoneDirectCaller.callNumber("+918160011080");
                  },
                  child: Container(
                    height: h * 0.06,
                    width: h * 0.06,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        gradient: LinearGradient(colors: OnBoardGradient3, begin: Alignment.centerLeft, end: Alignment.centerRight),
                        boxShadow: [
                          BoxShadow(
                              color: kBlack,
                              spreadRadius: -17,
                              blurRadius: 20,
                              offset: Offset(2, 4)
                          )
                        ]
                    ),
                    child: Image.asset("images/cat/call.png",fit: BoxFit.cover,color: kWhite,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
