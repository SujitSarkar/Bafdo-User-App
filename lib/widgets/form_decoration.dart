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
