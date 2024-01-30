import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/login.dart';

import '../data/Model.dart';
import '../widgets/text.dart';
import 'Drawer/drawerScreen.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  var h, w;

  TextEditingController email = TextEditingController();
  bool emailError = false;
  String emailErrorMsg = "";

  TextEditingController mono = TextEditingController();
  bool monoError = false;
  String monoErrorMsg = "";

  TextEditingController pass = TextEditingController();
  bool passError = false;
  String passErrorMsg = "";

  int textLength = 0;

  bool hidePass = true;

  bool _click = false;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: loginGradient,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: h * 0.75,
                width: w,
                margin: EdgeInsets.only(top: 210),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [

                    //Email textfield
                    SizedBox(
                      height: h * 0.09,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: textWidget(
                              msg: "Email",
                              txtColor: kDarkBlue,
                              txtFontWeight: FontWeight.w600,
                              txtFontSize: h * 0.02),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Container(
                        height: h * 0.065,
                        width: w * 0.87,
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: textFieldGrad,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  color: kBlack,
                                  blurRadius: 15,
                                  spreadRadius: -13,
                                  offset: Offset(2, 4))
                            ]),
                        child: TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: kDarkBlue,
                                fontSize: h * 0.017,
                                fontWeight: FontWeight.w500,
                              )),
                          cursorColor: kDarkBlue,
                          onTapOutside: (event) => FocusScope.of(context).unfocus(),
                          onChanged: (value) {
                            if (emailError) {
                              if (value.isNotEmpty) {
                                emailError = false;
                                setState(() {});
                              }
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Email",
                            hintStyle: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: kDarkBlue2,
                                  fontSize: h * 0.017,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: textWidget(
                              msg: emailError ? emailErrorMsg : "",
                              txtColor: kError,
                              txtFontWeight: FontWeight.w500,
                              txtFontSize: h * 0.016),
                        )
                      ],
                    ),

                    //Mobile textfield
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: textWidget(
                              msg: "Contact",
                              txtColor: kDarkBlue,
                              txtFontWeight: FontWeight.w600,
                              txtFontSize: h * 0.02),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Container(
                        height: h * 0.065,
                        width: w * 0.87,
                        padding: EdgeInsets.only(left: 20,top: 4,right: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: textFieldGrad,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  color: kBlack,
                                  blurRadius: 15,
                                  spreadRadius: -13,
                                  offset: Offset(2, 4))
                            ]),
                        child: TextField(
                          controller: mono,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: kDarkBlue,
                                fontSize: h * 0.017,
                                fontWeight: FontWeight.w500,
                              )),
                          cursorColor: kDarkBlue,
                          onTapOutside: (event) => FocusScope.of(context).unfocus(),
                          onChanged: (value) {
                            textLength = value.length;
                            if (monoError) {
                              if (value.isNotEmpty) {
                                monoError = false;
                                setState(() {});
                              }
                            }
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Contact",
                            counter: Offstage(),
                            suffix: Text("$textLength / 10",style: GoogleFonts.notoSans(textStyle: TextStyle(color: kDarkBlue,
                              fontSize: h * 0.017,
                              fontWeight: FontWeight.w500,)),),
                            prefix: Text("+91  ",style: GoogleFonts.notoSans(textStyle: TextStyle(color: kDarkBlue,
                              fontSize: h * 0.017,
                              fontWeight: FontWeight.w500,)),),
                            hintStyle: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: kDarkBlue2,
                                  fontSize: h * 0.017,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: textWidget(
                              msg: monoError ? monoErrorMsg : "",
                              txtColor: kError,
                              txtFontWeight: FontWeight.w500,
                              txtFontSize: h * 0.016),
                        )
                      ],
                    ),

                    //password textfield
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: textWidget(
                              msg: "Password",
                              txtColor: kDarkBlue,
                              txtFontWeight: FontWeight.w600,
                              txtFontSize: h * 0.02),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Container(
                        height: h * 0.065,
                        width: w * 0.87,
                        padding: EdgeInsets.only(left: 20, top: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: textFieldGrad,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  color: kBlack,
                                  blurRadius: 15,
                                  spreadRadius: -13,
                                  offset: Offset(2, 4))
                            ]),
                        child: TextField(
                          controller: pass,
                          canRequestFocus: true,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: kDarkBlue,
                                fontSize: h * 0.017,
                                fontWeight: FontWeight.w500,
                              )),
                          cursorColor: kDarkBlue,
                          onTapOutside: (event) => FocusScope.of(context).unfocus(),
                          onChanged: (value) {
                            if (passError) {
                              if (value.isNotEmpty) {
                                passError = false;
                                setState(() {});
                              }
                            }
                          },
                          obscureText: hidePass,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Password",
                            hintStyle: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: kDarkBlue2,
                                  fontSize: h * 0.017,
                                  fontWeight: FontWeight.w500,
                                )),
                            suffixIcon: Container(
                              height: h * 0.04,
                              width: h * 0.04,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 5),
                              child: IconButton(
                                  onPressed: () {
                                    hidePass = !hidePass;
                                    setState(() {});
                                  },
                                  icon: AnimatedCrossFade(
                                      firstChild: Icon(
                                        Icons.visibility_outlined,
                                        color: kDarkBlue,
                                      ),
                                      secondChild: Icon(
                                        Icons.visibility_off_outlined,
                                        color: kDarkBlue,
                                      ),
                                      crossFadeState: hidePass
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                      duration: Duration(milliseconds: 300))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: textWidget(
                              msg: passError ? passErrorMsg : "",
                              txtColor: kError,
                              txtFontWeight: FontWeight.w500,
                              txtFontSize: h * 0.016),
                        )
                      ],
                    ),

                    // forgot password
                    SizedBox(
                      height: h * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(left: 40,top: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return login();
                              },));
                            },
                            child: Text(
                              "Already have an Account ?",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: kDarkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: h * 0.016,
                                  )),
                            ),
                          ),
                        ),

                      ],
                    ),

                    // Submit Button
                    SizedBox(
                      height: h * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            _click = true;
                            setState(() {

                            });
                            String EMAIL = email.text.trim();
                            String MONO = mono.text.trim();
                            String PASSWORD = pass.text.trim();
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(EMAIL);
                            bool passValid = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                .hasMatch(PASSWORD);

                            if (EMAIL.isEmpty) {
                              emailError = true;
                              _click = false;
                              emailErrorMsg = "Please Enter your Email!";
                              setState(() {});
                            }
                            else if (!emailValid){
                              emailError = true;
                              _click = false;
                              emailErrorMsg = "Please Enter Email in right way !";
                              setState(() {});
                            }
                            else if (MONO.isEmpty) {
                              monoError = true;
                              _click = false;
                              monoErrorMsg = "Please Enter your Contact !";
                              setState(() {});
                            }
                            else if (MONO.length < 10) {
                              monoError = true;
                              _click = false;
                              monoErrorMsg = "Please Enter 10 Digit Number !";
                              setState(() {});
                            }
                            else if (PASSWORD.isEmpty) {
                              passError = true;
                              _click = false;
                              passErrorMsg = "Please Enter your Password !";
                              setState(() {});
                            }
                            else if (!passValid){
                              passError = true;
                              _click = false;
                              passErrorMsg = "Password have an [A-Z] [a-z] [0-9] 8 Character !";
                              setState(() {});
                            }
                            else {
                              await Model.prefs!.setInt('signIN', 1);


                              var link = Uri.parse("https://flutteranadh.000webhostapp.com/Hospital/register.php");

                              Map m = {
                                'txtemail': EMAIL,
                                'txtmono': MONO,
                                'txtpassword': PASSWORD
                              };

                              print("URL");
                              var response = await http.post(link, body: m);

                              print("Response");

                              if (response.statusCode == 200) {
                                print("response : ${response.body}");
                                Map map = jsonDecode(response.body);

                                int result = map['result'];
                                print("result :- $result");
                                if (result == 1) {
                                  _click = false;
                                  setState(() {

                                  });


                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)),
                                      width: w * 0.9,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        'Registered Successfully',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: kWhite,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      backgroundColor: kGreen,
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                  Navigator.pushReplacement(context, FadeRoute1(login()));
                                }
                                else if(result == 2){
                                  _click = false;
                                setState(() {

                                });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)),
                                      width: w * 0.9,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        'Already have an Account',
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
                                else if(result == 0){
                                  _click = false;
                                  setState(() {

                                  });
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

                            setState(() {});
                          },
                          child: Container(
                              height: h * 0.06,
                              width: w * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: loginGradient,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight),
                                  boxShadow: [
                                    BoxShadow(
                                        color: kBlack,
                                        spreadRadius: -12,
                                        blurRadius: 20,
                                        offset: Offset(2, 4)),
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                              child: _click == true
                                  ? Container(
                                  height: h * 0.02,
                                  width: h * 0.02,
                                  child: CircularProgressIndicator(
                                    color: kWhite,
                                    strokeWidth: 3,
                                  ))
                                  : textWidget(
                                  msg: "Sign Up",
                                  txtColor: kWhite,
                                  txtFontWeight: FontWeight.bold,
                                  txtFontSize: h * 0.02)),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: h * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(
                            msg: "OR",
                            txtColor: kGrey,
                            txtFontWeight: FontWeight.bold,
                            txtFontSize: h * 0.017)
                      ],
                    ),

                    // Social Login
                    SizedBox(
                      height: h * 0.003,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                width: w * 0.9,
                                behavior: SnackBarBehavior.floating,
                                content: Center(
                                  child: Text(
                                    'This functionality will be adding soon ...',
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
                          },
                          child: Container(
                            height: h * 0.055,
                            width: h * 0.055,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: kBlack,
                                    spreadRadius: -12,
                                    blurRadius: 20,
                                    offset: Offset(2, 4)),
                              ],
                            ),
                            child: Image.asset(
                              "images/google.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                width: w * 0.9,
                                behavior: SnackBarBehavior.floating,
                                content: Center(
                                  child: Text(
                                    'This functionality will be adding soon ...',
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
                          },
                          child: Container(
                            height: h * 0.055,
                            width: h * 0.055,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: kBlack,
                                    spreadRadius: -12,
                                    blurRadius: 20,
                                    offset: Offset(2, 4)),
                              ],
                            ),
                            child: Image.asset(
                              "images/facebook.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                width: w * 0.9,
                                behavior: SnackBarBehavior.floating,
                                content: Center(
                                  child: Text(
                                    'This functionality will be adding soon ...',
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
                          },
                          child: Container(
                            height: h * 0.055,
                            width: h * 0.055,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: kBlack,
                                    spreadRadius: -12,
                                    blurRadius: 20,
                                    offset: Offset(2, 4)),
                              ],
                            ),
                            child: Image.asset(
                              "images/instagram.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: h * 0.09,
                left: w * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                      top: h * 0.3,
                      left: w * 0.26,
                      child: Container(
                        height: h * 0.09,
                        width: w * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Lottie.network(
                            "https://assets5.lottiefiles.com/packages/lf20_2TUV98WaqI.json",
                            frameRate: FrameRate(120),
                            fit: BoxFit.cover),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 50,left: 30),
                      child: textWidget(msg: "Sign Up", txtColor: kWhite, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.04),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
