import 'package:flutter/material.dart';

InputDecoration formDecoration(Size size) => InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: '',
      enabled: true,
      hintStyle: TextStyle(
        fontSize: size.width * .04,
        color: Colors.grey,
        fontFamily: 'mulish',
        //fontWeight: FontWeight.bold
      ),
      border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.57)),
          borderSide: BorderSide.none),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.57)),
          borderSide: BorderSide.none),
      disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.57)),
          borderSide: BorderSide.none),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.57)),
          borderSide: BorderSide.none),
      errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.57)),
          borderSide: BorderSide.none),
    );

InputDecoration myBafdoFormDecoration(Size size) => InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3.0),
    isDense: true,
    border: new OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: new BorderSide(color: Colors.grey)),
    hintText: 'Name',
    hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: size.width * .05,
        fontFamily: 'taviraj',
        fontWeight: FontWeight.w500));

InputDecoration searchFormDecoration(Size size) =>InputDecoration(
    hintText: 'Search product',
    hintStyle: TextStyle(
        fontFamily: 'taviraj',
        fontWeight: FontWeight.w500,
        color: Colors.grey,
        fontStyle: FontStyle.normal,
        fontSize: size.width * .04),
    suffixIcon: Image.asset(
      'assets/app_icon/text_field_icon/search_icon.png'),
    fillColor: Colors.white,
    filled: true,
    enabled: false,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    focusedBorder: InputBorder.none);
