import 'dart:async';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/solid_color_button.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/pages/login_page.dart';
import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // SharedPreferences? preferences;
  // String? _emailOrPhone;
  @override
  void initState() {
    super.initState();
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
    publicProvider.getPrefUser();
    publicProvider.fetchCategories();
    publicProvider.fetchBrands();
    publicProvider.fetchFeaturedCategories();
    publicProvider.fetchTopBrands();
    publicProvider.fetchTraditionalCategories();
    publicProvider.fetchSliders();
    publicProvider.fetchHandPickProducts();
    publicProvider.fetchFlashDealProducts();
    publicProvider.fetchDailyFeaturedProducts();
    startTimer(publicProvider);
  }

  Timer? _timer;
  int seconds = 5;

  void startTimer(PublicProvider publicProvider) async{
    await publicProvider.getPrefUser();
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
              _timer!.cancel();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => publicProvider.prefUserModel!.emailOrPhone!=null?Home(): LoginWithNumber()), (route) => false);
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsVariables.backgrowndColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ///Clip Image
                      ClipPath(
                        clipper: OvalBottomBorderClipper(),
                        child: Container(
                          width: size.width,
                          //height: size.height * 6,
                          child: Image.asset(
                            'assets/app_icon/body_icon/splash_background_image.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      ///Top Button
                      Positioned(
                        top: size.width*.001,
                        left: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding: EdgeInsets.all(size.width * .05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsVariables.splashTime,
                                  borderRadius: BorderRadius.all(Radius.circular(size.width*.02)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .058,
                                    vertical: size.width * .007,
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
                              SolidColorButton(
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.normal,
                                        color: ColorsVariables.textColor,
                                        fontSize: size.width * .04),
                                  ),
                                  onPressed: (){
                                    _timer!.cancel();
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>publicProvider.prefUserModel!.emailOrPhone!=null?Home(): LoginWithNumber()), (route) => false);
                                  },
                                  borderRadius: size.width*.02,
                                  height: size.width*.08,
                                  width: size.width*.21,
                                  bgColor: Color(0xffE5E1FF)),
                            ],
                          ),
                        ),
                      ),

                      ///Discount Section
                      Column(
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
                                  fontWeight: FontWeight.bold,
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
                          SizedBox(height: size.width * .05),
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
                              BColors.primaryPink,
                              BColors.primaryLitePink
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width * .09),

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
              SizedBox(height: size.height * .03),
              Text(
                'Each Purchase Will Be Made With Pleasure',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .042),
              ),
              SizedBox(height: size.height * .05),
            ],
          ),
        ),
      ),
    );
  }
}
