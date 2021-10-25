import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/seller_collection/seller_home_nav.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> with TickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 2,
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
      backgroundColor: ColorsVariables.backgrowndColor,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsVariables.backgrowndColor,
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
        backgroundColor: ColorsVariables.backgrowndColor,
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Dashboard',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w500,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .05),),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, size.width * .02, size.width * .045, size.width * .02),
            child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductSearchPage()));

                  },

                  child:


                  Container(


                    width: 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/app_icon/text_field_icon/search_icon.png',),

                          fit: BoxFit.fill,
                        ),


                    ),






                  ),
                ),
          )
        ],
      ),

      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const ["My Shop", "Catelog", "Home", "My Order","Payment"],
        icons: const [

          FontAwesomeIcons.store,
          FontAwesomeIcons.book,
          Icons.home,
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
          // ReselerMyShop(),
          // ReselerCatelogNav(),
          SellerHomeNav(),
          SellerHomeNav(),
          SellerHomeNav(),
          SellerHomeNav(),
          SellerHomeNav(),
          // ReselerMyOrder(),
          // PaymentNav(),


        ],
      ),
    );
  }
}
