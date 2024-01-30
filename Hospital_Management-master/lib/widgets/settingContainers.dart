import 'package:flutter/cupertino.dart';
import 'package:realestate/data/globals.dart';
import 'package:realestate/widgets/text.dart';

class settingsContainer extends StatelessWidget {
  settingsContainer({Key? key, required this.Aicon, required this.Aname}) : super(key: key);

  String Aicon;
  String Aname;

  var h , w;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.1,
      width: w * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kBlack,
            offset: Offset(2, 4),
            blurRadius: 20,
            spreadRadius: -17
          )
        ]
      ),
      child: Row(
        children: [
          SizedBox(width: w * 0.09,),
          Image.asset("$Aicon",width: w * 0.08,),
          SizedBox(width: w * 0.06,),
          textWidget(msg: "$Aname", txtColor: kDarkBlue3, txtFontWeight: FontWeight.w700, txtFontSize: h * 0.023)
        ],
      ),
    );
  }
}
