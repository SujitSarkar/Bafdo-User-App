import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/recently_view_list_tile.dart';
import 'package:flutter/material.dart';

class RecentlyViews extends StatefulWidget {
  const RecentlyViews({Key? key}) : super(key: key);

  @override
  _RecentlyViewsState createState() => _RecentlyViewsState();
}

class _RecentlyViewsState extends State<RecentlyViews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {},
                child: Image.asset(
                    'assets/app_icon/app_bar_icon/delete_grey_icon.png')),
          ),
          trailing2: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Stack(
              //  clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 17,
                    child: Image.asset(
                      'assets/app_icon/body_icon/cart.png',
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0,
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
                          color: Colors.white, fontSize: size.width * .02),
                    ),
                  ),
                )
              ],
            ),
          ),
          title: Text(
            'Recently Viewed',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w500,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      backgroundColor: Color(0xffEFF9F9),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return RecentlyViewesTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
