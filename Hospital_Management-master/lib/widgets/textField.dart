import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/data/globals.dart';

class textField extends StatefulWidget {
  textField({Key? key, required this.txtController , required this.keyboardType , required this.HintText , required this.Label , required this.icon, required this.ErrorText}) : super(key: key);

  TextEditingController txtController;
  TextInputType keyboardType;
  String HintText;
  String Label;
  String ErrorText;
  IconData icon;


  @override
  State<textField> createState() => _textFieldState();
}

class _textFieldState extends State<textField> {

  var h ,w ;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: widget.txtController,
        keyboardType: widget.keyboardType,
        style: GoogleFonts.notoSans(textStyle: TextStyle(color: kBlack , fontSize: h * 0.018, fontWeight: FontWeight.w500,)),
        cursorColor: kDarkBlue,
        onChanged: (value) {

        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: kDarkBlue,width: 1)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: kDarkBlue,width: 2)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: kError,width: 2)
          ),
          hintText: widget.HintText,
          hintStyle: GoogleFonts.notoSans(textStyle: TextStyle(color: kGrey , fontSize: h * 0.018, fontWeight: FontWeight.w500,)),
          label: Text(widget.Label),
          prefix: Icon(widget.icon, color: kBlack,),
          errorText: widget.ErrorText,
          errorStyle: GoogleFonts.notoSans(textStyle: TextStyle(color: kError , fontWeight: FontWeight.w500,)),

        ),
      ),
    );
  }
}
