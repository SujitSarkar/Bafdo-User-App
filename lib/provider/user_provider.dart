import 'dart:convert';
import 'dart:io';
import 'package:bafdo/model/user_model.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:http/http.dart' as http;

class UserProvider extends AuthProvider{
  static const String baseUrl= 'https://bafdo.com/api/v2/';
  static const String contentType= 'application/json';

  UserModel? _userModel;
  UserModel? get userModel=>_userModel;


  Future<bool> getUserByToken()async{
    try{
      if(prefUserModel==null) await getPrefUser();
      var postBody = jsonEncode({"access_token":"${prefUserModel.accessToken!}"});
      var response = await http.post(
        Uri.parse(baseUrl+'get-user-by-access_token'),
        headers: {"Content-Type": "application/json"},
        body: postBody);

      if(response.statusCode==200){
        _userModel = userModelFromJson(response.body);
        return true;
      }else{
        return false;
      }
    }on SocketException{
      showToast('No Internet Connection');
      return false;
    }
    catch(error){
      showToast(error.toString());
      return false;
    }
  }

  void clearUserModel(){
    _userModel =null;
    notifyListeners();
  }

  Future<bool> profileImageUpdate(String image, String filename) async {
    try{
      if(prefUserModel==null) await getPrefUser();
      var postBody = jsonEncode({"id":"${prefUserModel.id!}","image": "$image", "filename": "$filename"});

      final response = await http.post(
          Uri.parse(baseUrl+'profile/update-image'),
          headers: {"Content-Type": contentType, "Authorization": "Bearer ${prefUserModel.accessToken!}"},
          body: postBody);
      final jsonData = jsonDecode(response.body);

      if(response.statusCode==200){
        if(jsonData['result']==true){
          await getUserByToken();
          return true;
        }else return false;
      }else return false;

    }catch(error){
      return false;
    }
  }

  Future<bool> profileUpdate(String name,String email) async {
    try{
      if(prefUserModel==null) await getPrefUser();
      var posBody = jsonEncode({"id":"${prefUserModel.id!}","name": "$name", "email": "$email"});

      final response = await http.post(
          Uri.parse(baseUrl+"profile/update"),
          headers: {"Content-Type": contentType, "Authorization": "Bearer ${prefUserModel.accessToken!}"},
          body: posBody);

      final jsonData = jsonDecode(response.body);

      if(response.statusCode==200){
        if(jsonData['result']==true){
          await getUserByToken();
          return true;
        }else return false;
      }else return false;

    }catch(error){
      return false;
    }

  }
}