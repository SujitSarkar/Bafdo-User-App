import 'package:bafdo/pages/mobile_otp_page.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/pages/login_page.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscure = true;
  bool _checked = true;
  TextEditingController _name= TextEditingController(text: '');
  TextEditingController _emailOrPhone= TextEditingController(text: '');
  TextEditingController _password= TextEditingController(text: '');
  String _buttonMgs='Sign Up';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsVariables.backgrowndColor,
        elevation: 0,
        leading: InkWell(
            onTap: ()=> Navigator.pop(context),
            child: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
        actions: [
          InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(
                'assets/app_icon/app_bar_icon/close.png',
              ))
        ],
      ),
      backgroundColor: ColorsVariables.backgrowndColor,
      body: _bodyUI(size,authProvider, publicProvider),
    );
  }

  Widget _bodyUI(Size size,AuthProvider authProvider,PublicProvider publicProvider) => SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width * .05),

              Text(
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w600,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .06),
              ),
              SizedBox(height: size.width * .03),

              Text(
                'Complete Your Details Or \nContinue with Social Media',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .04),
              ),
              SizedBox(height: size.width * .07),

              _textFieldBuilder(size, 'Full Name', 'Your Full name',
                  suffixImage: ''),
              SizedBox(height: size.width * .04),
              _textFieldBuilder(size, 'Email or Phone', 'saidur@gmail.com or 01795302389',
                  suffixImage: 'assets/app_icon/body_icon/message.png'),
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
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04),
                ),
              ),
              SizedBox(height: size.width * .02),
              TextFormField(
                controller: _password,
                obscureText: _obscure,
                keyboardType: TextInputType.visiblePassword,
                decoration: formDecoration(size).copyWith(
                  hintText:
                      '\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 8',
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
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04),
              ),

              SizedBox(height: size.width * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => setState(() => _checked = !_checked),
                    child: Image.asset(
                        _checked
                            ? 'assets/app_icon/body_icon/checked.png'
                            : 'assets/app_icon/body_icon/unchecked.png',
                        height: 30),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * .02, top: size.width * .01),
                        child: Container(
                          width: size.width * .7,
                          child: Text(
                            'By Continuing Your Confirm That You Agree With',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * .02,
                          ),
                          child: Text(
                            'Our Term & Condition',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.pinkColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.width * .08),

              ///Signup Button
              GradientButton(
                onPressed: ()=>_validateDataAndSignup(authProvider, publicProvider),
                child: Text(
                  _buttonMgs,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),
                ),
                borderRadius: 15.0,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              SizedBox(height: size.width * .08),

              ///Social Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/facebook.png',authProvider,publicProvider),
                  SizedBox(width: size.width * .02),
                  _socialButtonBuilder(
                      size, 'assets/app_icon/body_icon/google.png',authProvider,publicProvider),
                  SizedBox(width: size.width * .02),
                  // _socialButtonBuilder(
                  //     size, 'assets/app_icon/body_icon/twitter.png'),
                ],
              ),
              SizedBox(height: size.width * .08),

              ///Last Message
              ///SignUp Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInPage())),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w700,
                          color: ColorsVariables.pinkColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ],
              ),

              SizedBox(height: size.width * .1),
            ],
          ),
        ),
      );

  Widget _textFieldBuilder(Size size, String title, String hint,
          {String? suffixImage}) =>
      Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04),
            ),
          ),
          SizedBox(height: size.width * .02),
          TextFormField(
            controller: title=='Full Name'
                ?_name
                :_emailOrPhone,
            onChanged: (val){
              if(title=='Email or Phone'){
                if(_emailOrPhone.text.contains('@') || _emailOrPhone.text.contains('.com')){
                  setState(() {
                    _buttonMgs='Sign Up';
                  });
                }else{
                  setState(() {
                    _buttonMgs='Get OTP';
                  });
                }
              }
            },
            keyboardType: title=='Full Name'
                ?TextInputType.text
                :TextInputType.emailAddress,
            decoration: formDecoration(size).copyWith(
              hintText: hint,
              // suffix: suffixImage != ''
              //     ? Image.asset(suffixImage!, height: 18)
              //     : null,
            ),
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .04),
          ),
        ],
      );

  Widget _socialButtonBuilder(Size size, String assetImage,AuthProvider authProvider,PublicProvider publicProvider) {
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
    );
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

  Future<void> _validateDataAndSignup(AuthProvider authProvider,PublicProvider publicProvider)async{
    if(_checked){
      if(_name.text.isNotEmpty && _emailOrPhone.text.isNotEmpty && _password.text.isNotEmpty){
        if(_emailOrPhone.text.contains('@') && _emailOrPhone.text.contains('.com')){
          if(_password.text.length>=8){
            Map<String,String> userMap={
              'name': _name.text,
              'email_or_phone': _emailOrPhone.text,
              'password': _password.text
            };
            _loginUser(authProvider, publicProvider, userMap);
          }else showToast('Password must 8 character');
        }else{
          if(_emailOrPhone.text.length==11){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>OTPPage(
                phoneNumber: _emailOrPhone.text,
                password: _password.text,
                fullName: _name.text)));
          }else showToast('Invalid phone number');
        }
      }else showToast('Missing user information');
    }else showToast('Select Terms & Condition');
  }

  Future<void> _loginUser(AuthProvider authProvider,PublicProvider publicProvider, Map<String,String> userMap)async{
    showLoadingDialog(context);
    await authProvider.userSignup(userMap).then((value)async{
      if(value){
        showToast(authProvider.signupModel.message);
        Map<String,String> map={
          'email': _emailOrPhone.text,
          'password': _password.text
        };
        await authProvider.loginAndGetUserInfo(map).then((value)async{
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('email_or_phone', authProvider.userInfoModel.user.phone);
          preferences.setString('id', authProvider.userInfoModel.user.id.toString());
          preferences.setString('name', authProvider.userInfoModel.user.name);
          preferences.setString('access_token', authProvider.userInfoModel.accessToken);
          await authProvider.getPrefUser();
          closeLoadingDialog(context);
          showToast(authProvider.userInfoModel.message);

          authProvider.getPrefUser();
          publicProvider.fetchFeaturedCategories();
          publicProvider.fetchTraditionalCategories();
          publicProvider.fetchHandPickProducts();
          publicProvider.fetchFlashDealProducts();
          publicProvider.fetchDailyFeaturedProducts();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);
        });
      }else{
        closeLoadingDialog(context);
        showToast(authProvider.signupModel.message);
      }
    });
  }
}
