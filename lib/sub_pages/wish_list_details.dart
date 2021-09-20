import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/custom_widget/product_list_tile.dart';

import 'package:flutter/material.dart';

class WishListDetails extends StatefulWidget {
  const WishListDetails({Key? key}) : super(key: key);

  @override
  _WishListDetailsState createState() => _WishListDetailsState();
}

class _WishListDetailsState extends State<WishListDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        // backgroundColor: Color(0xffF7F5F5),
        preferredSize: Size.fromHeight(size.width * .2),
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
                  'assets/app_icon/app_bar_icon/close.png',
                )),
          ),
          trailing2: Container(),
          title: Text(
            'Wife',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w700,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
            width: size.width,
            padding: EdgeInsets.fromLTRB(
                size.width * .045, 0, size.width * .045, size.width * .05),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                child: ListView.builder(
                  itemCount: 3,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.width * .035,
                          ),
                          getProductDemo(context),
                          SizedBox(
                            height: size.width * .035,
                          ),
                          Divider(
                            color: Color(0xffA7A6A8),
                            height: size.width * .01,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Text('More to love',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.bold,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .038)),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('See More',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .038)),
                  )),
                ],
              ),
              SizedBox(
                height: size.width * .03,
              ),
              Container(
                width: size.width,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: size.width * .04,
                        mainAxisSpacing: size.width * .03,
                        childAspectRatio: .79),
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return FeatureCategoryListTile();
                    }),
              )
            ])));
  }
}
