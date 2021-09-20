import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_)=>CartPage()));

              },
              child: Container(
                  width: size.width * .07,
                  height: size.width * .07,
                  child: Image.asset(
                    'assets/app_icon/app_bar_icon/cart_grey.png',
                    fit: BoxFit.fill,
                  ))),

          trailing2: Container(),
          title: Text(
            'Notifications',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: size.width * .05),
          ),
        ),
      ),
      backgroundColor: Color(0xffEFF9F9),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //  height: size.width,
              width: size.width,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.width * .2,
                                width: size.width * .2,
                                child: Image.asset(
                                  'assets/app_icon/body_icon/boys.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'You have got a new offer from \nBAFDO... ',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
