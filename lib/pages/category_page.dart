import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/sub_pages/recently_views.dart';

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController _searchController = TextEditingController();

  List<String> sideBarImageList = [
    'assets/app_icon/body_icon/him_grey_icon.png',
    'assets/app_icon/body_icon/her_grey_icon.png',
    'assets/app_icon/body_icon/kids_grey_icon.png',
    'assets/app_icon/body_icon/house_grey_icon.png',
    'assets/app_icon/body_icon/aniversery_grey_icon.png',
    'assets/app_icon/body_icon/wedding_grey.png',
    'assets/app_icon/body_icon/birthday_grey_icon.png',
    'assets/app_icon/body_icon/personalised_grey_icon.png',
  ];

  List<String> sideBarTitleList = [
    'Him',
    'Her',
    'Kids',
    '  House \nwarming',
    'Anniversary',
    'Wedding',
    'Birth day',
    'Personalised'
  ];

  int? listIndex;

  @override
  void initState() {
    // TODO: implement initState
    listIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * .2),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: Text(
            'Categories',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: size.width * .06),
          ),
          trailing1: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RecentlyViews()));
              },
              child: Image.asset('assets/app_icon/body_icon/favorite.png')),
          trailing2: Container(),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * .045,
                    size.width * .00, size.width * .045, size.width * .015),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size.width * .03),
                        topRight: Radius.circular(size.width * .03),
                        bottomLeft: Radius.circular(size.width * .03),
                        bottomRight: Radius.circular(size.width * .03),
                      )),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                      child: Container(
                        width: size.width * .6,
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintText: 'Search product',
                              hintStyle: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                              suffixIcon: Image.asset(
                                'assets/app_icon/text_field_icon/search_icon.png',
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          cursorColor: Color(0xff131214),
                        ),
                      )),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: size.height * .7,
                      width: size.width * .3,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          listIndex = index;
                                        });
                                      },
                                      child: Container(
                                        width: size.width * .25,
                                        color: listIndex == index
                                            ? Color(0xffEFF9F9)
                                            : Colors.white,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: size.width * .08,
                                                width: size.width * .08,
                                                child: Image.asset(
                                                  '${sideBarImageList[index]}',
                                                  fit: BoxFit.fill,
                                                  color: listIndex == index
                                                      ? Colors.pink
                                                      : Colors.grey,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                    '${sideBarTitleList[index]}',
                                                    style: TextStyle(
                                                        fontFamily: 'taviraj',
                                                        color:
                                                            listIndex == index
                                                                ? Colors.pink
                                                                : Colors.grey,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize:
                                                            size.width * .038)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: listIndex == index,
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/virtical_indicator.png'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.width * .02,
                                )
                              ],
                            );
                          })),
                  Container(
                      width: size.width * .7,
                      height: size.height * .8,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Your Favorite',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .045)),
                            ),
                            Container(
                              height: size.width * .7,
                              width: size.width,
                              child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return getFavoriteOfferCard(context);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Special Events',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .045)),
                            ),
                            Container(
                              height: size.width * .7,
                              width: size.width,
                              child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return getFavoriteOfferCard(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
