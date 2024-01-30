import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Home.dart';
import 'package:realestate/pages/login.dart';
import 'package:realestate/pages/profileShow.dart';
import 'package:realestate/widgets/text.dart';

import '../../data/Model.dart';
import '../../data/globals.dart';
import 'drawerScreen.dart';

class MenuScreen extends StatefulWidget {
  String imagePath;
  String name;
  String email;

  MenuScreen(this.imagePath, this.name, this.email);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kDarkBlue3,
      body: Column(
        children: [
          SizedBox(
            height: h * 0.15,
          ),
          Row(
            children: [
              Container(
                height: h * 0.08,
                width: h * 0.08,
                margin: EdgeInsets.only(left: 30),
                padding: widget.imagePath.isEmpty ? EdgeInsets.all(5) : EdgeInsets.all(0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(20)),
                child: widget.imagePath.isEmpty
                    ? Image.asset("images/man.png")
                    : Container(
                    height: h * 0.08,
                    width: h * 0.08,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(widget.imagePath),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: w * 0.07,
              ),
              Flexible(
                child: Text(
                  "${widget.name}",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: kWhite,
                          fontSize: h * 0.026,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
          SizedBox(height: h * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => drawerScreen(),
                  //     ));
                  ZoomDrawer.of(context)!.close();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'images/house.png',
                      width: w * 0.06,
                    ),
                    title: Text("Home",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  ZoomDrawer.of(context)!.close();
                  Navigator.push(context, FadeRoute1(drawerScreen(3)));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'images/doctor.png',
                      width: w * 0.06,
                    ),
                    title: Text("Doctors",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  ZoomDrawer.of(context)!.close();
                  Navigator.push(context, FadeRoute1(drawerScreen(1)));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'images/calendar.png',
                      color: kWhite,
                      width: w * 0.06,
                    ),
                    title: Text("Appointment",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: h * 0.019,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  ZoomDrawer.of(context)!.close();
                  Navigator.push(context, FadeRoute1(profileShow()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'images/appointment.png',
                      width: w * 0.06,
                    ),
                    title: Flexible(
                      child: Text("Booked Appointment",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  ZoomDrawer.of(context)!.close();
                  Navigator.push(context, FadeRoute1(drawerScreen(4)));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'images/settings.png',
                      color: kWhite,
                      width: w * 0.06,
                    ),
                    title: Text("Settings",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: h * 0.019,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () async {
                  Model.prefs!.clear();

                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            login(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'images/log-out.png',
                      width: w * 0.06,
                    ),
                    title: Text("Log Out",
                        style: GoogleFonts.montserrat(textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
