import 'dart:convert';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../data/globals.dart';
import '../data/pageTransitions.dart';
import '../widgets/frostedGlass.dart';
import '../widgets/text.dart';
import 'Register.dart';
import 'login.dart';

import 'package:http/http.dart' as http;

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  var h, w;

  TextEditingController email = TextEditingController();
  bool emailError = false;
  String emailErrorMsg = "";

  bool hidePass = true;

  bool _click = false;

  OtpFieldController Otp = OtpFieldController();
  var VerifyOTP;
  TextEditingController newPass = TextEditingController();
  TextEditingController ConfirmPassWord = TextEditingController();

  EmailOTP myauth = EmailOTP();

  bool getotpprogress = false;
  bool passCheck = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  otpConfig() {
    try {
      myauth.setConfig(
          appEmail: "anadhsuhagiya15@gmail.com",
          appName: "Dartania",
          userEmail: email.text,
          otpLength: 6,
          otpType: OTPType.digitsOnly);
    } catch (e) {
      print(e);
    }
  }

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
                  margin: EdgeInsets.only(top: 90, left: 85),
                  child: textWidget(
                      msg: "Forgot Password",
                      txtColor: kWhite,
                      txtFontWeight: FontWeight.bold,
                      txtFontSize: h * 0.035)),
              Container(
                height: h * 0.60,
                width: w,
                margin: EdgeInsets.only(top: 350),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [

                    //User textfield
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
                        padding: EdgeInsets.only(left: 20,right: 15),
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
                          canRequestFocus: true,
                          keyboardType: TextInputType.emailAddress,
                          onTapOutside: (event) => FocusScope.of(context).unfocus(),
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: kDarkBlue,
                                fontSize: h * 0.017,
                                fontWeight: FontWeight.w500,
                              )),
                          cursorColor: kDarkBlue,
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
                            suffix: InkWell(onTap: () async {
                              getotpprogress = true;
                              setState(() {});
                              myauth.setConfig(
                                  appEmail:
                                  "anadhsuhagiya15@gmail.com",
                                  appName: "24 x 7",
                                  userEmail: email.text,
                                  otpLength: 6,
                                  otpType:
                                  OTPType.digitsOnly);
                              if (await myauth.sendOTP() ==
                                  true) {
                                getotpprogress = false;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    width: w * 0.9,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      'OTP has been sent',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: kWhite,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    backgroundColor: kGreen,
                                    duration: Duration(seconds: 1),
                                  ),
                                );

                              } else {
                                getotpprogress = false;
                                setState(() {});

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    width: w * 0.9,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      'Oops, Otp Sending Failed',
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

                            },child: textWidget(msg: "Get OTP", txtColor: kDarkBlue, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.019)),
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
                              msg: "OTP",
                              txtColor: kDarkBlue,
                              txtFontWeight: FontWeight.w600,
                              txtFontSize: h * 0.02),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: OTPTextField(
                        controller: Otp,
                        length: 6,
                        width: w * 0.9,
                        fieldWidth: 50,
                        otpFieldStyle: OtpFieldStyle(
                          backgroundColor:
                          kLightBlue2.withOpacity(0.2),
                          borderColor:
                          kLightBlue2.withOpacity(0.2),
                          focusBorderColor: kLightBlue2,
                        ),
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            fontSize: h * 0.023,
                            color: kDarkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textFieldAlignment:
                        MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                          VerifyOTP = pin;
                          setState(() {});
                        },
                      ),
                    ),

                    SizedBox(height: h * 0.02,),
                    // forgot password
                    Row(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(left: 40),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Register();
                              },));
                            },
                            child: Text(
                              "Return to Login",
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
                        GestureDetector(
                          onTap: () async {
                            _click = true;

                            String EMAIL = email.text.trim();
                            String OTP = Otp.toString();

                            if (EMAIL.isEmpty) {
                              emailError = true;
                              _click = false;
                              emailErrorMsg = "Please Enter your Email or mobile !";
                              setState(() {});
                            }
                            else if(VerifyOTP == ""){
                              _click = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  width: w * 0.9,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Enter OTP',
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
                            else {
                              if (await myauth.verifyOTP(otp: VerifyOTP) == true) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        height: h * 0.3,
                                        width: w * 0.3,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsets.all(
                                                  10),
                                              child: TextField(
                                                controller:
                                                newPass,
                                                cursorColor:
                                                Colors.black,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: kDarkBlue,
                                                        fontSize: h *
                                                            0.016,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                                decoration: InputDecoration(
                                                    hintText:
                                                    "Enter New Password",
                                                    label: Text(
                                                      "New Password",style: TextStyle(color: kDarkBlue),)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.all( 10),
                                              child: TextField(
                                                controller: ConfirmPassWord,
                                                cursorColor:  kDarkBlue,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: kDarkBlue,
                                                        fontSize: h * 0.016,
                                                        fontWeight: FontWeight.bold)),
                                                decoration: InputDecoration(
                                                    hintText:
                                                    "Enter Confirm Password",
                                                    label: Text(
                                                      "Confirm Password",style: TextStyle(color: kDarkBlue),)),
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                InkWell(
                                                  onTap:
                                                      () async {
                                                    String newPassss = newPass.text.trim();
                                                    String ConPassss = ConfirmPassWord.text.trim();

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

                                                    var link = Uri.parse("https://flutteranadh.000webhostapp.com/Hospital/forgot.php");

                                                    Map m = {
                                                      'email': email.text.trim(),
                                                      'password': ConPassss,
                                                    };

                                                    print("URL");
                                                    var response = await http.post(link, body: m);

                                                    print("Response");
                                                    Navigator.pop(context);

                                                    Navigator.pop(context);

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
                                                                'Your Password has been Updated',
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

                                                        Navigator.pushReplacement(context, FadeRoute1(login()));
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


                                                  },
                                                  child:
                                                  Container(
                                                    height: h * 0.04,
                                                    width: w * 0.4,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(11),
                                                        color: kDarkBlue,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black,
                                                              blurRadius: 10,
                                                              spreadRadius: -7)
                                                        ]),
                                                    child: Text(
                                                      "Set Password",
                                                      style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(
                                                              color: kWhite,
                                                              fontSize: h * 0.015,
                                                              fontWeight: FontWeight.bold)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    width: w * 0.9,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      'OTP Verified',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: kWhite,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    backgroundColor: kDarkBlue,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }

                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    width: w * 0.9,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      'Invalid OTP',
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
                                    color: kDarkBlue,
                                    strokeWidth: 3,
                                  ))
                                  : textWidget(
                                  msg: "Verify",
                                  txtColor: kWhite,
                                  txtFontWeight: FontWeight.bold,
                                  txtFontSize: h * 0.02)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: h * 0.2,
                left: w * 0.223,
                child: Container(
                  height: h * 0.2,
                  width: w * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Lottie.network(
                      "https://assets5.lottiefiles.com/packages/lf20_2TUV98WaqI.json",
                      frameRate: FrameRate(120),
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
