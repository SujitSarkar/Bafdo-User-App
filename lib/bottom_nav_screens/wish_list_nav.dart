import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/custom_widget/product_list_tile.dart';
import 'package:bafdo/custom_widget/red_folder_list_tile.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/wish_list_details.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class WishListNav extends StatefulWidget {
  const WishListNav({Key? key}) : super(key: key);

  @override
  _WishListNavState createState() => _WishListNavState();
}

class _WishListNavState extends State<WishListNav> {
  List<String> categoryList = [
    'Wife',
    'Eid',
    'For Children',
    'For Children',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
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
            'Wish List',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w700,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .045,
            size.width * .045, size.width * .28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: size.width * .045,
              ),
              child: Text('Your List (3)',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  // height: size.width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: size.width * .02,
                        childAspectRatio: .7),
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryList.length + 1,
                    itemBuilder: (context, index) {
                      if (categoryList.length == index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: size.width * .13,
                              top: size.width * .013,
                              right: size.width * .013,
                              left: size.width * .013),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(size.width * .02),
                            child: Center(
                                child: Icon(Icons.add, size: size.width * .12)),
                          ),
                        );
                      }

                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => WishListDetails()));
                            print(index);
                          },
                          child: getRedFolder(context, categoryList, index));
                    },
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              height: size.width * .01,
            ),
            Row(
              children: [
                Text('All products',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045)),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit))),
              ],
            ),
            Divider(
              color: Colors.grey,
              height: size.width * .01,
            ),
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
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetail()));
                            },
                            child: getProductDemo(context)),
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
            SizedBox(
              height: size.width * .03,
            ),
            Row(
              children: [
                Text('More To Love',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * .045)),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('See More',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04))),
                )
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
                      crossAxisSpacing: size.width * .001,
                      mainAxisSpacing: size.width * .01,
                      childAspectRatio: .79),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return FeatureCategoryListTile();
                  }),
            ),
            SizedBox(
              height: size.width * .3,
            ),
          ],
        ),
      ),
    );
  }
}
