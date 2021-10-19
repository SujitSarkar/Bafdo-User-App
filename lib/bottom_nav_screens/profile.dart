import 'package:bafdo/tabbar_screens/account.dart';
import 'package:bafdo/tabbar_screens/my_profile.dart';
import 'package:bafdo/tabbar_screens/settings.dart';
import 'package:bafdo/widgets/drawer_nav_page.dart';
import 'package:bafdo/widgets/nav_page-appbar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xffEFF9F9),
        drawer: DrawerNavPage(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: NavPageAppBar(
              openDrawer: () => _scaffoldKey.currentState!.openDrawer()),
        ),
        body: _bodyUI(size),
      ),
    );
  }

  Widget _bodyUI(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.width * .04,
        ),

        //profile image preview
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage('assets/app_icon/body_icon/boys.png'),
                  radius: size.width * .18,
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Image.asset(
                        'assets/app_icon/app_bar_icon/edit_profile.png'))
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.width * .04,
        ),

        //Username preview
        Container(
          width: size.width,
          child: Text(
            'Saidul Khan',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffFF4DAB),
                fontWeight: FontWeight.w600,
                fontFamily: 'taviraj',
                fontSize: size.width * .06),
          ),
        ),
        SizedBox(
          height: size.width * .06,
        ),

        //TabBar titles
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: TabBar(
              unselectedLabelColor: Color(0xffA7A6A8),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffC31A65), Color(0xffFA4494)]),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("My Profile"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Account"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Settings"),
                  ),
                ),
              ]),
        ),

        SizedBox(
          height: size.width * .06,
        ),
        Expanded(
          child: TabBarView(
            children: [
              MyProfile(),
              Account(),
              Settings()
            ],
          ),
        )
      ],
    );
  }
}
