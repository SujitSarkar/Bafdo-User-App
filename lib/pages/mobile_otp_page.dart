import 'package:bafdo/colors.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/pages/register_page.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();

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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.width * .5),

                Text(
                  'OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w600,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .062),
                ),
                SizedBox(height: size.width * .03),

                Text(
                  'A message has been sent to your mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),
                ),
                SizedBox(height: size.width * .07),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: new BorderRadius.circular(6.97)),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: '0',
                          ),
                          controller: controller1,
                          autofocus: true,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: new BorderRadius.circular(6.97)),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          controller: controller2,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: '0',
                          ),
                          autofocus: true,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: new BorderRadius.circular(6.97)),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: '0',
                          ),
                          controller: controller3,
                          autofocus: true,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: new BorderRadius.circular(6.97)),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: '0',
                          ),
                          controller: controller4,
                          autofocus: true,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: new BorderRadius.circular(6.97)),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: '0',
                          ),
                          controller: controller5,
                          autofocus: true,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                            borderRadius: new BorderRadius.circular(6.97)),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            hintText: '0',
                          ),
                          controller: controller6,
                          autofocus: true,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.width * .05),

                ///Continue Button
                GradientButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text(
                    'Sign in',
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
                SizedBox(height: size.width * .09),

                InkWell(
                  onTap: () {},
                  child: Text(
                    'Resend ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: Colors.pink,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045),
                  ),
                ),

                SizedBox(height: size.width * .05),

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
                          fontSize: size.width * .045),
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
                            fontWeight: FontWeight.w500,
                            color: Colors.pink.shade600,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      splashColor: Colors.pink.shade100,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
