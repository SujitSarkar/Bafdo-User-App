import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNavPage extends StatelessWidget {
  const DrawerNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            InkWell(
              onTap: ()async{
                SharedPreferences preferences=await SharedPreferences.getInstance();
                preferences.clear();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginWithNumber()), (route) => false);
              },
              child: Text('Logout',style: PublicVariables.outlineBtnTextStyle(size)),
            )
          ],
        ),
      ),
    );
  }
}
