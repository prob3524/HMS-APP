import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/widgets/DetailsOfDoctors.dart';
import 'package:realestate/widgets/text.dart';

import '../data/DoctorsLists.dart';
import '../data/haptic.dart';
import '../widgets/appointmentForm.dart';
import '../widgets/frostedGlass.dart';

class DoctorsDetails extends StatefulWidget {

  int index;

  DoctorsDetails(this.index);


  @override
  State<DoctorsDetails> createState() => _DoctorsDetailsState();
}

class _DoctorsDetailsState extends State<DoctorsDetails> {

  var h , w;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeBG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: textWidget(msg: "${ListofDoctors.DoctorsLists[widget.index]['name']}", txtColor: kBlack, txtFontWeight: FontWeight.w700, txtFontSize: h * 0.022),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: ListofDoctors.DoctorsLists[widget.index]['doctors'].length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              lightImpact();

              showDialog(
                context: context,
                builder: (context) {
                  return FrostedGlass(widget: DetailsOfDoctors(widget.index, index));
                },
              );

            },
            child: Container(
              height: h * 0.09,
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
                      '${ListofDoctors.DoctorsLists[widget.index]['doctors'][index]['imgIcon']}',
                      width: w * 0.1,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: w * 0.6,
                      child: Flexible(
                        child: Text(
                          "${ListofDoctors.DoctorsLists[widget.index]['doctors'][index]['name1']}",
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
    );
  }
}
