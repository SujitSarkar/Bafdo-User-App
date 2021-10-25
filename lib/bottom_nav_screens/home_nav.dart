import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/category_products_list_tile.dart';
import 'package:bafdo/custom_widget/flash_deal_count_down_widget.dart';
import 'package:bafdo/custom_widget/flash_deal_product_list_tile.dart';
import 'package:bafdo/custom_widget/special_category_list_tile.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/model/flash_deal_product_model.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
    final Size size = MediaQuery.of(context).size;

    return ListView(
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

        ///Slider
        Container(
          margin:EdgeInsets.symmetric(horizontal: size.width*.02,vertical: size.width*.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22))),
          child: Container(
            height: size.width * .4,
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
              dotPosition: DotPosition.bottomCenter,
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
        SizedBox(height: size.width * .12),

        ///Category
        Stack(
          clipBehavior: Clip.none,
          children: [
            GridView.builder(
                itemCount: publicProvider.categories==null
                    ?0:publicProvider.categories!.data==null
                    ?0:publicProvider.categories!.data!.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 8.4/9,
                  //mainAxisSpacing: size.width * 0,
                ),
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CategoryPage(url: publicProvider.categories!.data![index].links!.subCategories)));
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
                )),
            Positioned(
                left: size.width * .07,
                top: -size.width * .08,
                child: Container(
                  width: size.width * .3,
                  decoration: BoxDecoration(
                    //color: Colors.white,
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
          ],
        ),
        publicProvider.traditionalCategoriesProducts!=null
            ?publicProvider.traditionalCategoriesProducts!.data!.isNotEmpty
            ?SizedBox(height: size.width * .02):Container():Container(),

        ///Product Column
        Padding(
          padding: EdgeInsets.only(left: size.width*.02),
          child: Column(
            children: [

              ///Anniversary
              publicProvider.traditionalCategoriesProducts!=null
                  ?publicProvider.traditionalCategoriesProducts!.data!.isNotEmpty
                  ?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  publicProvider.traditionalCategories!=null?Container(
                      width: size.width * .6,
                      padding: EdgeInsets.fromLTRB(size.width * .01, 0, 0, 0),
                      child: Row(
                        children: [
                          publicProvider.traditionalCategories!.data![0].banner!.isNotEmpty
                              ?Container(
                            height: 15,width: 13,
                            child: Image.network(
                              'https://bafdo.com/public/${publicProvider.traditionalCategories!.data![0].banner}',
                            ),
                          ):Container(),
                          Text(
                            ' ${publicProvider.traditionalCategories!.data![0].name!}',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.bold,
                                color: ColorsVariables.textColor,
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
              ):Container():Container(),
              publicProvider.traditionalCategoriesProducts!=null
                  ?publicProvider.traditionalCategoriesProducts!.data!.isNotEmpty?
              Container(
                height: size.width * .5,
                width: size.width,
                margin: EdgeInsets.only(top: size.width*.03),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: publicProvider.traditionalCategoriesProducts==null?0:publicProvider.traditionalCategoriesProducts!.data!.length<10?
                  publicProvider.traditionalCategoriesProducts!.data!.length:10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(right: size.width*.04),
                        child: FeatureCategoryListTile(productList: publicProvider.traditionalCategoriesProducts!.data![index],));
                  },
                ),
              ):Container():Container(),

              publicProvider.handPickedProducts!=null
                  ?publicProvider.handPickedProducts!.data!.isNotEmpty
                  ?SizedBox(height: size.width * .04):Container():Container(),

              ///Hand picked
              publicProvider.handPickedProducts!=null
                  ?publicProvider.handPickedProducts!.data!.isNotEmpty
                  ?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Hand Picked',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.bold,
                          color: ColorsVariables.textColor,
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
              ):Container():Container(),
              publicProvider.handPickedProducts!=null
                  ?publicProvider.handPickedProducts!.data!.isNotEmpty
                  ?Container(
                height: size.width * .5,
                width: size.width,
                margin: EdgeInsets.only(top: size.width*.02),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: publicProvider.handPickedProducts==null
                      ?0:publicProvider.handPickedProducts!.data!.length<10?
                  publicProvider.handPickedProducts!.data!.length:10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(right: size.width*.04),
                        child: CategoryProductListTile(productList: publicProvider.handPickedProducts!.data![index]));
                  },
                ),
              ):Container():Container(),
              publicProvider.flashDealProducts!=null
                  ?SizedBox(height: size.width * .04):Container(),

              ///Flash Deal
              publicProvider.flashDealProducts!=null
                  ?FlashDealCountDownWidget(endingDate: publicProvider.flashDealProducts!.data!.endDate!):Container(),

              publicProvider.flashDealProducts!=null
                  ?Container(
                height: size.width * .52,
                width: size.width,
                margin: EdgeInsets.only(top: size.width*.04),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: publicProvider.flashDealProducts==null
                      ?0
                      :publicProvider.flashDealProducts!.data!.products!.data!.length<10
                      ?publicProvider.flashDealProducts!.data!.products!.data!.length:10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(right: size.width*.04),
                        child: FlashDealProductListTile(productList: publicProvider.flashDealProducts!.data!.products!.data![index]));
                  },
                ),
              ):Container(),
              publicProvider.dailyFeaturedProducts!=null
                  ?publicProvider.dailyFeaturedProducts!.data!.isNotEmpty
                  ?SizedBox(height: size.width * .04):Container():Container(),

              ///Daily Featured
              publicProvider.dailyFeaturedProducts!=null
                  ?publicProvider.dailyFeaturedProducts!.data!.isNotEmpty
                  ?Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                            'assets/app_icon/body_icon/feature_icon.png'),
                        Text(' Daily Featured',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontWeight: FontWeight.bold,
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
                  ]):Container():Container(),
              publicProvider.dailyFeaturedProducts!=null
                  ?publicProvider.dailyFeaturedProducts!.data!.isNotEmpty
                  ?Container(
                height: size.width * .5,
                width: size.width,
                margin: EdgeInsets.only(top: size.width*.04),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: publicProvider.dailyFeaturedProducts==null?0:publicProvider.dailyFeaturedProducts!.data!.length<3?
                  publicProvider.dailyFeaturedProducts!.data!.length:3,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(right: size.width*.04),
                        child: CategoryProductListTile(productList: publicProvider.dailyFeaturedProducts!.data![index],));
                  },
                ),
              ):Container():Container(),
              SizedBox(height: size.width * .04),

              ///Featured Categories
              publicProvider.featuredCategories!=null
                  ?publicProvider.featuredCategories!.data!.isNotEmpty
                  ?Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature  Categories',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.bold,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045)),
                  ]):Container():Container(),

              publicProvider.featuredCategories!=null
                  ?publicProvider.featuredCategories!.data!.isNotEmpty
                  ?Container(
                height: size.width * .3,
                width: size.width,
                margin: EdgeInsets.only(top: size.width*.04),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: publicProvider.featuredCategories==null?0:publicProvider.featuredCategories!.data==null?0:publicProvider.featuredCategories!.data!.length,
                  itemBuilder: (context, index) {
                    return getFeatureCard(context,publicProvider.featuredCategories!.data![index]);
                  },
                ),
              ):Container():Container(),
            ],
          ),
        ),SizedBox(height: size.width*.25)

      ],
    );
  }
}
