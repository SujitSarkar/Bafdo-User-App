import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/provider/user_provider.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNavPage extends StatelessWidget {
  const DrawerNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            authProvider.prefUserModel!=null
                ? _navFunctionBuilder(size, 'Logout', 'assets/app_icon/body_icon/logout.png',authProvider)
                : _navFunctionBuilder(size, 'Login', 'assets/app_icon/body_icon/logout.png',authProvider)
          ],
        ),
      ),
    );
  }

  Widget _navFunctionBuilder(Size size,String title,String asset, AuthProvider authProvider)=>Consumer<PublicProvider>(
    builder: (context,publicProvider,child) {
      return Consumer<UserProvider>(
        builder: (context,userProvider, child) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: Material(
              color: BColors.pageBgColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: ListTile(
                onTap: ()async{
                  SharedPreferences preferences= await SharedPreferences.getInstance();
                  if(title=='Logout'){
                    preferences.clear();
                    authProvider.clearPrefModel();
                    userProvider.clearUserModel();
                    Navigator.pop(context);
                  }else if(title=='Login'){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginWithNumber()));
                  }
                },
                title: Text(title,maxLines: 1,
                    style: TextStyle(color: BColors.fontColor,fontSize: size.width*.042,fontFamily: '')),
                leading: Image.asset(asset),
                contentPadding: EdgeInsets.symmetric(horizontal: size.width*.04,vertical: 0.0),
                horizontalTitleGap: 0.0,
                dense: true,
              ),
            ),
          );
        }
      );
    }
  );
}
