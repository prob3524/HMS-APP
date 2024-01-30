import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Drawer/drawerScreen.dart';
import 'package:realestate/pages/ForgotPassword.dart';
import 'package:realestate/pages/Home.dart';
import 'package:realestate/pages/profile.dart';
import 'package:realestate/widgets/text.dart';
import 'package:realestate/widgets/textField.dart';

import '../data/Model.dart';
import 'Register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var h, w;

  TextEditingController user = TextEditingController();
  bool userError = false;
  String userErrorMsg = "";

  TextEditingController password = TextEditingController();
  bool passwordError = false;
  String PasswordErrorMsg = "";

  bool _click = false;
  bool hidePass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                  margin: EdgeInsets.only(top: 90, left: 140),
                  child: textWidget(
                      msg: "Login",
                      txtColor: kWhite,
                      txtFontWeight: FontWeight.bold,
                      txtFontSize: h * 0.05)),
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
                              msg: "User",
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
                          controller: user,
                          canRequestFocus: true,
                          keyboardType: TextInputType.emailAddress,
                          onTapOutside: (event) => FocusScope.of(context).unfocus(),
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                            color: kBlack,
                            fontSize: h * 0.017,
                            fontWeight: FontWeight.w500,
                          )),
                          cursorColor: kDarkBlue,
                          onChanged: (value) {
                            if(userError){
                              if(value.isNotEmpty){
                                userError = false;
                                setState(() {

                                });
                              }
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Email or Mobile",
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
                        Padding(padding: EdgeInsets.only(left: 40),
                          child: textWidget(msg: userError ? userErrorMsg : "", txtColor: kError, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.016),

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
                          controller: password,
                          canRequestFocus: true,
                          keyboardType: TextInputType.text,
                          onTapOutside: (event) => FocusScope.of(context).unfocus(),
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                            color: kBlack,
                            fontSize: h * 0.017,
                            fontWeight: FontWeight.w500,
                          )),
                          cursorColor: kDarkBlue,
                          obscureText: hidePass,
                          onChanged: (value) {
                            if(passwordError){
                              if(value.isNotEmpty){
                                passwordError = false;
                                setState(() {

                                });
                              }
                            }

                          },
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
                                    setState(() {

                                    });
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
                        Padding(padding: EdgeInsets.only(left: 40),
                          child: textWidget(msg: passwordError ? PasswordErrorMsg : "", txtColor: kError, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.016),

                        )
                      ],
                    ),

                    // forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(left: 40),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return Register();
                              },));
                            },
                            child: Text(
                              "Don't have an Account ?",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: kDarkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: h * 0.016,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPass(),));
                            },
                            child: Text(
                              "Forgot Password ?",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: kDarkBlue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: h * 0.016,
                                      decoration: TextDecoration.underline)),
                            ),
                          ),
                        )
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
                            setState(() {

                            });

                            String USER = user.text.trim();
                            String PASSWORD = password.text.trim();

                            if(USER.isEmpty){
                              userError = true;
                              _click = false;
                              userErrorMsg = "Please Email or mobile !";
                              setState(() {

                              });
                            }
                            else if(PASSWORD.isEmpty){
                              passwordError = true;
                              _click = false;
                              PasswordErrorMsg = "Please Enter your Password !";
                              setState(() {

                              });
                            }
                            else{

                              String api = 'https://flutteranadh.000webhostapp.com/Hospital/login.php?username=$USER&password=$PASSWORD';

                              var response = await Dio().get(api);
                              print("response :- $response");

                              if(response.statusCode == 200){
                                Map map = jsonDecode(response.data);

                                int result = map['result'];
                                print("result :- $result");

                                if(result == 0)
                                {
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
                                        'Check Your Details Again',
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
                                else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)),
                                      width: w * 0.9,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        'Login Successfully',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: kWhite,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      backgroundColor: kGreen,
                                      duration: Duration(seconds: 1),
                                    ),
                                  );


                                  Map data = map['data'];

                                  String id = "${data['id']}";
                                  String image = "https://flutteranadh.000webhostapp.com/Hospital/${data['image']}";
                                  String name = "${data['name']}";
                                  String email = "${data['email']}";
                                  String Mono = "${data['mono']}";
                                  String password = "${data['password']}";
                                  String bdate = "${data['bdate']}";
                                  String gender = "${data['gender']}";
                                  print(data);

                                  await Model.prefs!.setString('id', id);
                                  await Model.prefs!.setString('Image', image);
                                  await Model.prefs!.setString('Name', name);
                                  await Model.prefs!.setString('Email', email);
                                  await Model.prefs!.setString('Mono', Mono);
                                  await Model.prefs!.setString('Password', password);
                                  await Model.prefs!.setString('Bdate', bdate);
                                  await Model.prefs!.setString('Gender', gender);

                                  if(image == "null" || name == "null" || bdate == "null" || gender == "null"){
                                    await Model.prefs!.setInt('signIN', 1);
                                    Navigator.pushReplacement(context, FadeRoute1(Profile()));
                                  }
                                  else{
                                    await Model.prefs!.setInt('signIN', 2);
                                    Navigator.pushReplacement(context, FadeRoute1(drawerScreen(2)));
                                  }


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
                                      colors: loginButtonGrad,
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
                                      msg: "Login",
                                      txtColor: kWhite,
                                      txtFontWeight: FontWeight.bold,
                                      txtFontSize: h * 0.02)),
                        ),
                      ],
                    ),

                    SizedBox(height: h * 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(msg: "OR", txtColor: kGrey, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.017)
                      ],
                    ),

                    // Social Login
                    SizedBox(height: h * 0.003,),
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
                            child: Image.asset("images/google.png",fit: BoxFit.cover,),
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
                            child: Image.asset("images/facebook.png",fit: BoxFit.cover,),
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
                            child: Image.asset("images/instagram.png",fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    )
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
