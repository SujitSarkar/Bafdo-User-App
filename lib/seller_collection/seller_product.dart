import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';
import 'package:bafdo/seller_collection/seller_all_product.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellerProduct extends StatefulWidget {
  @override
  _SellerProductState createState() => _SellerProductState();
}

class _SellerProductState extends State<SellerProduct> {
  String drawerClick = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsVariables.backgrowndColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child:
              Image.asset('assets/app_icon/app_bar_icon/menu.png',)),
          trailing1: Container(),
          trailing2: Container(),
          title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Products',
          style: TextStyle(
              fontFamily: 'taviraj',
              fontWeight: FontWeight.w500,
              color: ColorsVariables.textColor,
              fontStyle: FontStyle.normal,
              fontSize: size.width * .05),),
      ),
        ),
      ),
      drawer: Drawer(
        child: DrawerTiles()
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recently Added',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerAllProduct()));
                          },
                          child: Text('See More',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),),
                        ),
                      ],
                    ),
                  ),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,

                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: size.width*.2,
                                    width: size.width*.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/app_icon/body_icon/joy_stick.png',fit: BoxFit.fitWidth,),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Text('Gaming Controller for PC',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          fontWeight: FontWeight.w500,
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04),),
                                    Text('Brand: Xiaomi',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .035),),
                                    Row(
                                      children: [
                                        Image.asset('assets/app_icon/body_icon/tk.png'),
                                        Text('20.99',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.bold,
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),),
                                      ],
                                    ),
                                  ],)
                              ],
                            ),
                          )
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Top Products',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),),
                        Text('Selected by Orders',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),),
                      ],
                    ),
                  ),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: size.width*.2,
                                    width: size.width*.2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/app_icon/body_icon/joy_stick.png',fit: BoxFit.fitWidth,),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Text('Gaming Controller for PC',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          fontWeight: FontWeight.w500,
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04),),
                                    Text('Sales: Xiaomi',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .035),),
                                    Row(
                                      children: [
                                        Image.asset('assets/app_icon/body_icon/tk.png'),
                                        Text('20.99',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.bold,
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),),
                                      ],
                                    ),
                                  ],)
                              ],
                            ),
                          )
                      );
                    },
                  ),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
