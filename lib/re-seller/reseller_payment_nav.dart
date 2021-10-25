import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/coupons_list_tile.dart';
import 'package:bafdo/re-seller/seller_total_sale_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentNav extends StatefulWidget {
  @override
  _PaymentNavState createState() => _PaymentNavState();
}

class _PaymentNavState extends State<PaymentNav> {
  double _animatedHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Color(0xffEFF9F9),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width * .9,
                height: size.width * .3,
                decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Total Income',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/app_icon/body_icon/tk.png'),
                          Text(
                            '200',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .05),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>TotalSellsDetailsPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: ColorsVariables.pinkColor),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 10,top: 5,bottom: 5),
                            child: Text(
                              'So far sold in stores',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Next Payout Due",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Sun,Sep 13,Sun,Sep 19",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Final Payout will vary based on Order Status",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _animatedHeight == 0
                                      ? _animatedHeight = size.width*.65
                                      : _animatedHeight = 0;
                                });
                              },
                              child: Row(children: [
                                Image.asset('assets/app_icon/body_icon/tk.png'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                ),
                                Image.asset(
                                    'assets/app_icon/body_icon/next_icon_grey.png'),
                              ]),
                            )),
                      ],
                    ),
                    AnimatedContainer(
                      height: _animatedHeight,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      duration: const Duration(milliseconds: 120),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 5),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(
                                height: 2,
                                color: Colors.pink,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "Delivered Orders",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "Lost Orders",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "RTOs",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "Cancelled Orders",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "Returned Order",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "Bonus",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    child: new Text(
                                      "Adjustment",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .03),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/tk.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .03),
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/next_icon_grey.png'),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
