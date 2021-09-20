import 'package:bafdo/colors.dart';
import 'package:bafdo/re-seller/reseler_catelog_nav.dart';
import 'package:bafdo/re-seller/reseler_home_nav.dart';
import 'package:bafdo/re-seller/reseler_my_order_nav.dart';
import 'package:bafdo/re-seller/reseler_my_shop_nav.dart';
import 'package:bafdo/re-seller/reseller_payment_nav.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import 'package:bafdo/sub_pages/notifications_page.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class ReselerHome extends StatefulWidget {
  const ReselerHome({Key? key}) : super(key: key);

  @override
  _ReselerHomeState createState() => _ReselerHomeState();
}

class _ReselerHomeState extends State<ReselerHome>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.pink.shade100,
        ),
        leading: Padding(
          padding: EdgeInsets.fromLTRB(size.width * .025, 0, 0, 0),
          child: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: size.width * .1,
              child: Image.asset(
                'assets/app_icon/app_bar_icon/menu.png',
              ),
            ),
          ),
        ),
        backgroundColor: Colors.pink.shade100,
        elevation: 0.0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width * .2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.width * .002,
                      width: size.width * .01,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * .01,
                      ),
                      //size == 14.91
                      child: Text(
                        'GO WITH BEST',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .018),
                      ),
                    ),
                    Container(
                      height: size.width * .002,
                      width: size.width * .01,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            width: size.width * .5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, size.width * .045, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductSearchPage()));

                      },
                    child: Container(
                      height: size.width * .09,
                      width: size.width * .09,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/app_icon/text_field_icon/search_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .025,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (_)=>CartPage()));},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/app_icon/body_icon/cart.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: -5.0,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * .04,
                          height: size.width * .04,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .02),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * .025,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationPage()));},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/app_icon/app_bar_icon/notification.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: -5.0,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * .04,
                          height: size.width * .04,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .02),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const ["Home", "Catelog", "My Shop", "My Order","Payment"],
        icons: const [
          Icons.home,
          Icons.card_travel,
          Icons.shop,
          Icons.production_quantity_limits,
          Icons.monetization_on_rounded
        ],

        // optional badges, length must be same with labels

        tabSize: 70,
        tabBarHeight: 70,
        textStyle: const TextStyle(
          fontSize: 14,
          color: Colors.pink,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.grey,
        tabIconSize: 30.0,
        tabIconSelectedSize: 36.0,
        tabSelectedColor: Colors.pink.shade100,
        tabIconSelectedColor: Colors.pink,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          ReselerHomeNav(),
          ReselerCatelogNav(),
          ReselerMyShop(),
          ReselerMyOrder(),
          PaymentNav(),


        ],
      ),
    );
  }
}
