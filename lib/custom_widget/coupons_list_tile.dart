import 'package:bafdo/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CouponsListTile extends StatefulWidget {
  @override
  _CouponsListTileState createState() => _CouponsListTileState();
}

class _CouponsListTileState extends State<CouponsListTile> {
  double _animatedHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() {
            _animatedHeight = 80.0;
          }),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'For Women’s Clothing',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * .05),
                  ),
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: size.width * .2,
                            width: size.width * .2,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.amber,
                            ),
                            child: Image.asset(
                              'assets/app_icon/body_icon/coupon_icon.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '20%  OFF',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .05),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Order over',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.dividerColor,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * .05),
                                    ),
                                    SizedBox(
                                      width: size.width * .04,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                            'assets/app_icon/body_icon/tk.png'),
                                        Text(
                                          '500.00',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * .05),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: size.width * .06,
                          // ),
                        ],
                      ),
                      Positioned(
                        right: size.width * .02,
                        bottom: size.width * .08,
                        child: GradientButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Get',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.bold,
                                color: ColorsVariables.splashSkip,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),
                          ),
                          borderRadius: 6.97,
                          height: size.width * .08,
                          width: size.width * .2,
                          gradientColors: [
                            Colors.pink.shade600,
                            Colors.pink.shade400
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: new AnimatedContainer(
            height: _animatedHeight,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            duration: const Duration(milliseconds: 120),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: size.width * .9,
                      lineThickness: 2.0,
                      dashLength: 4.0,
                      dashColor: ColorsVariables.dividerColor,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: new Text(
                                "Valid: 07/09/2021",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.bold,
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                            Row(
                              children: [
                                new Text(
                                  "Coupon ID: 123456789",
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      fontWeight: FontWeight.bold,
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .04),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Icon(
                                    Icons.copy,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  _animatedHeight = 0.0;
                                });
                              },
                              child: Image.asset(
                                  'assets/app_icon/body_icon/up_icon.png')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
