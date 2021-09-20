import 'package:bafdo/colors.dart';
import 'package:flutter/material.dart';

Widget getProductDemo(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Row(
    children: [
      Container(
        width: size.width * .25,
        height: size.width * .25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.5),
        ),
        padding: EdgeInsets.all(size.width * .04),
        child: Image.asset(
          'assets/app_icon/body_icon/joy_stick.png',
          fit: BoxFit.fill,
        ),
      ),
      Expanded(
          child: Container(
        padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Title: ',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .037),
                ),
                Text(
                  'Game accessories',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .037),
                ),
              ],
            ),
            SizedBox(
              height: size.width * .01,
            ),
            Row(
              children: [
                Text(
                  'Category: ',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.pinkCategoryTextColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .035),
                ),
                Text(
                  'Computer & Acce...',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.pinkCategoryTextColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .035),
                ),
              ],
            ),
            SizedBox(
              height: size.width * .01,
            ),
            Row(
              children: [
                Icon(Icons.star,
                    color: Color(0xffC31A65), size: size.width * .03),
                Icon(Icons.star,
                    color: Color(0xffC31A65), size: size.width * .03),
                Icon(Icons.star,
                    color: Color(0xffC31A65), size: size.width * .03),
                Icon(Icons.star,
                    color: Color(0xffC31A65), size: size.width * .03),
                Icon(Icons.star,
                    color: Color(0xffC31A65), size: size.width * .03)
              ],
            ),
            SizedBox(
              height: size.width * .01,
            ),
            Row(
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .038),
                ),
                Text(
                  '20',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .038),
                ),
              ],
            ),
          ],
        ),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      )
    ],
  );
}
