import 'package:bafdo/colors.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/widgets/drawer_nav_page.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/nav_page-appbar.dart';
import 'package:flutter/material.dart';

class FestivalPage extends StatefulWidget {
  const FestivalPage({Key? key}) : super(key: key);

  @override
  _FestivalPageState createState() => _FestivalPageState();
}

class _FestivalPageState extends State<FestivalPage> {
  TextEditingController _searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffEFF9F9),
      drawer: DrawerNavPage(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavPageAppBar(openDrawer: ()=>_scaffoldKey.currentState!.openDrawer()),
      ),
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
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
        
        Container(
          height: size.width*.5,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_icon/body_icon/festival_backgound.png')
            ),
            
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28),
            child: Text('Our upcoming \nfeature(The Biggest online festival).\nIt will be launch soon',
             textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .05),),
          )),
        ),

        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('বাঙালি উৎসব প্রিয় জাতি। উৎসবে যেন বাঙালির নতুন প্রাণ। এই প্রাণের সঞ্চারণ ঘটে উৎসবের ভিন্ন ভিন্ন প্রতিটি জিনিসে।  এক একটি প্রাণ মিলে যেন এক প্রাণের মেলার সৃষ্টি হয়। এইযে ইন্টারনেট দুনিয়ার বাহিরে বাঙালির যে আত্মটান সেটাকেই ডিজিটালাইশনের মাধ্যমে বর্তমান সময়োপযোগী করে সবার কাছে তুলে ধরার জন্য আমাদের এই ফিচারটি। এখানে, বিভিন্ন উৎসবকে কেন্দ্র করে নির্দিষ্ট সময়ানুযায়ী এক একটি ফেস্টিভালের কার্যক্রম থাকবে।',
            style: TextStyle(
              fontSize: 15
            ),),
          ),
        )
        // Expanded(
        //   child: Container(
        //       padding: EdgeInsets.all(size.width * .04),
        //       width: size.width,
        //       child: SingleChildScrollView(
        //           child: Column(children: [
        //             Container(
        //               decoration: BoxDecoration(
        //
        //                   borderRadius: BorderRadius.all(Radius.circular(22))),
        //               child: Stack(
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Container(
        //                       height: size.width * .5,
        //                       width: size.width,
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.all(Radius.circular(6.97))),
        //                       child: Carousel(
        //                         boxFit: BoxFit.cover,
        //                         autoplay: true,
        //                         animationCurve: Curves.fastOutSlowIn,
        //                         animationDuration: Duration(milliseconds: 1000),
        //                         dotSize: 6.0,
        //                         dotIncreasedColor: Color(0xFFFF335C),
        //                         dotBgColor: Colors.transparent,
        //                         dotColor: Colors.white60,
        //                         dotPosition: DotPosition.bottomRight,
        //                         dotVerticalPadding: 10.0,
        //                         showIndicator: true,
        //                         indicatorBgPadding: 7.0,
        //                         images: publicProvider.sliderList.map((item) {
        //                           return Builder(
        //                             builder: (BuildContext context) {
        //                               return Container(
        //                                 height: 250,
        //                                 margin: EdgeInsets.symmetric(vertical: 0),
        //                                 decoration: BoxDecoration(
        //                                   color: Colors.pink,
        //                                   borderRadius: BorderRadius.circular(16),
        //                                 ),
        //                                 child: Image.network(
        //                                   item,
        //                                   fit: BoxFit.fill,
        //                                 ),
        //                               );
        //                             },
        //                           );
        //                         }).toList(),
        //
        //
        //                       ),
        //                     ),
        //                   ),
        //
        //                   Positioned(
        //                     bottom: size.width * .05,
        //                     left: size.width * .1,
        //                     child: Container(
        //                         height: size.width * .12,
        //                         width: size.width * .3,
        //                         decoration: BoxDecoration(
        //                             color: Colors.pink.shade300,
        //                             borderRadius:
        //                             BorderRadius.all(Radius.circular(30)),
        //                             border:
        //                             Border.all(color: Colors.white, width: .8)),
        //                         child: Center(
        //                           child: Text(
        //                             'Get Now',
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontFamily: 'taviraj',
        //                                 fontStyle: FontStyle.normal,
        //                                 fontSize: size.width * .045),
        //                           ),
        //                         )),
        //                   )
        //                 ],
        //               ),
        //             ),
        //             SizedBox(height: size.width * .1),
        //             Stack(
        //               overflow: Overflow.visible,
        //               children: [
        //                 GridView.builder(
        //                     itemCount: publicProvider.categories==null?0:publicProvider.categories!.data==null?0:publicProvider.categories!.data!.length,
        //                     gridDelegate:
        //                     SliverGridDelegateWithFixedCrossAxisCount(
        //                       crossAxisCount: 4,
        //                       mainAxisSpacing: size.width * 0,
        //                     ),
        //                     physics: ClampingScrollPhysics(),
        //                     shrinkWrap: true,
        //                     itemBuilder: (context, index) {
        //                       return InkWell(
        //                         onTap: () {
        //                           Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                   builder: (_) => CategoryPage()));
        //                         },
        //                         child: specialCategoryListTile(
        //                             context,
        //                             publicProvider.categories!.data![index].name??'',
        //                             'https://bafdo.com/public/${publicProvider.categories!.data![index].banner??''}'),
        //
        //                       );
        //                     }),
        //                 Positioned(
        //                     left: 0,
        //                     top: -size.width * .085,
        //                     child: Container(
        //                         width: size.width,
        //                         child: Image.asset(
        //                           'assets/app_icon/body_icon/special_curve_empty.png',
        //                           fit: BoxFit.fill,
        //                         )
        //                       // Container(
        //                       //   margin: const EdgeInsetsDirectional.only(
        //                       //       start: 1, end: 1, top: 1),
        //                       //   decoration: BoxDecoration(
        //                       //     color: Colors.white,
        //                       //     borderRadius: BorderRadius.only(
        //                       //       topLeft: const Radius.circular(13.0),
        //                       //       topRight: const Radius.circular(13.0),
        //                       //     ),
        //                       //   ), // Bor
        //                       //   child: Padding(
        //                       //     padding:
        //                       //         const EdgeInsets.symmetric(horizontal: 30),
        //                       //     child: Text(
        //                       //       'Special',
        //                       //       style: TextStyle(
        //                       //           fontFamily: 'taviraj',
        //                       //           fontWeight: FontWeight.w500,
        //                       //           color: ColorsVariables.textColor,
        //                       //           fontStyle: FontStyle.normal,
        //                       //           fontSize: size.width * .045),
        //                       //     ),
        //                       //   ),
        //                       // ),
        //                     )),
        //                 Positioned(
        //                     left: size.width * .07,
        //                     top: -size.width * .08,
        //                     child: Container(
        //                       width: size.width * .3,
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.only(
        //                             topRight: Radius.circular(10),
        //                             topLeft: Radius.circular(10),
        //                           )),
        //                       child: Padding(
        //                         padding: EdgeInsets.symmetric(
        //                           horizontal: size.width * .078,
        //                           vertical: size.width * .015,
        //                         ),
        //                         child: Text(
        //                           'Special',
        //                           style: TextStyle(
        //                               fontFamily: 'taviraj',
        //                               fontWeight: FontWeight.w500,
        //                               color: ColorsVariables.pinkColor,
        //                               fontStyle: FontStyle.normal,
        //                               fontSize: size.width * .04),
        //                         ),
        //                       ),
        //                     )),
        //                 Positioned(
        //                     left: size.width * .5,
        //                     top: -26,
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 30),
        //                       child: Text(
        //                         'Up Coming',
        //                         style: TextStyle(
        //                             fontFamily: 'taviraj',
        //                             fontWeight: FontWeight.w500,
        //                             color: ColorsVariables.textColor,
        //                             fontStyle: FontStyle.normal,
        //                             fontSize: size.width * .04),
        //                       ),
        //                     )),
        //               ],
        //             ),
        //             SizedBox(
        //               height: size.width * .005,
        //             ),
        //
        //             ListView.builder(
        //               physics: ClampingScrollPhysics(),
        //               shrinkWrap: true,
        //               scrollDirection: Axis.vertical,
        //               itemCount: publicProvider.traditionalCategories==null?0:publicProvider.traditionalCategories!.data!.length,
        //               itemBuilder: (context, index) {
        //                 return Column(
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       crossAxisAlignment: CrossAxisAlignment.end,
        //                       children: [
        //                         Container(
        //                             width: size.width * .6,
        //                             padding: EdgeInsets.fromLTRB(size.width * .01, 0, 0, 0),
        //                             child: Row(
        //                               children: [
        //                                 Container(
        //                                   height: 15,width: 13,
        //                                   child: Image.network(
        //                                     'https://bafdo.com/public/${publicProvider.traditionalCategories!.data![index].banner??''}',
        //                                   ),
        //                                 ),
        //                                 Text(
        //                                   publicProvider.traditionalCategories!.data![index].name!,
        //                                   style: TextStyle(
        //                                       fontFamily: 'taviraj',
        //                                       fontWeight: FontWeight.w500,
        //                                       color: ColorsVariables.textColor,
        //                                       fontStyle: FontStyle.normal,
        //                                       fontSize: size.width * .045),
        //                                 ),
        //                               ],
        //                             )),
        //                         InkWell(
        //                           onTap: () {
        //                             Navigator.push(
        //                                 context,
        //                                 MaterialPageRoute(
        //                                     builder: (context) => ProductPage(
        //                                       navigateFrom: 'Traditional Categories',
        //                                     )));
        //                           },
        //                           child: Padding(
        //                             padding:
        //                             EdgeInsets.symmetric(horizontal: size.width * .04),
        //                             child: Text(
        //                               'See More',
        //                               style: TextStyle(
        //                                   fontFamily: 'taviraj',
        //                                   fontWeight: FontWeight.w500,
        //                                   color: Colors.grey,
        //                                   fontStyle: FontStyle.normal,
        //                                   fontSize: size.width * .04),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     Container(
        //                       height: size.height*.15,width: size.width,
        //                       child: ListView.builder(
        //                           physics: ClampingScrollPhysics(),
        //                           shrinkWrap: true,
        //                           itemCount: 2,
        //                           itemBuilder: (_,ind){
        //                             return Container();
        //                             // InkWell(
        //                             //   onTap: () {
        //                             //     Navigator.push(
        //                             //         context,
        //                             //         MaterialPageRoute(
        //                             //             builder: (_) => ProductDetail()));
        //                             //   },
        //                             //   child: FeatureCategoryListTile());
        //                           }),
        //                     ),
        //                   ],
        //                 );
        //               },
        //             ),
        //             SizedBox(
        //               height: size.width * .04,
        //             ),
        //             // Row(
        //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             //   //  crossAxisAlignment: CrossAxisAlignment.end,
        //             //
        //             //   children: [
        //             //     Padding(
        //             //       padding: const EdgeInsets.all(5.0),
        //             //       child: Text(
        //             //         'Hand Picked',
        //             //         style: TextStyle(
        //             //             fontFamily: 'taviraj',
        //             //             fontWeight: FontWeight.w500,
        //             //             color: ColorsVariables.textColor,
        //             //             fontStyle: FontStyle.normal,
        //             //             fontSize: size.width * .045),
        //             //       ),
        //             //     ),
        //             //     InkWell(
        //             //       onTap: () {
        //             //         Navigator.push(
        //             //             context,
        //             //             MaterialPageRoute(
        //             //                 builder: (context) => ProductPage(
        //             //                       navigateFrom: 'Hand Picked',
        //             //                     )));
        //             //       },
        //             //       child: Padding(
        //             //         padding:
        //             //             EdgeInsets.symmetric(horizontal: size.width * .04),
        //             //         child: Text(
        //             //           'See More',
        //             //           style: TextStyle(
        //             //               fontFamily: 'taviraj',
        //             //               fontWeight: FontWeight.w500,
        //             //               color: Colors.grey,
        //             //               fontStyle: FontStyle.normal,
        //             //               fontSize: size.width * .04),
        //             //         ),
        //             //       ),
        //             //     ),
        //             //   ],
        //             // ),
        //             // Container(
        //             //   height: size.width * .5,
        //             //   width: size.width,
        //             //   child: ListView.builder(
        //             //     scrollDirection: Axis.horizontal,
        //             //     itemCount: 3,
        //             //     itemBuilder: (context, index) {
        //             //       return FeatureCategoryListTile();
        //             //     },
        //             //   ),
        //             // ),
        //             // SizedBox(
        //             //   height: size.width * .04,
        //             // ),
        //             // Padding(
        //             //   padding: const EdgeInsets.only(left: 5),
        //             //   child: Container(
        //             //     child: Row(
        //             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             //       //  crossAxisAlignment: CrossAxisAlignment.end,
        //             //
        //             //       children: [
        //             //         Image.asset(
        //             //           'assets/app_icon/body_icon/flash_deal_icon.png',
        //             //         ),
        //             //         Text(
        //             //           'Flash Deal',
        //             //           style: TextStyle(
        //             //               fontFamily: 'taviraj',
        //             //               fontWeight: FontWeight.w500,
        //             //               color: ColorsVariables.textColor,
        //             //               fontStyle: FontStyle.normal,
        //             //               fontSize: size.width * .045),
        //             //         ),
        //             //         Padding(
        //             //           padding: const EdgeInsets.only(left: 5, right: 5),
        //             //           child: Text(
        //             //             'Ending in',
        //             //             style: TextStyle(
        //             //                 fontFamily: 'taviraj',
        //             //                 fontWeight: FontWeight.w500,
        //             //                 color: ColorsVariables.textColor,
        //             //                 fontStyle: FontStyle.normal,
        //             //                 fontSize: size.width * .04),
        //             //           ),
        //             //         ),
        //             //         Expanded(
        //             //           child: Container(
        //             //               height: size.width * .07,
        //             //               width: size.width * .07,
        //             //               alignment: Alignment.center,
        //             //               decoration: new BoxDecoration(
        //             //                   color: Colors.pink.shade300,
        //             //                   border: new Border.all(
        //             //                       width: 2.0,
        //             //                       color: Color.fromRGBO(0, 0, 0, 0.1)),
        //             //                   borderRadius:
        //             //                       new BorderRadius.circular(6.97)),
        //             //               child: Text(
        //             //                 endingHours.toString(),
        //             //                 style: TextStyle(
        //             //                     fontFamily: 'poppins',
        //             //                     fontWeight: FontWeight.w500,
        //             //                     color: Colors.white,
        //             //                     fontStyle: FontStyle.normal,
        //             //                     fontSize: size.width * .04),
        //             //               )),
        //             //         ),
        //             //         Text(' : '),
        //             //         Expanded(
        //             //           child: Container(
        //             //               height: size.width * .07,
        //             //               width: size.width * .07,
        //             //               alignment: Alignment.center,
        //             //               decoration: new BoxDecoration(
        //             //                   color: Colors.pink.shade300,
        //             //                   border: new Border.all(
        //             //                       width: 2.0,
        //             //                       color: Color.fromRGBO(0, 0, 0, 0.1)),
        //             //                   borderRadius:
        //             //                       new BorderRadius.circular(6.97)),
        //             //               child: Text(
        //             //                 endingSecond.toString(),
        //             //                 style: TextStyle(
        //             //                     fontFamily: 'poppins',
        //             //                     fontWeight: FontWeight.w500,
        //             //                     color: Colors.white,
        //             //                     fontStyle: FontStyle.normal,
        //             //                     fontSize: size.width * .04),
        //             //               )),
        //             //         ),
        //             //         Text(' : '),
        //             //         Expanded(
        //             //           child: Container(
        //             //             height: size.width * .07,
        //             //             width: size.width * .07,
        //             //             alignment: Alignment.center,
        //             //             decoration: new BoxDecoration(
        //             //                 color: Colors.pink.shade300,
        //             //                 border: new Border.all(
        //             //                     width: 2.0,
        //             //                     color: Color.fromRGBO(0, 0, 0, 0.1)),
        //             //                 borderRadius: new BorderRadius.circular(6.97)),
        //             //             child: Center(
        //             //                 child: Text(
        //             //               endingMinute.toString(),
        //             //               style: TextStyle(
        //             //                   fontFamily: 'poppins',
        //             //                   // fontWeight: FontWeight.w500,
        //             //                   color: Colors.white,
        //             //                   fontStyle: FontStyle.normal,
        //             //                   fontSize: size.width * .04),
        //             //             )),
        //             //           ),
        //             //         ),
        //             //         InkWell(
        //             //           onTap: () {
        //             //             Navigator.push(
        //             //                 context,
        //             //                 MaterialPageRoute(
        //             //                     builder: (context) => ProductPage(
        //             //                           navigateFrom: 'Flash Deal',
        //             //                         )));
        //             //           },
        //             //           child: Padding(
        //             //             padding: EdgeInsets.symmetric(
        //             //                 horizontal: size.width * .02),
        //             //             child: Text('See More',
        //             //                 style: TextStyle(
        //             //                     fontFamily: 'taviraj',
        //             //                     color: Colors.grey,
        //             //                     fontStyle: FontStyle.normal,
        //             //                     fontSize: size.width * .04)),
        //             //           ),
        //             //         ),
        //             //       ],
        //             //     ),
        //             //   ),
        //             // ),
        //             // Container(
        //             //   height: size.width * .5,
        //             //   width: size.width,
        //             //   child: ListView.builder(
        //             //     scrollDirection: Axis.horizontal,
        //             //     itemCount: 3,
        //             //     itemBuilder: (context, index) {
        //             //       return FeatureCategoryListTile();
        //             //     },
        //             //   ),
        //             // ),
        //             // SizedBox(
        //             //   height: size.width * .04,
        //             // ),
        //             // Padding(
        //             //   padding: const EdgeInsets.only(left: 5),
        //             //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             //       //  crossAxisAlignment: CrossAxisAlignment.end,
        //             //
        //             //       children: [
        //             //         Row(
        //             //           children: [
        //             //             Image.asset(
        //             //               'assets/app_icon/body_icon/feature_icon.png',
        //             //             ),
        //             //             Text('Daily Featured',
        //             //                 style: TextStyle(
        //             //                     fontFamily: 'taviraj',
        //             //                     color: ColorsVariables.textColor,
        //             //                     fontStyle: FontStyle.normal,
        //             //                     fontSize: size.width * .045)),
        //             //           ],
        //             //         ),
        //             //         InkWell(
        //             //           onTap: () {
        //             //             Navigator.push(
        //             //                 context,
        //             //                 MaterialPageRoute(
        //             //                     builder: (context) => ProductPage(
        //             //                           navigateFrom: 'Daily Featured',
        //             //                         )));
        //             //           },
        //             //           child: Padding(
        //             //             padding: EdgeInsets.symmetric(
        //             //                 horizontal: size.width * .04),
        //             //             child: Text('See More',
        //             //                 style: TextStyle(
        //             //                     fontFamily: 'taviraj',
        //             //                     color: Colors.grey,
        //             //                     fontStyle: FontStyle.normal,
        //             //                     fontSize: size.width * .04)),
        //             //           ),
        //             //         ),
        //             //       ]),
        //             // ),
        //             // Container(
        //             //   height: size.width * .5,
        //             //   width: size.width,
        //             //   child: ListView.builder(
        //             //     scrollDirection: Axis.horizontal,
        //             //     itemCount: 3,
        //             //     itemBuilder: (context, index) {
        //             //       return FeatureCategoryListTile();
        //             //     },
        //             //   ),
        //             // ),
        //             // SizedBox(
        //             //   height: size.width * .04,
        //             // ),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 5),
        //               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   //  crossAxisAlignment: CrossAxisAlignment.end,
        //
        //                   children: [
        //                     Text('Feature  Categories',
        //                         style: TextStyle(
        //                             fontFamily: 'taviraj',
        //                             fontWeight: FontWeight.w500,
        //                             color: ColorsVariables.textColor,
        //                             fontStyle: FontStyle.normal,
        //                             fontSize: size.width * .045)),
        //                     InkWell(
        //                       onTap: () {
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => ProductPage(
        //                                   navigateFrom: 'Feature  Categories',
        //                                 )));
        //                       },
        //                       child: Padding(
        //                         padding: EdgeInsets.symmetric(
        //                             horizontal: size.width * .04),
        //                         child: Text('See More',
        //                             style: TextStyle(
        //                                 fontFamily: 'taviraj',
        //                                 color: Colors.grey,
        //                                 fontStyle: FontStyle.normal,
        //                                 fontSize: size.width * .04)),
        //                       ),
        //                     ),
        //                   ]),
        //             ),
        //             Container(
        //               height: size.width * .8,
        //               width: size.width,
        //               child: ListView.builder(
        //                 scrollDirection: Axis.horizontal,
        //                 itemCount: publicProvider.featuredCategories==null?0:publicProvider.featuredCategories!.data==null?0:publicProvider.featuredCategories!.data!.length,
        //                 itemBuilder: (context, index) {
        //                   return getFeatureCard(context,publicProvider.featuredCategories!.data![index]);
        //                 },
        //               ),
        //             ),
        //           ]))),
        // ),
      ],
    );
  }
}
