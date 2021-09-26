import 'package:bafdo/colors.dart';
import 'package:bafdo/pages/login_page.dart';
import 'package:bafdo/pages/mobile_otp_page.dart';
import 'package:bafdo/pages/register_page.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class LoginWithNumber extends StatefulWidget {
  const LoginWithNumber({Key? key}) : super(key: key);

  @override
  _LoginWithNumberState createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  final TextEditingController controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: _bodyUI(size, authProvider),
    );
  }

  Widget _bodyUI(Size size, AuthProvider authProvider) => SingleChildScrollView(
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
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.width * .09),

              GradientButton(
                onPressed: () {
                  if(controller.text.isNotEmpty){
                    if(controller.text.length==10){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPPage(phoneNumber: '0${controller.text}')));
                    }else showToast('Invalid phone number');
                  }else showToast('Phone number required');

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
                      size, 'assets/app_icon/body_icon/google.png', authProvider),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/facebook.png',authProvider),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/twitter.png',authProvider),
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

  Widget _socialButtonBuilder(Size size, String assetImage, AuthProvider authProvider) {
    return InkWell(
      onTap: () async{
        if(assetImage=='assets/app_icon/body_icon/google.png'){
          await authProvider.loginWithGoogle(context).then((cred)async{
            if(cred!=null){
              print(cred.user!.email);
              _socialLogin(cred, authProvider);
            }else showToast('Error getting user');
          });
        }
        else if(assetImage=='assets/app_icon/body_icon/facebook.png'){
          await authProvider.signInWithFacebook(context).then((cred)async{
            if(cred!=null){
              print(cred.user!.email);
              _socialLogin(cred, authProvider);
            }else showToast('Error getting user');
          });
        }
      },
      child: Image.asset(assetImage, height: size.width * .12),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      splashColor: Colors.pink.shade100,
    );
  }

  Future<void> _socialLogin(UserCredential? credential, AuthProvider authProvider)async{
    Map<String,String> userMap={
      'email_or_phone': credential!.user!.email!
    };
    await authProvider.socialLoginAndGetUserInfo(userMap).then((value) async{
      if(value){
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('email_or_phone', authProvider.userInfoModel.user.phone);
          preferences.setString('id', authProvider.userInfoModel.user.id.toString());
          preferences.setString('name', authProvider.userInfoModel.user.name);
          preferences.setString('access_token', authProvider.userInfoModel.accessToken);
        closeLoadingDialog(context);
        showToast(authProvider.userInfoModel.message);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);
      }else showToast('Something went wrong! try again');
    });
  }


}
