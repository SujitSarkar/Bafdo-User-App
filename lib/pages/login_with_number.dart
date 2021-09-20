import 'package:bafdo/colors.dart';
import 'package:bafdo/pages/login_page.dart';
import 'package:bafdo/pages/mobile_otp_page.dart';
import 'package:bafdo/pages/register_page.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginWithNumber extends StatefulWidget {
  const LoginWithNumber({Key? key}) : super(key: key);

  @override
  _LoginWithNumberState createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: _bodyUI(size),
    );
  }

  Widget _bodyUI(Size size) => SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),

              Text(
                'Great to see you again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w600,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .062),
              ),
              SizedBox(height: size.width * .03),

              Text(
                'Quick Sign in with mobile number \nor continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04),
              ),
              SizedBox(height: size.width * .07),

              ///Email Field
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Mobile',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.97))),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '+880',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.normal,
                            color: ColorsVariables.textColor,
                            fontSize: size.width * .04),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          // height: size.width * .2,
                          child: Center(
                            child: TextField(
                              controller: controller,
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: ColorsVariables.textColor,
                                  fontSize: size.width * .04),
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.normal,
                                    color: ColorsVariables.dividerColor,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.width * .09),

              GradientButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPPage()));
                },
                child: Text(
                  'Get OTP',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: ColorsVariables.splashSkip,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),
                ),
                borderRadius: 6.97,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              SizedBox(height: size.width * .05),
              Text(
                'or',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .045),
              ),

              SizedBox(height: size.width * .05),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInPage()));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.97)),
                      border: Border.all(
                        color: Colors.pink.shade600,
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .10,
                        vertical: size.width * .03),
                    child: Text(
                      'Sign in with email or username',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: Colors.pink.shade500,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * .05),

              ///Social Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/google.png'),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/facebook.png'),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/twitter.png'),
                ],
              ),
              SizedBox(height: size.width * .08),

              ///SignUp Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .04),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage())),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w600,
                          color: Colors.pink.shade500,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.pink.shade100,
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Looking for ios app? ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .037),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage())),
                      child: Text(
                        'Downlaod Free',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w600,
                            color: Colors.pink.shade500,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .037),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      splashColor: Colors.pink.shade100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  Widget _socialButtonBuilder(Size size, String assetImage) {
    return InkWell(
      onTap: () {},
      child: Image.asset(assetImage, height: size.width * .12),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      splashColor: Colors.pink.shade100,
    );
  }
}
