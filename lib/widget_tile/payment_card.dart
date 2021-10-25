import 'package:bafdo/variables/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget paymentCard (BuildContext context ,String title,double amount){
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.width * .4,
    width: size.width * .4,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
        style: TextStyle(
        fontFamily: 'taviraj',
        fontWeight: FontWeight.w500,
        color: ColorsVariables.textColor,
    fontStyle: FontStyle.normal,
    fontSize: size.width * .05),),

        Text(amount.toString(),
          style: TextStyle(
              fontFamily: 'taviraj',
              fontWeight: FontWeight.w500,
              color: ColorsVariables.amountTextColor,
              fontStyle: FontStyle.normal,
              fontSize: size.width * .045),),


      ],
    ),

  );
}