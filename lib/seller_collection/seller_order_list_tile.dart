
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

Widget sellerOrderListTile (BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'July 5,2021',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w500,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
        Card(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return recentDateListTile(context,index);
            },
          ),
        ),
      ],
    ),
  );
}

Widget recentDateListTile(BuildContext context,int index) {
  Size size = MediaQuery.of(context).size;

  String buttonText='Paid';
  return Column(
    children: [
      Container(
        width: size.width * .97,
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.width * .2,
                    width: size.width * .2,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/app_icon/body_icon/joy_stick.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '#BFD7387263763',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w600,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),
                    ),
                    Text(
                      'Order By: Saidul Khan',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w600,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/app_icon/body_icon/tk.png'),
                        Text(
                          '15.99',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.bold,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 5,
              child: Column(
                children: [

                  GradientButton(
                    onPressed: () {


                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => OTPPage()));
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                          color: ColorsVariables.splashSkip,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .035),
                    ),
                    borderRadius: 10,
                    height: size.width * .08,
                    width: size.width * .2,

                    gradientColors: [
                      buttonText=='Paid'? ColorsVariables.orderButtonColor
                          :ColorsVariables.pinkColor,
                      buttonText=='Paid'? ColorsVariables.orderButtonColor
                          :ColorsVariables.pinkColor,
                    ],
                  ),

                  Text('July 5, 12:01am',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .035),)
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        height: 1,
        width: size.width,
        color: Colors.grey,
      ),
    ],
  );
}