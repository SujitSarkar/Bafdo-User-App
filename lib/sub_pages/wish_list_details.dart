import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
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
                          Row(
                            children: [
                              Container(
                                width: size.width * .25,
                                height: size.width * .25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9.5),
                                ),
                                padding: EdgeInsets.all(size.width * .04),
                                child: Image.asset(
                                  'assets/app_icon/body_icon/joy_stick.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Title: ',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .037),
                                            ),
                                            Text(
                                              'Game accessories',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .037),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.width * .01,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Category: ',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorsVariables.pinkCategoryTextColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .035),
                                            ),
                                            Text(
                                              'Computer & Acce...',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorsVariables.pinkCategoryTextColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .035),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.width * .01,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Color(0xffC31A65), size: size.width * .03),
                                            Icon(Icons.star,
                                                color: Color(0xffC31A65), size: size.width * .03),
                                            Icon(Icons.star,
                                                color: Color(0xffC31A65), size: size.width * .03),
                                            Icon(Icons.star,
                                                color: Color(0xffC31A65), size: size.width * .03),
                                            Icon(Icons.star,
                                                color: Color(0xffC31A65), size: size.width * .03)
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.width * .01,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .038),
                                            ),
                                            Text(
                                              '20',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .038),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
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
