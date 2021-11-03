import 'dart:async';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/pages/register_page.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPPage extends StatefulWidget {
  String phoneNumber;
  OTPPage({required this.phoneNumber});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();
  TextEditingController c4 = new TextEditingController();
  TextEditingController c5 = new TextEditingController();
  TextEditingController c6 = new TextEditingController();
  FocusNode _f1 = FocusNode();
  FocusNode _f2 = FocusNode();
  FocusNode _f3 = FocusNode();
  FocusNode _f4 = FocusNode();
  FocusNode _f5 = FocusNode();
  FocusNode _f6 = FocusNode();
  AuthProvider? authProvider;
  PublicProvider? publicProvider;
  bool _isLoading = true;
  String? _verificationId;
  Timer? _timer;
  int seconds = 120;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      authProvider = Provider.of<AuthProvider>(context, listen: false);
      publicProvider = Provider.of<PublicProvider>(context, listen: false);
    });
    _f1.requestFocus();
    _phoneAuth();
  }

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
              setState(() => seconds = seconds - 1);
            }
            if (seconds == 0) {
              _timer!.cancel();
            }
          }
        },
      ),
    );
  }

  Future<void> _phoneAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+88${widget.phoneNumber}',

      ///Auto Verification
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Map<String, String> userMap = {
              'email_or_phone': widget.phoneNumber
            };
            authProvider!
                .socialLoginAndGetUserInfo(userMap)
                .then((value) async {
              if (value) {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setString(
                    'email_or_phone', authProvider!.userInfoModel.user.phone);
                preferences.setString(
                    'id', authProvider!.userInfoModel.user.id.toString());
                preferences.setString(
                    'name', authProvider!.userInfoModel.user.name);
                preferences.setString(
                    'access_token', authProvider!.userInfoModel.accessToken);
                await authProvider!.getPrefUser();
                setState(() => _isLoading = false);
                _timer!.cancel();

                authProvider!.getPrefUser();
                publicProvider!.fetchFeaturedCategories();
                publicProvider!.fetchTraditionalCategories();
                publicProvider!.fetchHandPickProducts();
                publicProvider!.fetchFlashDealProducts();
                publicProvider!.fetchDailyFeaturedProducts();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (route) => false);
              } else
                showToast('Something went wrong! try again');
            });
          } else {
            setState(() => _isLoading = false);
            showToast('Verification Failed! Try again');
          }
        });
      },

      ///Verification Failed
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          setState(() => _isLoading = false);
          showToast('The provided phone number is not valid');
        }
      },

      ///Verify with  OTP
      codeSent: (String verificationId, int? resendToken) async {
        setState(() => _isLoading = false);
        _verificationId = verificationId;
        startTimer();
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        showToast('OTP resend');
        _verificationId = verificationId;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: _isLoading ? showLoadingWidget : _bodyUI(size,publicProvider),
    );
  }

  Widget _bodyUI(Size size,PublicProvider publicProvider) => SingleChildScrollView(
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

                ///OTP Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _otpField(1, size),
                    SizedBox(width: size.width * .03),
                    _otpField(2, size),
                    SizedBox(width: size.width * .03),
                    _otpField(3, size),
                    SizedBox(width: size.width * .03),
                    _otpField(4, size),
                    SizedBox(width: size.width * .03),
                    _otpField(5, size),
                    SizedBox(width: size.width * .03),
                    _otpField(6, size),
                  ],
                ),
                SizedBox(height: size.width * .1),

                ///Continue Button
                GradientButton(
                  onPressed: () {
                    _otpVerificationAndSignIn(publicProvider);
                  },
                  child: Text('Sign in',
                      style: PublicVariables.primaryBtnTextStyle(size)),
                  borderRadius: 6.97,
                  height: size.width * .13,
                  width: size.width,
                  gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
                ),
                SizedBox(height: size.width * .09),

                Text(
                  'OTP will resend after $seconds sec',
                  textAlign: TextAlign.left,
                  style: PublicVariables.smallTextStyle(size),
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

  Future<void> _otpVerificationAndSignIn(PublicProvider publicProvider) async {
    showLoadingDialog(context);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode:
            '${c1.text}${c2.text}${c3.text}${c4.text}${c5.text}${c6.text}');
    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        Map<String, String> userMap = {'email_or_phone': widget.phoneNumber};
        authProvider!.socialLoginAndGetUserInfo(userMap).then((value) async {
          if (value) {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString(
                'email_or_phone', authProvider!.userInfoModel.user.phone);
            preferences.setString(
                'id', authProvider!.userInfoModel.user.id.toString());
            preferences.setString(
                'name', authProvider!.userInfoModel.user.name);
            preferences.setString(
                'access_token', authProvider!.userInfoModel.accessToken);
            await authProvider!.getPrefUser();
            setState(() => _isLoading = false);
            _timer!.cancel();
            authProvider!.getPrefUser();
            publicProvider.fetchFeaturedCategories();
            publicProvider.fetchTraditionalCategories();
            publicProvider.fetchHandPickProducts();
            publicProvider.fetchFlashDealProducts();
            publicProvider.fetchDailyFeaturedProducts();

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                (route) => false);
          } else
            showToast('Something went wrong! try again');
        });
      } else {
        closeLoadingDialog(context);
        showToast('Invalid OTP');
      }
    });
  }

  Widget _otpField(int hint, Size size) => Expanded(
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: myBafdoFormDecoration(size).copyWith(hintText: '$hint'),
          controller: hint == 1
              ? c1
              : hint == 2
                  ? c2
                  : hint == 3
                      ? c3
                      : hint == 4
                          ? c4
                          : hint == 5
                              ? c5
                              : c6,
          focusNode: hint == 1
              ? _f1
              : hint == 2
                  ? _f2
                  : hint == 3
                      ? _f3
                      : hint == 4
                          ? _f4
                          : hint == 5
                              ? _f5
                              : _f6,
          onChanged: (val) {
            if (hint == 1) {
              _f1.unfocus();
              _f2.requestFocus();
            } else if (hint == 2) {
              _f2.unfocus();
              _f3.requestFocus();
            } else if (hint == 3) {
              _f3.unfocus();
              _f4.requestFocus();
            } else if (hint == 4) {
              _f4.unfocus();
              _f5.requestFocus();
            } else if (hint == 5) {
              _f5.unfocus();
              _f6.requestFocus();
            } else if (hint == 6) {
              _f6.unfocus();
            }
          },
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: PublicVariables.otpTextStyle(size),
        ),
      );
}
