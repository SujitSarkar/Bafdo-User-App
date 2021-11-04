import 'dart:io';
import 'package:bafdo/model/pref_user_model.dart';
import 'package:bafdo/model/signup_model.dart';
import 'package:bafdo/model/userinfo_model.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthProvider extends ChangeNotifier {
  SignupModel? _signupModel;
  UserInfoModel? _userInfoModel;
  PrefUserModel? _prefUserModel;
  bool? _isPrefNull;

  get signupModel => _signupModel;
  get userInfoModel => _userInfoModel;
  get prefUserModel =>_prefUserModel;
  get isPrefNull =>_isPrefNull;

  Future<void> getPrefUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString('id')!=null){
      _isPrefNull = false;
      PrefUserModel model = PrefUserModel(
          id: preferences.getString('id'),
          accessToken: preferences.getString('access_token'),
          name: preferences.getString('name'),
          emailOrPhone: preferences.getString('email_or_phone'));
      _prefUserModel = model;
      notifyListeners();
    }else{
      _isPrefNull = true;
      showToast('Session Expired! Login Again');
      notifyListeners();
    }
    print('isPrefNull: $_isPrefNull');
    print('PrefUserId: ${_prefUserModel!.id}');
    print('Token: ${_prefUserModel!.accessToken}');
  }
  void clearPrefModel(){
    _prefUserModel=null;
    _isPrefNull = true;
    notifyListeners();
  }

  Future<bool> userSignup(Map<String, String> map) async {
    try {
      http.Response response = await http
          .post(Uri.parse('https://bafdo.com/api/v2/auth/signup'), body: map);
      if (response.statusCode == 201) {
        _signupModel = signupModelFromJson(response.body);
        notifyListeners();
        if (_signupModel!.result == true) {
          return Future.value(true);
        } else return Future.value(false);
      }else return Future.value(false);

    } on SocketException {
      showToast('No internet connection !');
      return Future.value(false);
    } catch (error) {
      showToast(error.toString());
      return Future.value(false);
    }
  }

  Future<bool> loginAndGetUserInfo(Map<String, String> map) async {
    try {
      http.Response response = await http
          .post(Uri.parse('https://bafdo.com/api/v2/auth/login'), body: map);

      if (response.statusCode == 200) {
          _userInfoModel = userInfoModelFromJson(response.body);
          notifyListeners();
          if (_userInfoModel!.result == true) {
            return Future.value(true);
          } else {
            showToast(_userInfoModel!.message);
            return Future.value(false);
          }
      } else if(response.statusCode == 401){
        showToast('Not registered yet');
        return Future.value(false);
      }
      else return Future.value(false);
    } on SocketException {
      showToast('No internet connection !');
      return Future.value(false);
    } catch (error) {
      showToast(error.toString());
      return Future.value(false);
    }
  }

  Future<bool> socialLoginAndGetUserInfo(Map<String, String> map) async {
    try {
      http.Response response = await http
          .post(Uri.parse('https://bafdo.com/api/v2/auth/social-login'), body: map);

      if (response.statusCode == 200) {
        _userInfoModel = userInfoModelFromJson(response.body);
        notifyListeners();
        if (_userInfoModel!.result == true) {
          return Future.value(true);
        } else {
          showToast(_userInfoModel!.message);
          return Future.value(false);
        }
      } else return Future.value(false);
    } on SocketException {
      showToast('No internet connection !');
      return Future.value(false);
    } catch (error) {
      showToast(error.toString());
      return Future.value(false);
    }
  }

  Future<UserCredential?> loginWithGoogle(BuildContext context) async {
    try{
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      showLoadingDialog(context);
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential? cred = await FirebaseAuth.instance.signInWithCredential(credential);
      closeLoadingDialog(context);
      return cred;
    }on SocketException {
      closeLoadingDialog(context);
      showToast('No internet connection !');
    }catch(error){
      closeLoadingDialog(context);
      showToast('Failed! try again');
    }
  }

  Future<UserCredential?> signInWithFacebook(BuildContext context) async {
    // Trigger the sign-in flow
    try{
      final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ["public_profile","email","user_mobile_phone"
      ]);
      showLoadingDialog(context);

      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential? cred = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      closeLoadingDialog(context);
      return cred;
    } on SocketException {
      closeLoadingDialog(context);
      showToast('No internet connection !');
    }
    catch(error){
      print(error.toString());
      showToast('Failed! try again');
    }
  }

  Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: '<your consumer key>',
        apiSecretKey: ' <your consumer secret>',
        redirectURI: '<your_scheme>://');

    // Trigger the sign-in flow
    AuthResult authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }
}
