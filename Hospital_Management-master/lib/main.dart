import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/pages/splash.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: splash(),));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}