import 'package:flutter/material.dart';
import 'color_variable.dart';

class PublicVariables{
  static hintSmallTextStyle(Size size)=> TextStyle(
  fontSize: size.width*.038,
  color: BColors.greyColor,
  fontFamily: 'taviraj',
  //fontWeight: FontWeight.bold
  );
  static smallTextStyle(Size size)=> TextStyle(
    fontSize: size.width*.038,
    color: BColors.fontColor,
    fontFamily: 'taviraj',
    //fontWeight: FontWeight.bold
  );
  static primaryBtnTextStyle(Size size)=> TextStyle(
    fontSize: size.width*.044,
    color: Colors.white,
    fontFamily: 'taviraj',
    fontWeight: FontWeight.bold
  );
  static outlineBtnTextStyle(Size size)=> TextStyle(
    fontSize: size.width*.044,
    color: Colors.pink,
    fontFamily: 'taviraj',
    fontWeight: FontWeight.bold
  );
  static popupMenuTextStyle(Size size)=> TextStyle(
    fontSize: 12.0,
    color: Colors.grey.shade900,
    fontFamily: 'taviraj',
  );

}