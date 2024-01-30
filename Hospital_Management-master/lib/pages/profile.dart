import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/data/pageTransitions.dart';
import 'package:realestate/pages/Drawer/drawerScreen.dart';

import '../data/Model.dart';
import '../data/haptic.dart';
import '../widgets/DetailsOfDoctors.dart';
import '../widgets/frostedGlass.dart';
import '../widgets/text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImagePicker _picker = ImagePicker();
  var h, w;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Anadh();
  }

  Anadh() async {
    ID = Model.prefs!.getString('id') ?? "";
    image = Model.prefs!.getString('Image') == "null"? "images/add_photo.png" : Model.prefs!.getString('Image') ?? "";
    Name.text = Model.prefs!.getString('Name') == "null"? "" : Model.prefs!.getString('Name') ?? "";
    Email.text = Model.prefs!.getString('Email') ?? "";
    Mono.text = Model.prefs!.getString('Mono') ?? "";
    Bdate.text = Model.prefs!.getString('Bdate') == "null"? "" : Model.prefs!.getString('Bdate') ?? "";
    gender = Model.prefs!.getString('Mono') ?? "";

    print("Image ::: $image");
  }


  int textLength = 0;

  String? ID;

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Mono = TextEditingController();
  TextEditingController Bdate = TextEditingController();

  String image = "images/add_photo.png";
  String name = "";
  String email = "";
  String mono = "";
  String bdate = "";
  String gender = "";

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: textWidget(
                            msg: "Profile Editing",
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      lightImpact();

                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.gallery);

                      // if(photo != null){
                      //   image = photo.path;
                      // }
                      if (photo != null) {
                        CroppedFile? cropimage = await ImageCropper()
                            .cropImage(sourcePath: photo.path);
                        File convertedImage = File(cropimage!.path);
                        if (convertedImage != null) {
                          image = convertedImage.path;
                          setState(() {});
                        }
                      }
                      setState(() {});
                      print(photo!.path);
                    },
                    child: Container(
                        height: h * 0.25,
                        width: h * 0.25,
                        padding: image == "images/add_photo.png"
                            ? EdgeInsets.all(40)
                            : EdgeInsets.all(0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kWhite.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: image == "images/add_photo.png" ? [] : [
                              BoxShadow(
                                  color: kBlack,
                                  blurRadius: 20,
                                  spreadRadius: -17)
                            ]),
                        child: image == "images/add_photo.png"
                            ? Image.asset(
                                image,
                                color: kDarkBlue3,
                                fit: BoxFit.cover,
                              )
                            : image.contains("https",0)
                            ?  Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage("$image"),fit: BoxFit.cover)),
                        )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: FileImage(File(image)),fit: BoxFit.cover)),
                              )),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: Name,
                  cursorColor: kDarkBlue3,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(color: kDarkBlue3, fontSize: h * 0.02),
                      fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 2)),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(color: kDarkBlue3.withOpacity(0.4)),
                      label: textWidget(
                          msg: "Name",
                          txtColor: kDarkBlue3,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.020),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          color: kDarkBlue3,
                          size: 18,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: Email,
                  cursorColor: kDarkBlue3,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(color: kDarkBlue3, fontSize: h * 0.02),
                      fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 2)),
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(color: kDarkBlue3.withOpacity(0.4)),
                      label: textWidget(
                          msg: "Email",
                          txtColor: kDarkBlue3,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.020),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.envelope,
                          color: kDarkBlue3,
                          size: 18,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: Mono,
                  cursorColor: kDarkBlue3,
                  maxLength: 10,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (value) {
                    textLength = value.length;
                    setState(() {
                      
                    });
                  },
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(color: kDarkBlue3, fontSize: h * 0.02),
                      fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 2)),
                      hintText: "Enter Your Mobile Number",
                      hintStyle: TextStyle(color: kDarkBlue3.withOpacity(0.4)),
                      counter: Offstage(),
                      suffix: textWidget(msg: "$textLength / 10", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.02),
                      label: textWidget(
                          msg: "Contact",
                          txtColor: kDarkBlue3,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.020),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.phone,
                          color: kDarkBlue3,
                          size: 18,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: Bdate,
                  cursorColor: kDarkBlue3,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(color: kDarkBlue3, fontSize: h * 0.02),
                      fontWeight: FontWeight.w500),
                  autofocus: false,
                  readOnly: true,
                  onTap: () {
                    DateTime? _chosenDateTime;
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 350,
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    maximumDate: DateTime.now(),
                                    minimumYear: 1920,
                                    onDateTimeChanged: (val) {
                                      setState(() {
                                        _chosenDateTime = val;
                                        Bdate.text =
                                            "${_chosenDateTime!.day} - ${_chosenDateTime!.month} - ${_chosenDateTime!.year}";
                                      });
                                    }),
                              ),
                              CupertinoButton(
                                child: textWidget(
                                    msg: "OK",
                                    txtColor: kDarkBlue3,
                                    txtFontWeight: FontWeight.w600,
                                    txtFontSize: h * 0.019),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: kDarkBlue3, width: 2)),
                      hintText: "Tap to Pick Your BirthDate",
                      hintStyle: TextStyle(color: kDarkBlue3.withOpacity(0.4)),
                      label: textWidget(
                          msg: "BirthDate",
                          txtColor: kDarkBlue3,
                          txtFontWeight: FontWeight.w500,
                          txtFontSize: h * 0.020),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.calendarAlt,
                          color: kDarkBlue3,
                          size: 18,
                        ),
                      )),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w * 0.06,
                  ),
                  textWidget(
                      msg: "Gender :  ",
                      txtColor: kDarkBlue3,
                      txtFontWeight: FontWeight.w600,
                      txtFontSize: h * 0.022),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: kDarkBlue3,
                            value: "Male",
                            groupValue: "$gender",
                            onChanged: (value) {
                              gender = value!;
                              print(gender);
                              setState(() {});
                            },
                          ),
                          Padding(padding: EdgeInsets.only(left: 0),
                          child: textWidget(msg: "Male", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.018),
                          )
                        ],
                      ),
                      SizedBox(width: w * 0.08),
                      Row(
                        children: [
                          Radio(
                            activeColor: kDarkBlue3,
                            value: "Female",
                            groupValue: "$gender",
                            onChanged: (value) {
                              gender = value!;
                              print(gender);
                              setState(() {});
                            },
                          ),
                          Padding(padding: EdgeInsets.only(left: 0),
                            child: textWidget(msg: "Female", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w500, txtFontSize: h * 0.018),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              

              SizedBox(height: h * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      lightImpact();

                      name = Name.text.trim();
                      email = Email.text.trim();
                      mono = Mono.text.trim();
                      bdate = Bdate.text.trim();
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);

                      if(image == "images/add_photo.png" || name.isEmpty || email.isEmpty || mono.isEmpty || bdate.isEmpty || gender.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Please Fill All Fields',
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
                      else if(!emailValid){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Please Enter Proper Email',
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
                      else if(mono.length < 10){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.9,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Mobile Number Must be 10 Digit',
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

                        String link = "https://flutteranadh.000webhostapp.com/Hospital/profile.php";

                        DateTime dt = DateTime.now();
                        String imageName = "$name${dt.year}${dt.month}${dt.day}${dt.hour}${dt.minute}${dt.second}";

                        ID = Model.prefs!.getString('id') ?? "";

                        var formData = FormData.fromMap({
                          'id': ID,
                          'image': image,
                          'name': name,
                          'email': email,
                          'mono': mono,
                          'bdate': bdate,
                          'gender': gender,
                          'file': await MultipartFile.fromFile(
                              image, filename: imageName),
                        });
                        var response = await Dio().post(link, data: formData);

                        Navigator.pop(context);

                        if (response.statusCode == 200) {
                          print("Response : ${response.data}");

                          Map map = jsonDecode(response.data);

                          int result = map['result'];

                          print("Result :- $result");
                          if (result == 0) {
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
                          else if(result == 1)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                width: w * 0.9,
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'User Data Updated Successfully',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.bold)),
                                ),
                                backgroundColor: kGreen,
                                duration: Duration(seconds: 1),
                              ),
                            );

                            image.contains("u",0) ? image = "https://flutteranadh.000webhostapp.com/Hospital/$image" : image;

                            await Model.prefs!.setInt('signIN', 2);

                            await Model.prefs!.setString('id', ID!);
                            await Model.prefs!.setString('Image', image);
                            await Model.prefs!.setString('Name', name);
                            await Model.prefs!.setString('Email', email);
                            await Model.prefs!.setString('Mono', mono);
                            await Model.prefs!.setString('Bdate', bdate);
                            await Model.prefs!.setString('Gender', gender);

                            Navigator.pushReplacement(context, FadeRoute1(drawerScreen(2)));
                          }
                          else if(result == 2){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                width: w * 0.9,
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'Error in Image Uploading',
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
                      width: w * 0.34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kDarkBlue3,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: textWidget(msg: "Save", txtColor: kWhite, txtFontWeight: FontWeight.w600, txtFontSize: h * 0.02),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
