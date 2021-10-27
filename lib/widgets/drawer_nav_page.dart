import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNavPage extends StatelessWidget {
  const DrawerNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            publicProvider.prefUserModel!=null
                ? _navFunctionBuilder(size, 'Logout', 'assets/app_icon/body_icon/logout.png')
                : _navFunctionBuilder(size, 'Login', 'assets/app_icon/body_icon/logout.png')
          ],
        ),
      ),
    );
  }

  Widget _navFunctionBuilder(Size size,String title,String asset)=>Consumer<PublicProvider>(
    builder: (context,publicProvider,child) {
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
                publicProvider.clearPrefModel();
                Navigator.pop(context);
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
