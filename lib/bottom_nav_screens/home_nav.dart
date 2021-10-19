import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/category_products_list_tile.dart';
import 'package:bafdo/custom_widget/special_category_list_tile.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/pages/category_page.dart';
import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import 'package:bafdo/sub_pages/coupos_page.dart';
import 'package:bafdo/sub_pages/notifications_page.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/product_page.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/drawer_nav_page.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/nav_page-appbar.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeNav extends StatefulWidget {
  HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _counter=0;
  TextEditingController _searchController = TextEditingController();
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();

  Future<void> _fetch(PublicProvider publicProvider)async{
    setState(()=> _counter++);
    if(publicProvider.prefUserModel==null) await publicProvider.getPrefUser();
    if(publicProvider.sliderList.isEmpty) await publicProvider.fetchSliders();
    if(publicProvider.categories==null) await publicProvider.fetchCategories();
    if(publicProvider.topBrands==null)await publicProvider.fetchTopBrands();

    if(publicProvider.brands==null)await publicProvider.fetchBrands();
    if(publicProvider.featuredCategories==null) await publicProvider.fetchFeaturedCategories();
    if(publicProvider.traditionalCategories==null) await publicProvider.fetchTraditionalCategories();
    if(publicProvider.handPickedProducts==null) await publicProvider.fetchHandPickProducts();
    if(publicProvider.flashDealProducts==null) await publicProvider.fetchFlashDealProducts();
    if(publicProvider.dailyFeaturedProducts==null) await publicProvider.fetchDailyFeaturedProducts();
    if(publicProvider.carts==null)await publicProvider.fetchCartList();
    if(publicProvider.wishlistModel==null) await publicProvider.fetchWishList();
  }

  // List<String> _general_gift_categories = [
  //   'Jewelry & Accessories',
  //   'Beauty & care',
  //   'Arts & Carts',
  //   'Home & Appliances',
  //   'Computers & Accessories',
  //   'Outdoor Sports',
  //   'Toys & Entertainment',
  //   'Personalised'
  // ];
  //
  // List<String> _special_gift_categories = [
  //   'Anniversary',
  //   'Birth day',
  //   'Him',
  //   'Her',
  //   'Kids',
  //   'Wedding',
  //   'House warming',
  //   'Personalised'
  // ];
  //
  // List<String> _feature_icons_list = [
  //   'assets/app_icon/body_icon/wedding.png',
  //   'assets/app_icon/body_icon/birthday.png',
  //   'assets/app_icon/body_icon/him.png',
  //   'assets/app_icon/body_icon/her.png',
  //   'assets/app_icon/body_icon/kids.png',
  //   'assets/app_icon/body_icon/anniversary.png',
  //   'assets/app_icon/body_icon/house_warming.png',
  //   'assets/app_icon/body_icon/personalized.png',
  // ];
  // final List<String> imgList = [
  //   'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
  //   'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
  //   'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
  // ];
  int currentPos = 0;

  String? endingHours = '00';
  String? endingMinute = '00';
  String? endingSecond = '00';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if(_counter==0) _fetch(publicProvider);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavPageAppBar(openDrawer: ()=>_scaffoldKey.currentState!.openDrawer()),
      ),
      drawer: DrawerNavPage(),
      body: _bodyUI(context,publicProvider),
    );
  }

  Widget _bodyUI(BuildContext context,PublicProvider publicProvider) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ///Search field
        Padding(
          padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .00,
              size.width * .045, size.width * .015),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProductSearchPage()));
            },
            child: TextFormField(
              controller: _searchController,
              decoration: searchFormDecoration(size),
              cursorColor: Color(0xff131214),
            ),
          ),
        ),

        Expanded(
          child: Container(
              padding: EdgeInsets.all(size.width * .04),
              width: size.width,
              child: SingleChildScrollView(
                  child: Column(children: [

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.width * .5,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(6.97))),
                          child: Carousel(
                            boxFit: BoxFit.cover,
                            autoplay: true,
                            animationCurve: Curves.fastOutSlowIn,
                            animationDuration: Duration(milliseconds: 1000),
                            dotSize: 6.0,
                            dotIncreasedColor: Color(0xFFFF335C),
                            dotBgColor: Colors.transparent,
                            dotColor: Colors.white60,
                            dotPosition: DotPosition.bottomRight,
                            dotVerticalPadding: 10.0,
                            showIndicator: true,
                            indicatorBgPadding: 7.0,
                            images: publicProvider.sliderList.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 250,
                                    margin: EdgeInsets.symmetric(vertical: 0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item,
                                        ),
                                          fit: BoxFit.fill
                                      ),
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  );
                                },
                              );
                            }).toList(),


                          ),
                        ),
                      ),

                      Positioned(
                        bottom: size.width * .05,
                        left: size.width * .1,
                        child: Container(
                            height: size.width * .12,
                            width: size.width * .3,
                            decoration: BoxDecoration(
                                color: Colors.pink.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                border:
                                    Border.all(color: Colors.white, width: .8)),
                            child: Center(
                              child: Text(
                                'Get Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'taviraj',
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .045),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.width * .1),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    GridView.builder(
                        itemCount: publicProvider.categories==null?0:publicProvider.categories!.data==null?0:publicProvider.categories!.data!.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 8.4/9,
                          mainAxisSpacing: size.width * 0,
                        ),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CategoryPage()));
                            },
                            child: specialCategoryListTile(
                                context,
                                publicProvider.categories!.data![index].name??'',
                                'https://bafdo.com/public/${publicProvider.categories!.data![index].banner??''}'),

                          );
                        }),
                    Positioned(
                        left: 0,
                        top: -size.width * .085,
                        child: Container(
                            width: size.width,
                            child: Image.asset(
                              'assets/app_icon/body_icon/special_curve_empty.png',
                              fit: BoxFit.fill,
                            )
                            // Container(
                            //   margin: const EdgeInsetsDirectional.only(
                            //       start: 1, end: 1, top: 1),
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.only(
                            //       topLeft: const Radius.circular(13.0),
                            //       topRight: const Radius.circular(13.0),
                            //     ),
                            //   ), // Bor
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 30),
                            //     child: Text(
                            //       'Special',
                            //       style: TextStyle(
                            //           fontFamily: 'taviraj',
                            //           fontWeight: FontWeight.w500,
                            //           color: ColorsVariables.textColor,
                            //           fontStyle: FontStyle.normal,
                            //           fontSize: size.width * .045),
                            //     ),
                            //   ),
                            // ),
                            )),
                    Positioned(
                        left: size.width * .07,
                        top: -size.width * .08,
                        child: Container(
                          width: size.width * .3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .078,
                              vertical: size.width * .015,
                            ),
                            child: Text(
                              'Special',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: ColorsVariables.pinkColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        )),
                    Positioned(
                        left: size.width * .5,
                        top: -26,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Up Coming',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: size.width * .06),

                    ///Anniversary
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        publicProvider.traditionalCategories!=null?Container(
                            width: size.width * .6,
                            padding: EdgeInsets.fromLTRB(size.width * .01, 0, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,width: 13,
                                  child: Image.network(
                                    'https://bafdo.com/public/${publicProvider.traditionalCategories!.data![0].banner??''}',
                                  ),
                                ),
                                Text(
                                  publicProvider.traditionalCategories!.data![0].name!,
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      fontWeight: FontWeight.w500,
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .045),
                                ),
                              ],
                            )):Container(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                      navigateFrom: publicProvider.traditionalCategories!.data![0].name!,
                                    )));
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: size.width * .04),
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: size.width * .5,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: publicProvider.traditionalCategoriesProducts==null?0:publicProvider.traditionalCategoriesProducts!.data!.length<3?
                        publicProvider.traditionalCategoriesProducts!.data!.length:3,
                        itemBuilder: (context, index) {
                          return FeatureCategoryListTile(productList: publicProvider.traditionalCategoriesProducts!.data![index],);
                        },
                      ),
                    ),
                SizedBox(height: size.width * .04),

                ///Hand picked
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Hand Picked',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      navigateFrom: 'Hand Picked',
                                    )));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .04),
                        child: Text(
                          'See More',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: size.width * .5,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: publicProvider.handPickedProducts==null?0:publicProvider.handPickedProducts!.data!.length<3?
                               publicProvider.handPickedProducts!.data!.length:3,
                    itemBuilder: (context, index) {
                      return CategoryProductListTile(productList: publicProvider.handPickedProducts!.data![index]);
                    },
                  ),
                ),
                    publicProvider.flashDealProducts==null
                        ?SizedBox(height: size.width * .04):Container(),

                    ///Flash Deal
                    publicProvider.flashDealProducts==null
                        ?Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //  crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Image.asset('assets/app_icon/body_icon/flash_deal_icon.png'),
                        Text(
                          'Flash Deal',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            'Ending in',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              height: size.width * .07,
                              width: size.width * .07,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                  color: Colors.pink.shade300,
                                  border: new Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(0, 0, 0, 0.1)),
                                  borderRadius:
                                      new BorderRadius.circular(6.97)),
                              child: Text(
                                endingHours.toString(),
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              )),
                        ),
                        Text(' : '),
                        Expanded(
                          child: Container(
                              height: size.width * .07,
                              width: size.width * .07,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                  color: Colors.pink.shade300,
                                  border: new Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(0, 0, 0, 0.1)),
                                  borderRadius:
                                      new BorderRadius.circular(6.97)),
                              child: Text(
                                endingSecond.toString(),
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              )),
                        ),
                        Text(' : '),
                        Expanded(
                          child: Container(
                            height: size.width * .07,
                            width: size.width * .07,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                                color: Colors.pink.shade300,
                                border: new Border.all(
                                    width: 2.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)),
                                borderRadius: new BorderRadius.circular(6.97)),
                            child: Center(
                                child: Text(
                              endingMinute.toString(),
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                          navigateFrom: 'Flash Deal',
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .02),
                            child: Text('See More',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ):Container(),
                    publicProvider.flashDealProducts==null
                        ?Container(
                  height: size.width * .5,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: publicProvider.flashDealProducts==null?0:publicProvider.flashDealProducts!.data!.length<3?
                    publicProvider.flashDealProducts!.data!.length:3,
                    itemBuilder: (context, index) {
                      return CategoryProductListTile(productList: publicProvider.flashDealProducts!.data![index],);
                    },
                  ),
                ):Container(),
                SizedBox(height: size.width * .04),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //  crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/app_icon/body_icon/feature_icon.png',
                            ),
                            Text('Daily Featured',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .045)),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                          navigateFrom: 'Daily Featured',
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .04),
                            child: Text('See More',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04)),
                          ),
                        ),
                      ]),
                ),
                Container(
                  height: size.width * .5,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: publicProvider.dailyFeaturedProducts==null?0:publicProvider.dailyFeaturedProducts!.data!.length<3?
                                 publicProvider.dailyFeaturedProducts!.data!.length:3,
                    itemBuilder: (context, index) {
                      return CategoryProductListTile(productList: publicProvider.dailyFeaturedProducts!.data![index],);
                    },
                  ),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //  crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text('Feature  Categories',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .045)),
                      ]),
                ),
                Container(
                  height: size.width * .55,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: publicProvider.featuredCategories==null?0:publicProvider.featuredCategories!.data==null?0:publicProvider.featuredCategories!.data!.length,
                    itemBuilder: (context, index) {
                      return getFeatureCard(context,publicProvider.featuredCategories!.data![index]);
                    },
                  ),
                ),
              ]))),
        ),
      ],
    );
  }
}
