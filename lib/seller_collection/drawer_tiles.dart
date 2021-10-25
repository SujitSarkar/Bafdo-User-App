import 'package:bafdo/seller_collection/seller_announcement.dart';
import 'package:bafdo/seller_collection/seller_home.dart';
import 'package:bafdo/seller_collection/seller_invite.dart';
import 'package:bafdo/seller_collection/seller_payment.dart';
import 'package:bafdo/seller_collection/seller_product.dart';
import 'package:bafdo/seller_collection/seller_profile.dart';
import 'package:bafdo/seller_collection/seller_upload_product.dart';
import 'package:flutter/material.dart';

class DrawerTiles extends StatefulWidget {
  @override
  _DrawerTilesState createState() => _DrawerTilesState();
}

class _DrawerTilesState extends State<DrawerTiles> {
  String drawerClick = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffEFF9F9),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
      ),
      child: ListView(

        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xffEFF9F9),
                borderRadius: BorderRadius.only(topRight: Radius.circular(30))

            ),
            child: Center(child: Container(

              height: size.width*.4,
              width: size.width*.4,


              decoration: BoxDecoration(

                  image: DecorationImage(image: AssetImage('assets/app_icon/app_bar_icon/bafdo_with_logo.png',))
              ),

            )

            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,
              child: Image.asset('assets/app_icon/drawer_icon/dash_board.png',color: drawerClick=='Dashboard'?Colors.pinkAccent:Colors.grey.shade600,),

            ) ,
            title:  Text('Dashboard',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Dashboard'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {

              setState(() {
                drawerClick = 'Dashboard';
              });

              Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerHome()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,



              child: Image.asset('assets/app_icon/drawer_icon/products.png',color: drawerClick=='Products'?Colors.pinkAccent:Colors.grey.shade600,),


            ) ,
            title:  Text('Products',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Products'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {
              setState(() {
                drawerClick = 'Products';
              });
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerProduct()));
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,


              child: Image.asset('assets/app_icon/drawer_icon/payment.png',color: drawerClick=='Payment'?Colors.pinkAccent:Colors.grey.shade600,),

            ) ,
            title:  Text('Payment',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Payment'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {
              setState(() {
                drawerClick = 'Payment';
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerPayment()));
              });
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,



              child: Image.asset('assets/app_icon/drawer_icon/seller_feed.png',color: drawerClick=='Seller Feed'?Colors.pinkAccent:Colors.grey.shade600,),

            ) ,
            title:  Text('Seller Feed',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Seller Feed'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {
              setState(() {
                drawerClick = 'Seller Feed';

                Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerUploadProduct()));

              });
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,


              child: Image.asset('assets/app_icon/drawer_icon/announcement.png',color: drawerClick=='Announcement'?Colors.pinkAccent:Colors.grey.shade600,),

            ) ,
            title:  Text('Announcement',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Announcement'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {
              setState(() {
                drawerClick = 'Announcement';
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerAnnouncement()));
              });
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,



              child: Image.asset('assets/app_icon/drawer_icon/help_center.png',color: drawerClick=='Help Center'?Colors.pinkAccent:Colors.grey.shade600,),

            ) ,
            title:  Text('Help Center',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Help Center'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {
              setState(() {
                drawerClick = 'Help Center';

                Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerProfile()));

              });
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Container(

              height: size.width*.3,
              width: size.width*.3,



              child: Image.asset('assets/app_icon/drawer_icon/invite_seller.png',color: drawerClick=='Invite Seller'?Colors.pinkAccent:Colors.grey.shade600,),

            ) ,
            title:  Text('Invite Seller',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: drawerClick=='Invite Seller'?Colors.pinkAccent:Colors.grey.shade600,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),),
            onTap: () {
              setState(() {
                drawerClick = 'Invite Seller';
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerInvite()));
              });
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading:Container(

                height: size.width*.3,
                width: size.width*.3,

                child: Image.asset('assets/app_icon/drawer_icon/logout.png',color: drawerClick=='Sign Out'?Colors.pinkAccent:Colors.grey.shade600,),

              ) ,
              title:  Text('Sign Out',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: drawerClick=='Sign Out'?Colors.pinkAccent:Colors.grey.shade600,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .045),),
              onTap: () {
                setState(() {
                  drawerClick = 'Sign Out';
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
