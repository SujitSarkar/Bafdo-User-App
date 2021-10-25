import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/recently_view_list_tile.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';
import 'package:bafdo/seller_collection/seller_order_list_tile.dart';
import 'package:flutter/material.dart';

class SellerOrder extends StatefulWidget {
  @override
  _SellerOrderState createState() => _SellerOrderState();
}

class _SellerOrderState extends State<SellerOrder> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int boxColor = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(   backgroundColor: ColorsVariables.backgrowndColor,
      key: _scaffoldKey,
      drawer: Drawer(


          child:  DrawerTiles()
      ),
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
            child: Text('Orders',
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            boxColor = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: boxColor == 1
                                  ? Colors.pink
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                              border:
                              Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .08,
                              vertical: size.width * .015,
                            ),
                            child: Text(
                              'All',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: boxColor == 1
                                      ? Colors.white
                                      : Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: size.width*.03,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            boxColor = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: boxColor == 2
                                  ? Colors.pink
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                              border:
                              Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05,
                              vertical: size.width * .015,
                            ),
                            child: Text(
                              'Recent',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: boxColor == 2
                                      ? Colors.white
                                      : Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*.03,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            boxColor = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: boxColor == 3
                                  ? Colors.pink
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                              border:
                              Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05,
                              vertical: size.width * .015,
                            ),
                            child: Text(
                              'This Week',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: boxColor == 3
                                      ? Colors.white
                                      : Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*.03,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            boxColor = 4;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: boxColor == 4
                                  ? Colors.pink
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                              border:
                              Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05,
                              vertical: size.width * .015,
                            ),
                            child: Text(
                              'This Month',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: boxColor == 4
                                      ? Colors.white
                                      : Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*.03,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            boxColor =5;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: boxColor == 5
                                  ? Colors.pink
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                              border:
                              Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05,
                              vertical: size.width * .015,
                            ),
                            child: Text(
                              'This Year',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: boxColor == 5
                                      ? Colors.white
                                      : Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return sellerOrderListTile(context);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
