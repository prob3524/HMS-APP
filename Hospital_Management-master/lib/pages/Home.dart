import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/Lists.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Doctors.dart';
import 'package:realestate/pages/FinalHome.dart';
import 'package:realestate/pages/TopDoctors.dart';
import 'package:realestate/pages/searchPage.dart';
import 'package:realestate/widgets/frostedGlass.dart';
import 'package:realestate/widgets/infoCard.dart';
import 'package:realestate/widgets/text.dart';
import 'package:unicons/unicons.dart';

import '../data/Model.dart';
import 'Settings.dart';
import 'appointment.dart';

class Home extends StatefulWidget {

  int i;

  Home(this.i);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var h, w;

  var _pageController;
  var _controller;

  int maxCount = 5;

  String IMAGE = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    IMAGE = Model.prefs!.getString('Image') ?? "";
    /// Controller to handle PageView and also handles initial page
    _pageController = PageController(initialPage: widget.i);

    /// Controller to handle bottom nav bar and also handles initial page
    _controller = NotchBottomBarController(index: widget.i);
    pageDirection = widget.i;
  }

  int? pageDirection;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const searchPage(),
    const appointment(),
    const FinalHome(),
    const TopDoctors(),
    const Settings(),
  ];

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeBG,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageDirection!,
        height: h * 0.08,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeOut,
        buttonBackgroundColor: kWhite,
        items: <Widget>[
          Image.asset(
            'images/search.png',
            width: w * 0.07,
            color: Colors.blueGrey,
          ),
          Image.asset(
            'images/calendar.png',
            width: w * 0.07,
            color: Colors.blueGrey,
          ),
          Image.asset(
            'images/home1.png',
            width: w * 0.07,
            color: Colors.blueGrey,
          ),
          Image.asset(
            'images/doctor2.png',
            width: w * 0.07,
            color: Colors.blueGrey,
          ),
          Image.asset(
            'images/settings.png',
            width: w * 0.07,
            color: Colors.blueGrey,
          ),
        ],
        onTap: (index) {
          setState(() {
            log('current selected index $index');

            pageDirection = index;

            _pageController.animateToPage(
              pageDirection,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        },
      ),

      // AnimatedNotchBottomBar(
      //   /// Provide NotchBottomBarController
      //   notchBottomBarController: _controller,
      //   color: Colors.white,
      //   showLabel: false,
      //   notchColor: kDarkBlue3,
      //
      //   /// restart app if you change removeMargins
      //   removeMargins: false,
      //   bottomBarWidth: 500,
      //   durationInMilliSeconds: 300,
      //   bottomBarItems: [
      //
      //     BottomBarItem(
      //       inActiveItem: Image.asset(
      //         'images/search.png',
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Image.asset(
      //         'images/search.png',
      //         color: Colors.white,
      //       ),
      //       itemLabel: 'Page 1',
      //     ),
      //
      //
      //     BottomBarItem(
      //       inActiveItem: Image.asset(
      //         'images/calendar.png',
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Image.asset(
      //         'images/calendar.png',
      //         color: Colors.white,
      //       ),
      //       itemLabel: 'Page 3',
      //     ),
      //     BottomBarItem(
      //       inActiveItem: Image.asset(
      //         'images/home1.png',
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Image.asset(
      //         'images/home1.png',
      //         color: Colors.white,
      //       ),
      //       itemLabel: 'Page 2',
      //     ),
      //     BottomBarItem(
      //       inActiveItem: Image.asset(
      //         'images/doctor2.png',
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Image.asset(
      //         'images/doctor2.png',
      //         color: Colors.white,
      //       ),
      //       itemLabel: 'Page 4',
      //     ),
      //     BottomBarItem(
      //       inActiveItem: Image.asset(
      //         'images/settings.png',
      //         color: Colors.blueGrey,
      //       ),
      //       activeItem: Image.asset(
      //         'images/settings.png',
      //         color: Colors.white,
      //       ),
      //       itemLabel: 'Page 5',
      //     ),
      //   ],
      //   onTap: (index) {
      //     /// perform action on tab change and to update pages you can update pages without pages
      //     log('current selected index $index');
      //     _pageController.animateToPage(
      //       index,
      //       duration: Duration(milliseconds: 400),
      //       curve: Curves.easeInOut,
      //     );
      //   },
      // ),

      // StylishBottomBar(
      //   backgroundColor: kWhite,
      //     elevation: 10,
      //     items: [
      //       BottomBarItem(
      //
      //           icon: Icon(EvaIcons.home,color: kBlack,),
      //           title: textWidget(
      //               msg: "Home",
      //               txtColor: kBlack,
      //               txtFontWeight: FontWeight.w600,
      //               txtFontSize: h * 0.019),
      //         selectedColor: Color(0xffd4c4ed),
      //         backgroundColor: Color(0xffd4c4ed),
      //         showBadge: true,
      //       ),
      //       BottomBarItem(
      //         icon: Icon(EvaIcons.calendar,color: kBlack,),
      //         title: textWidget(
      //             msg: "Appointment",
      //             txtColor: kBlack,
      //             txtFontWeight: FontWeight.w600,
      //             txtFontSize: h * 0.019),
      //         selectedColor: Color(0xffc4edc5),
      //         backgroundColor: Color(0xffc4edc5),
      //         showBadge: true,
      //       ),
      //       BottomBarItem(
      //
      //         icon: Icon(EvaIcons.settings2,color: kBlack,),
      //         title: textWidget(
      //             msg: "Settings",
      //             txtColor: kBlack,
      //             txtFontWeight: FontWeight.w600,
      //             txtFontSize: h * 0.019),
      //         selectedColor: Color(0xffece3bf),
      //         backgroundColor: Color(0xffece3bf),
      //         showBadge: true,
      //       ),
      //     ],
      //     currentIndex: selected,
      //     onTap: (index) {
      //       setState(() {
      //         selected = index;
      //         controller.animateToPage(
      //           index,
      //           duration: Duration(milliseconds: 300),
      //           curve: Curves.easeInOut,
      //         );
      //       });
      //     },
      //     option: BubbleBarOptions(
      //         barStyle: BubbleBarStyle.horizotnal,
      //         bubbleFillStyle: BubbleFillStyle.fill)),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // flexibleSpace: Container(
        //   decoration:
        //       BoxDecoration(gradient: LinearGradient(colors: AppbarGrad)),
        // ),
        // centerTitle: true,
        leading: InkWell(
          onTap: () {
            // if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            // } else {
            //   ZoomDrawer.of(context)!.open();
            // }
          },
          child: Container(
              height: h * 0.03,
              width: w * 0.03,
              padding: EdgeInsets.all(17),
              child: Image.asset(
                'images/menu.png',
                width: w * 0.03,
                color: kDarkBlue3,
              )),
        ),
        title: Text("",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.bold,
                    color: kBlack))),
        actions: [
          InkWell(
            onTap: () {

              if(IMAGE != "null"){
                showDialog(
                  context: context,
                  builder: (context) {
                    return FrostedGlass(
                        widget: AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.transparent,
                          content: Container(
                            height: h * 0.3,
                            width: h * 0.4,
                            decoration: BoxDecoration(
                                color: kWhite,
                                shape: BoxShape.circle,
                                image: DecorationImage(image: NetworkImage(IMAGE),fit: BoxFit.cover)
                            ),
                          ),
                        )
                    );
                  },
                );
              }


            },
            child: Container(
              height: h * 0.01,
              width: w * 0.12,
              margin: EdgeInsets.only(right: 20, top: 5, bottom: 5),
              padding: IMAGE == "null" ? EdgeInsets.all(5) : EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: kDarkBlue3,
                boxShadow: [
                  BoxShadow(color: kBlack, spreadRadius: -12, blurRadius: 20)
                ],
              ),
              child: IMAGE == "null"
                  ? Image.asset("images/man.png")
                  : Container(
                      height: h * 0.01,
                      width: w * 0.12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(IMAGE), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
            ),
          )
        ],
      ),
      // extendBody: true,
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            searchPage(),
            appointment(),
            FinalHome(),
            TopDoctors(),
            Settings(),
          ]),
    );
  }
}

class SlideTransition1 extends PageRouteBuilder {
  final Widget page;

  SlideTransition1(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 1000),
            reverseTransitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: page,
              );
            });
}
