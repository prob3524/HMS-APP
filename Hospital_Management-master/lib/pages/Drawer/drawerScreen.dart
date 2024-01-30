
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/Model.dart';
import '../../data/globals.dart';
import '../Home.dart';
import 'MenuScreen.dart';

class drawerScreen extends StatefulWidget {

  int i;

  drawerScreen(this.i);


  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  final zoomDrawerController = ZoomDrawerController();
  String ImagePath = "";

  String NAME = "";
  String EMAIL = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  initData() {

    NAME = Model.prefs!.getString('Name') ?? "";
    EMAIL = Model.prefs!.getString('Email') ?? "";
    ImagePath = Model.prefs!.getString('Image') ?? "";
    print("Name : $NAME");
    print("Email : $EMAIL");
    print("Image : $ImagePath");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MenuScreen(ImagePath,NAME,EMAIL),
      mainScreen: Home(widget.i),
      showShadow: true,
      borderRadius: 30,
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor: kDarkBlue3,
      slideWidth: MediaQuery.of(context).size.width*.65,
      openCurve: Curves.fastOutSlowIn,
      angle: 0.0,
    );
  }
}