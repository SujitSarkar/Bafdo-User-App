import 'dart:ui';

import 'package:bafdo/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

Widget getReviewTemplate(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    color: Color(0xffF1F9F9),
    padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .045,
        size.width * .045, size.width * .045),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews (109)',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width * .04,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: size.width * .03),
        Row(
          children: [
            Container(
              width: size.width * .08,
              height: size.width * .08,
              child: CircleAvatar(
                  backgroundImage: AssetImage(
                'assets/app_icon/body_icon/boys.png',
              )),
            ),
            SizedBox(
              width: size.width * .02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edward willson',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * .03,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '20 June, 2021',
                  style: TextStyle(
                    color: Color(0xff85848A),
                    fontSize: size.width * .02,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * .3,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffF6DBE5)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.width * .3),
                          side: BorderSide(
                            color: Color(0xffF6DBE5),
                          )))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/app_icon/body_icon/thumb_up.png',
                  ),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Text(
                    'Helpful (6)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * .025,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/app_icon/body_icon/star.png',
              scale: .7,
            ),
            Image.asset('assets/app_icon/body_icon/star.png', scale: .7),
            Image.asset('assets/app_icon/body_icon/star.png', scale: .7),
            Image.asset('assets/app_icon/body_icon/star.png', scale: .7),
            Image.asset('assets/app_icon/body_icon/star.png', scale: .7),
            Text(
              '  (101)',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * .03),
            ),
          ],
        ),
        Text(
            'This is a very good gamepad for those who look for cheap and smooth gameplay.the analog buttons feel '),
        Container(
          height: size.width * .3,
          width: size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                    height: size.width * .15,
                    width: size.width * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/app_icon/body_icon/joy_stick.png',
                        fit: BoxFit.fill,
                      ),
                    ));
              }),
        ),
        Center(
          child: GradientButton(
            onPressed: () {},
            child: Text(
              'See more',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.bold,
                  color: ColorsVariables.splashSkip,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),
            ),
            borderRadius: 6.97,
            height: size.width * .13,
            width: size.width * .3,
            gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
          ),
        ),
      ],
    ),
  );
}
