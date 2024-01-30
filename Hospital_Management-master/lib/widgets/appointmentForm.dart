import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Drawer/drawerScreen.dart';
import 'package:realestate/pages/profileShow.dart';
import 'package:realestate/widgets/text.dart';

import '../data/Model.dart';
import '../data/globals.dart';
import 'package:http/http.dart' as http;

import 'frostedGlass.dart';

class appointmentForm extends StatefulWidget {

  String appoDate;
  String appoTime;
  String appoDoctor;
  String reason;

  appointmentForm(this.appoDate, this.appoTime, this.appoDoctor, this.reason);


  @override
  State<appointmentForm> createState() => _appointmentFormState();
}

class _appointmentFormState extends State<appointmentForm> {
  var h, w;

  TextEditingController Pname = TextEditingController();
  TextEditingController Pemail = TextEditingController();
  TextEditingController PAge = TextEditingController();
  TextEditingController Cname = TextEditingController();
  TextEditingController Cnumber = TextEditingController();
  TextEditingController Pnumber = TextEditingController();
  TextEditingController PaltNumber = TextEditingController();

  bool PnameError = false;
  bool PemailError = false;
  bool PAgeError = false;
  bool CnameError = false;
  bool CnumberError = false;
  bool PnumberError = false;
  bool PaltNumberError = false;

  String male = "Male";
  String female = "Female";
  String other = "Other";

  String Gender = "Gender";

  String? UID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UID = Model.prefs!.getString('id') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        height: h * 0.6,
        width: w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              SizedBox(height: h * 0.02,),

              Lottie.network("https://lottie.host/5558b0a1-eb58-430f-9908-9776e257eafc/Yr5tx4eZ61.json",width: w * 0.5),

              textWidget(msg: "Patient Information", txtColor: kDarkBlue3, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.025),

              SizedBox(height: h * 0.02,),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: Pname,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      PnameError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  keyboardType: TextInputType.text,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: kWhite,width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: kDarkBlue3,width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: kError,width: 2),
                    ),
                    prefixIcon: Icon(CupertinoIcons.person,color: kDarkBlue3,),
                    hintText: "Enter Patient Name",
                    hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                    errorText: PnameError ? "Please Enter Patient Name" : null
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: Pemail,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      PemailError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  keyboardType: TextInputType.emailAddress,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kWhite,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kDarkBlue3,width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kError,width: 2),
                      ),
                      prefixIcon: Icon(CupertinoIcons.mail,color: kDarkBlue3,),
                      hintText: "Enter Patient Email",
                      hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                      errorText: PemailError ? "Please Enter Patient Email" : null
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: PAge,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      PAgeError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  keyboardType: TextInputType.number,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kWhite,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kDarkBlue3,width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kError,width: 2),
                      ),
                      prefixIcon: Icon(CupertinoIcons.person,color: kDarkBlue3,),
                      hintText: "Enter Patient Age",
                      hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                      errorText: PAgeError ? "Please Enter Patient Age" : null
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: Pnumber,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      PnumberError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  keyboardType: TextInputType.number,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kWhite,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kDarkBlue3,width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kError,width: 2),
                      ),
                      prefixIcon: Icon(CupertinoIcons.phone,color: kDarkBlue3,),
                      hintText: "Enter Patient Contact",
                      hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                      errorText: PnumberError ? "Please Enter Patient Contact" : null
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: PaltNumber,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      PaltNumberError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  keyboardType: TextInputType.number,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kWhite,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kDarkBlue3,width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kError,width: 2),
                      ),
                      prefixIcon: Icon(CupertinoIcons.phone,color: kDarkBlue3,),
                      hintText: "Enter Patient Alternate Number",
                      hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                      errorText: PaltNumberError ? "Please Enter Patient Alternate Number" : null
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: Cname,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      CnameError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kWhite,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kDarkBlue3,width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kError,width: 2),
                      ),
                      prefixIcon: Icon(CupertinoIcons.person,color: kDarkBlue3,),
                      hintText: "Enter Companion Name",
                      hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                      errorText: CnameError ? "Please Enter Companion Name" : null
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: Cnumber,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      CnumberError = false;
                      setState(() {

                      });
                    }
                  },
                  cursorColor: kDarkBlue3,
                  keyboardType: TextInputType.number,
                  onTapOutside: (event) =>
                      FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3,fontSize: h * 0.018,fontWeight: FontWeight.w700)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kWhite,width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kDarkBlue3,width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: kError,width: 2),
                      ),
                      prefixIcon: Icon(CupertinoIcons.phone,color: kDarkBlue3,),
                      hintText: "Enter Companion Contact",
                      hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: kDarkBlue3.withOpacity(0.3),fontSize: h * 0.018,fontWeight: FontWeight.w600)),
                      errorText: CnumberError ? "Please Enter Companion Contact" : null
                  ),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.02,),
                        textWidget(msg: "Gender :", txtColor: kBlack, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.023),

                      ],
                    ),
                  SizedBox(width: w * 0.04,),
                  Column(
crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: kDarkBlue3,
                            value: male, groupValue: Gender, onChanged: (value) {
                            Gender = value!;
                            setState(() {

                            });
                          },),
                          textWidget(msg: "Male", txtColor: kBlack, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.018),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: kDarkBlue3,
                            value: female, groupValue: Gender, onChanged: (value) {
                            Gender = value!;
                            setState(() {

                            });
                          },),
                          textWidget(msg: "Female", txtColor: kBlack, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.018),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: kDarkBlue3,
                            value: other, groupValue: Gender, onChanged: (value) {
                            Gender = value!;
                            setState(() {

                            });
                          },),
                          textWidget(msg: "Other", txtColor: kBlack, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.018),
                        ],
                      )
                    ],
                  )
                ],
              ),

              SizedBox(height: h * 0.02,),

              InkWell(
                onTap: () async {
                  String PNAME = Pname.text.trim();
                  String PEMAIL = Pemail.text.trim();
                  String PAGE = PAge.text.trim();
                  String CNAME = Cname.text.trim();
                  String CNUMBER = Cnumber.text.trim();
                  String PNUMBER = Pnumber.text.trim();
                  String PALTNUMBER = PaltNumber.text.trim();

                  if(PNAME.isEmpty){
                    PnameError = true;
                    setState(() {

                    });
                  }
                  else if(PEMAIL.isEmpty){
                    PemailError = true;
                    setState(() {

                    });
                  }
                  else if(PAGE.isEmpty){
                    PAgeError = true;
                    setState(() {

                    });
                  }
                  else if(PNUMBER.isEmpty){
                    PnumberError = true;
                    setState(() {

                    });
                  }
                  else if(PALTNUMBER.isEmpty){
                    PaltNumberError = true;
                    setState(() {

                    });
                  }
                  else if(CNAME.isEmpty){
                    CnameError = true;
                    setState(() {

                    });
                  }
                  else if(CNUMBER.isEmpty){
                    CnumberError = true;
                    setState(() {

                    });
                  }
                  else if(Gender.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        width: w * 0.9,
                        behavior: SnackBarBehavior.floating,
                        content: Center(
                          child: Text(
                            'Choose Your Gender',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        backgroundColor: kError,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }

                  else{

                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return FrostedGlass(
                            widget: AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              backgroundColor: kWhite.withOpacity(0.6),
                              content: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(height: h * 0.05,width: h * 0.05,child: CircularProgressIndicator(color: kDarkBlue3,strokeWidth: 5,)),
                                    SizedBox(width: w * 0.1,),
                                    textWidget(msg: "Please Wait", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02)
                                  ],
                                ),
                              ),
                            )
                        );
                      },
                    );

                    var link = Uri.parse("https://flutteranadh.000webhostapp.com/Hospital/appointment.php");

                    Map m = {
                      'appoDate': widget.appoDate,
                      'appoTime': widget.appoTime,
                      'appoDoctor': widget.appoDoctor,
                      'reason': widget.reason,
                      'pname': PNAME,
                      'pemail': PEMAIL,
                      'page': PAGE,
                      'cname': CNAME,
                      'cnumber': CNUMBER,
                      'pnumber': PNUMBER,
                      'paltnumber': PALTNUMBER,
                      'gender': Gender,
                      'uid': UID
                    };

                    print("URL");
                    var response = await http.post(link, body: m);

                    Navigator.pop(context);
                    print("Response");

                    if (response.statusCode == 200) {
                      print("response : ${response.body}");
                      Map map = jsonDecode(response.body);

                      int result = map['result'];
                      print("result :- $result");
                      if (result == 1) {



                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Center(
                              child: Text(
                                'Your Appointment is Booked',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            backgroundColor: kGreen,
                            duration: Duration(seconds: 2),
                          ),
                        );

                        Navigator.pushReplacement(context, FadeRoute1(profileShow()));
                      }
                      else if(result == 0){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'System Error',
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
                    }

                  }
                },
                child: Container(
                  height: h * 0.05,
                  width: w * 0.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: AppbarGrad, begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: kBlack,
                        offset: Offset(2, 4),
                        blurRadius: 20,
                        spreadRadius: -17
                      )
                    ]
                  ),
                  child: textWidget(msg: "Submit", txtColor: kWhite, txtFontWeight: FontWeight.w700, txtFontSize: h * 0.02),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
