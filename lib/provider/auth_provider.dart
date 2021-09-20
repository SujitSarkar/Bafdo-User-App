import 'dart:io';

import 'package:bafdo/model/signup_model.dart';
import 'package:bafdo/model/userinfo_model.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{

  SignupModel? _signupModel;
  UserInfoModel? _userInfoModel;

  get signupModel=>_signupModel;
  get userInfoModel=>_userInfoModel;

  Future<bool> userSignup(Map<String,String> map)async{
    try{
      http.Response response= await http.post(Uri.parse('https://bafdo.com/api/v2/auth/signup'),
      body:map);
      if(response.statusCode==201){
        _signupModel = signupModelFromJson(response.body);
        notifyListeners();
        if(_signupModel!.result==true){
          return Future.value(true);
        }else{
          showToast(_signupModel!.message);
          return Future.value(false);
        }
      }else{
        showToast('Something went wrong! Try again');
        return Future.value(false);
      }
    }on SocketException{
      showToast('No internet connection !');
      return Future.value(false);
    }
    catch(error){
      showToast(error.toString());
      return Future.value(false);
    }
  }

  Future<bool> loginAndGetUserInfo(Map<String,String> map)async{
    try{
      http.Response response= await http.post(Uri.parse('https://bafdo.com/api/v2/auth/login'),
      body:map);

      if(response.statusCode==200){
        _userInfoModel = userInfoModelFromJson(response.body);
        notifyListeners();
        if(_userInfoModel!.result==true){
          return Future.value(true);
        }else{
          showToast(_userInfoModel!.message);
          return Future.value(false);
        }
      }else{
        showToast('Something went wrong! Try again');
        return Future.value(false);
      }
    }on SocketException{
      showToast('No internet connection !');
      return Future.value(false);
    }
    catch(error){
      showToast(error.toString());
      return Future.value(false);
    }
  }

}