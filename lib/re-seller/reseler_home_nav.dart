import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/re-seller/reseller_chat_page.dart';
import 'package:bafdo/re-seller/reseller_catelog_view_page.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/product_page.dart';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReselerHomeNav extends StatefulWidget {
  const ReselerHomeNav({Key? key}) : super(key: key);

  @override
  _ReselerHomeNavState createState() => _ReselerHomeNavState();
}

class _ReselerHomeNavState extends State<ReselerHomeNav> {
  final List imgList = [
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade400,
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>ReselerChatPage()));},
        child: Icon(Icons.message),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.pink),

                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Top Seller',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Top Seller')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),

              Container(
                height: size.width * .4,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .2,
                              width: size.width * .2,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.width * .5,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 6.0,
                    dotIncreasedColor: Color(0xFFFF335C),
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.black,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: imgList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Container(
                                height: 250,
                                margin: EdgeInsets.symmetric(vertical: 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),


                  ),
                ),
              ),
              Container(
                width: size.width,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: size.width * .001,
                        mainAxisSpacing: size.width * .01,
                        childAspectRatio: .79),
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                          },
                          child: FeatureCategoryListTile());
                    }),
              ),

              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                   child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                   child: Text('Anniversary',
                    textAlign: TextAlign.center,
                     style: TextStyle(
                         fontFamily: 'taviraj',
                         color: Colors.white,
                         fontStyle: FontStyle.normal,
                         fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Anniversary')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),

              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Birthday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Birthday')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),


              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Him',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell( onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Him')));
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),


              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Her',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Her')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),


              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Kids',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Kids')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),



              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Wedding',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Wedding')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),



              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('House Warming',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'House Warming')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),


              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: size.width*.1,
                      width: size.width*.5,

                      decoration: BoxDecoration(color: Colors.pink,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),

                      child: Text('Personalised',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductPage(navigateFrom: 'Personalised')));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('See More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ),
                  ),
                ],
              ),


              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.width * .3,
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.pink.shade100),
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/joy_stick.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Joy Stick",
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 100,)

            ],
          ),
        ),
      ),
    );
  }
}
