import 'dart:async';
import 'package:bafdo/colors.dart';
import 'package:bafdo/pages/login_page.dart';
import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
    publicProvider.fetchCategories();
    publicProvider.fetchBrands();
    publicProvider.fetchFeaturedCategories();
    publicProvider.fetchTopBrands();
    publicProvider.fetchTraditionalCategories();
    publicProvider.fetchSliders();
    //  _navigateToLogInPage();
    startTimer();
  }

  Timer? _timer;
  int seconds = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (seconds < 1) {
            timer.cancel();
          } else {
            if (seconds >= 0) {
              setState(() {
                seconds = seconds - 1;
              });
            }

            if (seconds == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginWithNumber()));
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsVariables.backgrowndColor,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.width * 1.3,
                      child: Image.asset(
                        'assets/app_icon/body_icon/splash_background_image.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorsVariables.splashTime,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.57)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * .06,
                                vertical: size.width * .012,
                              ),
                              child: Text(
                                '$seconds sec',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginWithNumber()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .04),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.normal,
                                    color: ColorsVariables.textColor,
                                    fontSize: size.width * .04),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorsVariables.backgrowndColor,
                              textStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  //size :14
                                  fontSize: size.width * .04),
                              shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.57)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'A Summer Surprise',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.normal,
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .045),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * .015),
                            child: Text(
                              '15% Discount',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: ColorsVariables.textColor,
                                  fontSize: size.width * .07),
                            ),
                          ),
                          Text(
                            'Allounce Release',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.normal,
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .045),
                          ),
                          SizedBox(
                            height: size.width * .05,
                          ),
                          GradientButton(
                            onPressed: () {},
                            child: Text(
                              'Get It Now',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: size.width * .045),
                            ),
                            borderRadius: 6.97,
                            height: size.width * .13,
                            width: size.width * .33,
                            gradientColors: [
                              Colors.pink.shade600,
                              Colors.pink.shade400
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.width * .1,
            ),
            Container(
                height: size.width * .15,
                width: size.width * .5,
                child: Image.asset(
                  'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
                  fit: BoxFit.fill,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: 20,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //size == 14.91
                  child: Text(
                    'GO WITH BEST',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.normal,
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .041),
                  ),
                ),
                Container(
                  height: 2,
                  width: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: size.height * .04,
            ),
            Text(
              'Each Purchase Will Be Made With Pleasure',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.normal,
                  color: ColorsVariables.textColor,
                  fontSize: size.width * .042),
            ),
          ],
        ),
      ),
    );
  }
}
