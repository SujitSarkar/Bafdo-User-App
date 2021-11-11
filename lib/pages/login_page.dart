import 'dart:ui';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/pages/register_page.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _obscure = true;
  bool _checked = true;
  TextEditingController _email=TextEditingController(text: '');
  TextEditingController _password=TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: _bodyUI(size,authProvider,publicProvider),
    );
  }

  Widget _bodyUI(Size size, AuthProvider authProvider, PublicProvider publicProvider) => SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width * .2),

              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w600,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .052),
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
                  'Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),

              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: formDecoration(size).copyWith(
                  hintText: 'example@gmail.com',
                  hintStyle: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.dividerColor,
                      fontSize: size.width * .04),
                ),
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04),
              ),

              SizedBox(height: size.width * .04),

              ///Password Field
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.normal,
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),
              TextFormField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscure,
                decoration: formDecoration(size).copyWith(
                  hintText:
                      '\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 8',
                  hintStyle: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: ColorsVariables.dividerColor,
                      fontSize: size.width * .04),
                  suffix: InkWell(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Image.asset(
                          _obscure
                              ? 'assets/app_icon/text_field_icon/eye_hide.png'
                              : 'assets/app_icon/text_field_icon/eye.png',
                          height: 18)),
                ),
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.normal,
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04),
              ),
              SizedBox(height: size.width * .04),

              ///CheckBox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Forgot password
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.normal,
                          color: ColorsVariables.textColor,
                          fontSize: size.width * .035),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.pink.shade100,
                  ),

                  //Remember me
                  InkWell(
                    onTap: () => setState(() => _checked = !_checked),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            _checked
                                ? 'assets/app_icon/body_icon/checked.png'
                                : 'assets/app_icon/body_icon/unchecked.png',
                            height: 30),
                        Text(
                          ' Remember me',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.normal,
                              color: ColorsVariables.textColor,
                              fontSize: size.width * .035),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    splashColor: Colors.pink.shade100,
                  ),
                ],
              ),
              SizedBox(height: size.width * .05),

              ///Login Button
              GradientButton(
                onPressed: ()=>_validateDataAndLogin(authProvider,publicProvider),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: size.width * .045),
                ),
                borderRadius: 6.97,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              SizedBox(height: size.width * .05),

              ///Phone SIgnin button
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginWithNumber()));
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
                    child: Center(
                      child: Text(
                        'Sign in with Mobile Number',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade600,
                            fontSize: size.width * .04),
                      ),
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
                      size, 'assets/app_icon/body_icon/google.png',authProvider,publicProvider),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/facebook.png',authProvider,publicProvider),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/twitter.png',authProvider,publicProvider),
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
                        color: ColorsVariables.dividerColor,
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
                          fontWeight: FontWeight.w600,
                          color: Colors.pink.shade500,
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
      );

  Widget _socialButtonBuilder(Size size, String assetImage, AuthProvider authProvider,PublicProvider publicProvider) {
    return InkWell(
      onTap: () async{
        if(assetImage=='assets/app_icon/body_icon/google.png'){
          await authProvider.loginWithGoogle(context).then((cred)async{
            if(cred!.user!.email!=null){
              print(cred.user!.email);
              _socialLogin(cred, authProvider,publicProvider);
            }else showToast('Access denied !');
          });
        }
        else if(assetImage=='assets/app_icon/body_icon/facebook.png'){
          await authProvider.signInWithFacebook(context).then((cred)async{
            if(cred!.user!.email!=null){
              print(cred.user!.email);
              print(cred.user!.phoneNumber);
              _socialLogin(cred, authProvider,publicProvider);
            }else showToast('Access denied !');
          });
        }
      },
      child: Image.asset(assetImage, height: size.width * .12),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      splashColor: Colors.pink.shade100,
    );
  }

  Future<void> _validateDataAndLogin(AuthProvider authProvider,PublicProvider publicProvider)async{
      if(_email.text.isNotEmpty && _password.text.isNotEmpty){
        if(!_email.text.contains('@') && !_email.text.contains('.com')){
          if(_password.text.length>=8){
            Map<String,String> userMap={
              'email': _email.text,
              'password': _password.text
            };
            showLoadingDialog(context);
            await authProvider.loginAndGetUserInfo(userMap).then((value)async{
              if(value){
                if(_checked){
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString('email_or_phone', authProvider.userInfoModel.user.phone);
                  preferences.setString('id', authProvider.userInfoModel.user.id.toString());
                  preferences.setString('name', authProvider.userInfoModel.user.name);
                  preferences.setString('access_token', authProvider.userInfoModel.accessToken);
                  await authProvider.getPrefUser();
                }
                closeLoadingDialog(context);
                showToast(authProvider.userInfoModel.message);

                authProvider.getPrefUser();
                publicProvider.fetchFeaturedCategories();
                publicProvider.fetchTraditionalCategories();
                publicProvider.fetchHandPickProducts();
                publicProvider.fetchFlashDealProducts();
                publicProvider.fetchDailyFeaturedProducts();

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);
              }else{
                closeLoadingDialog(context);
                //showToast('Something went wrong! try again');
              }
            });
          }else showToast('Password must 8 character');
        }else showToast('Invalid email');
      }else showToast('Missing user information');
  }

  Future<void> _socialLogin(UserCredential? credential, AuthProvider authProvider,PublicProvider publicProvider)async{
    Map<String,String> userMap;
    if(credential!.user!.email!=null){
      userMap={
        'email_or_phone': credential.user!.email!
      };
    }else{
      userMap={
        'email_or_phone': credential.user!.phoneNumber!
      };
    }
    await authProvider.socialLoginAndGetUserInfo(userMap).then((value) async{
      if(value){
        if(_checked){
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('email_or_phone', authProvider.userInfoModel.user.phone);
          preferences.setString('id', authProvider.userInfoModel.user.id.toString());
          preferences.setString('name', authProvider.userInfoModel.user.name);
          preferences.setString('access_token', authProvider.userInfoModel.accessToken);
          await authProvider.getPrefUser();
        }
        closeLoadingDialog(context);
        showToast(authProvider.userInfoModel.message);
        authProvider.getPrefUser();
        publicProvider.fetchFeaturedCategories();
        publicProvider.fetchTraditionalCategories();
        publicProvider.fetchHandPickProducts();
        publicProvider.fetchFlashDealProducts();
        publicProvider.fetchDailyFeaturedProducts();

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);
      }else showToast('Something went wrong! try again');
    });
  }


}
