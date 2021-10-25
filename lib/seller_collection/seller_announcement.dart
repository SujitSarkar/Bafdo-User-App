import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerAnnouncement extends StatefulWidget {
  @override
  _SellerAnnouncementState createState() => _SellerAnnouncementState();
}

class _SellerAnnouncementState extends State<SellerAnnouncement> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
            child: Text('Announcement',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Recent',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),),
              ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Icon(FontAwesomeIcons.solidCircle,size: 10,color: ColorsVariables.pinkColor,),
                        ),
                        Expanded(

                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices purus rhoncus aliquet et cursus elit mauris varius. ',
                              textAlign: TextAlign.start,
                                style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),),
                          ),
                        ),
                      ],
                    )

                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Previous',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),),
              ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(FontAwesomeIcons.solidCircle,size: 10,color: ColorsVariables.pinkColor,),
                          ),
                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices purus rhoncus aliquet et cursus elit mauris varius. ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),),
                            ),
                          ),
                        ],
                      )

                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
