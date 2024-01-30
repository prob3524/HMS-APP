import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/data/globals.dart';

import '../data/Model.dart';
import '../widgets/text.dart';

class profileShow extends StatefulWidget {
  const profileShow({super.key});

  @override
  State<profileShow> createState() => _profileShowState();
}

class _profileShowState extends State<profileShow> {

  var h , w;

  String? ID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getID();
    print("ID : $ID");
    Anadh();
  }

  getID() {
    ID = Model.prefs!.getString('id') ?? "";
  }

  var appoData;
  bool status = false;

  Anadh() async {
    try {
      var link = 'https://flutteranadh.000webhostapp.com/Hospital/getAppointment.php';

      Map map = {
        'id': ID
      };

      var url = Uri.parse(link);
      var response = await http.post(url, body: map);
      print("response :- $response");

      print(response.statusCode);
      print("response :-===  ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('=== ${response.body}');
        // appoData = response.data;
        print("Anadh : ${response.body}");
        // print("lenght = ${appoData.length}");

        Map map = jsonDecode(response.body);

        appoData = map["data"];
        print("ANADH :  $appoData");

        status = true;
        setState(() {});
      } else {
        throw Exception('lenght : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

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
                            msg: "Booked Appointments",
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

        body: status == true
            ? ListView.builder(
          itemCount: appoData.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: h * 0.14,),
                    Container(
                      height: h * 0.37,
                      width: w,
                      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: kBlack,
                                spreadRadius: -17,
                                blurRadius: 20
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: h * 0.08,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: w * 0.06,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(msg: "Name : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                  textWidget(msg: "${appoData[index]["pname"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                  SizedBox(height: h * 0.015,),
                                  textWidget(msg: "Contact : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                  textWidget(msg: "${appoData[index]["pnumber"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                  SizedBox(height: h * 0.015,),
                                  textWidget(msg: "Appo. Date : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                  textWidget(msg: "${appoData[index]["adate"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                  SizedBox(height: h * 0.015,),
                                  textWidget(msg: "Doctor : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                  textWidget(msg: "${appoData[index]["adoctor"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                  SizedBox(height: h * 0.015,),
                                  textWidget(msg: "Companion Name : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                  textWidget(msg: "${appoData[index]["cname"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                ],
                              ),
                              SizedBox(width: w * 0.02,),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(msg: "Email : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                    Text("${appoData[index]["pemail"]}",overflow: TextOverflow.ellipsis,style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.02,fontWeight: FontWeight.w500)),),
                                    SizedBox(height: h * 0.015,),
                                    textWidget(msg: "Age : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                    textWidget(msg: "${appoData[index]["page"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                    SizedBox(height: h * 0.015,),
                                    textWidget(msg: "Appo. Time : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                    textWidget(msg: "${appoData[index]["atime"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                    SizedBox(height: h * 0.015,),
                                    textWidget(msg: "Gender : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                    textWidget(msg: "${appoData[index]["gender"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                    SizedBox(height: h * 0.015,),
                                    textWidget(msg: "Companion Contact : ", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                                    textWidget(msg: "${appoData[index]["cnumber"]}", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.017),
                                  ],
                                ),
                              )
                            ],
                          ),



                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: h * 0.2,
                      width: h * 0.15,
                      margin: EdgeInsets.only(top: 20,left: 30),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("${DummyDoctorPics[index]}"),fit: BoxFit.cover)
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        )
            : Center(child: CircularProgressIndicator(color: kDarkBlue3,strokeWidth: 3,)),
      ),
    );
  }
}
