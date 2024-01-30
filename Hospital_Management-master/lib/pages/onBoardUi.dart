import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/pages/Home.dart';
import 'package:realestate/pages/login.dart';
import 'package:realestate/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardUI extends StatefulWidget {
  const onBoardUI({super.key});

  @override
  State<onBoardUI> createState() => _onBoardUIState();
}

class _onBoardUIState extends State<onBoardUI> {
  PageController _pageControler = PageController();

  var h, w;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageControler = PageController(initialPage: 0);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: OnBoardGradient,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, right: 30),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login(),));
                                  },
                                  child: textWidget(
                                      msg: "Skip",
                                      txtColor: kWhite,
                                      txtFontWeight: FontWeight.bold,
                                      txtFontSize: 16)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Container(
                          width: w * 0.7,
                          height: w * 0.8,
                          alignment: Alignment.center,
                          child: Lottie.network(
                              "https://assets4.lottiefiles.com/packages/lf20_olluraqu.json",
                              frameRate: FrameRate(120),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: textWidget(
                                    msg: "Take an Appointment",
                                    txtColor: kWhite,
                                    txtFontWeight: FontWeight.bold,
                                    txtFontSize: h * 0.05),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: textWidget(
                                  msg:
                                  "Visit The App and Talk to \nDoctor what's the Problem \nyou have to face !",
                                  txtColor: kWhite,
                                  txtFontWeight: FontWeight.w500,
                                  txtFontSize: h * 0.027),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        textWidget(msg: "<<<  Swipe Left", txtColor: kWhite, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.02)
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: OnBoardGradient2,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.09,
                        ),
                        Container(
                          width: w * 0.7,
                          height: w * 0.8,
                          alignment: Alignment.center,
                          child: Lottie.network(
                              "https://assets6.lottiefiles.com/packages/lf20_fcxpjdtz.json",
                              frameRate: FrameRate(120),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: textWidget(
                                    msg: "Examine whole Body by Specialist Doctor",
                                    txtColor: kWhite,
                                    txtFontWeight: FontWeight.bold,
                                    txtFontSize: h * 0.045),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: textWidget(
                                  msg:
                                  "Whole Checkup Examined by \nspecialist Doctor who\nappoined you !",
                                  txtColor: kWhite,
                                  txtFontWeight: FontWeight.w500,
                                  txtFontSize: h * 0.027),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        textWidget(msg: "<<<  Swipe Left", txtColor: kWhite, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.02)
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: OnBoardGradient3,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.09,
                        ),
                        Container(
                          width: w * 0.7,
                          height: w * 0.8,
                          alignment: Alignment.center,
                          child: Lottie.network(
                              "https://assets6.lottiefiles.com/packages/lf20_dgw6g3d8.json",
                              frameRate: FrameRate(120),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: textWidget(
                                    msg: "Hospital is Open for 24 X 7 ",
                                    txtColor: kWhite,
                                    txtFontWeight: FontWeight.bold,
                                    txtFontSize: h * 0.05),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: textWidget(
                                  msg:
                                  "Open 24 X 7 days a week, \nour hospital is here to \nserve you when you need us most.",
                                  txtColor: kWhite,
                                  txtFontWeight: FontWeight.w500,
                                  txtFontSize: h * 0.027),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login(),));
                    },
                    child: Container(
                      height: h * 0.06,
                      width: w * 0.9,
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: textWidget(msg: "Get Started", txtColor: kBlack, txtFontWeight: FontWeight.bold, txtFontSize: h * 0.02),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
