import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(   backgroundColor: ColorsVariables.backgrowndColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
              Image.asset('assets/app_icon/app_bar_icon/arrow_left.png',)),
          trailing1: Container(),
          trailing2: Container(),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Seller Profile',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .05),),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Container(
                        width: size.width,
                        height: size.width*.3,
                        child: Center(
                            child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              radius: size.width * .08,
                              backgroundImage: AssetImage('assets/app_icon/body_icon/boys.png'),
                            ),
                            Text('Sidul Khan',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),),
                            Text('+8800175486213',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: ColorsVariables.dividerColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),),
                          ],
                        ))) ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Container(
                        width: size.width,
                        height: size.width*.2,
                        child: Center(
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.place,color: Colors.grey,size:size.width*.09 ,),
                                    ),
                                    Column(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('City',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.w500,
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),),
                                        Text('Bashundara, Dhaka BD',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.w500,
                                              color: ColorsVariables.dividerColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),),
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                      height:size.width*.07 ,
                                        width:size.width*.07 ,

                                        child: Image.asset('assets/app_icon/body_icon/glob_icon.png',fit: BoxFit.fill,)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Language',
                                            style: TextStyle(
                                                fontFamily: 'taviraj',
                                                fontWeight: FontWeight.w500,
                                                color: ColorsVariables.textColor,
                                                fontStyle: FontStyle.normal,
                                                fontSize: size.width * .04),),
                                          Text('English',
                                            style: TextStyle(
                                                fontFamily: 'taviraj',
                                                fontWeight: FontWeight.w500,
                                                color: ColorsVariables.dividerColor,
                                                fontStyle: FontStyle.normal,
                                                fontSize: size.width * .04),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),




                              ],
                            ))) ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Container(
                        width: size.width,
                        height: size.width*.2,
                        child: Center(
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                Text('Share our App',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      fontWeight: FontWeight.w500,
                                      color: ColorsVariables.pinkColor,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .04),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.share_outlined,color: Colors.pink,size:size.width*.1 ,),
                                ),






                              ],
                            ))) ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Container(
                        width: size.width,

                        child: Center(
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ListTile(
                                  leading: Icon(Icons.people_alt_outlined,color: Colors.grey,size:size.width*.07 ),

                                  title: Text('Go to regular profile',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                      height:size.width*.06 ,
                                      width:size.width*.06 ,

                                      child: Image.asset('assets/app_icon/drawer_icon/dash_board.png',fit: BoxFit.fill,)) ,

                                  title: Text('My Dashboard',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                      height:size.width*.06 ,
                                      width:size.width*.06 ,

                                      child: Image.asset('assets/app_icon/drawer_icon/products.png',fit: BoxFit.fill,)) ,

                                  title: Text('My Products',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                      height:size.width*.06 ,
                                      width:size.width*.06 ,

                                      child: Icon(Icons.messenger_outline,color: Colors.grey,size:size.width*.07 ,)) ,

                                  title: Text('Messages',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.format_list_bulleted,color: Colors.grey,size:size.width*.07 ,),

                                  title: Text('Customer List',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.reorder_outlined,color: Colors.grey,size:size.width*.07 ,),

                                  title: Text('All Orders',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),

                              ],
                            ))) ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Container(
                        width: size.width,

                        child: Center(
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ListTile(
                                  leading: Icon(Icons.settings_outlined,color: Colors.grey,size:size.width*.07 ),

                                  title: Text('Settings',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                      height:size.width*.06 ,
                                      width:size.width*.06 ,

                                      child: Image.asset('assets/app_icon/body_icon/terms_icon.png',fit: BoxFit.fill,)) ,

                                  title: Text('Terms & Conditions',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                      height:size.width*.06 ,
                                      width:size.width*.06 ,

                                      child: Image.asset('assets/app_icon/body_icon/privacy_icon.png',fit: BoxFit.fill,)) ,

                                  title: Text('Privacy Policy',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                      height:size.width*.06 ,
                                      width:size.width*.06 ,

                                      child: Image.asset('assets/app_icon/body_icon/about_icon.png',fit: BoxFit.fill,)) ,

                                  title: Text('About Bafdo',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  trailing: Icon(Icons.navigate_next),
                                  onTap: (){

                                  },
                                ),
                              ],
                            ))) ,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
