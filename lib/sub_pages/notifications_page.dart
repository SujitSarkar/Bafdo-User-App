import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import '../bottom_nav_screens/profile.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * .2),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Profile()));
              },
              child: Image.asset(
                'assets/app_icon/app_bar_icon/cart_grey.png',
                fit: BoxFit.fill,
              )),
          trailing2: SizedBox(),
          title: Text(
            'Notifications',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: size.width * .05),
          ),
        ),
      ),
      backgroundColor: Color(0xffEFF9F9),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 13,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                //notification image
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage('assets/app_icon/body_icon/boys.png'),
                ),

                title: Text(
                  //notification body
                  'You have got a new offer from BAFDO...You have got a new offer from BAFDO.. ',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * .04),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*.04),
                child: Divider(
                  thickness: size.width*.001,
                  color: Colors.grey,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
