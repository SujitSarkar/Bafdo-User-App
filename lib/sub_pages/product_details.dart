import 'package:bafdo/bottom_nav_screens/wish_list_nav.dart';
import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/related_product_list_tile.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import 'package:bafdo/sub_pages/order_details.dart';
import 'package:bafdo/sub_pages/product_details_dialog.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  int? productId;

  ProductDetail({this.productId});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counter=0;
  bool thumbValue = false;

  int _currentIndex = 1;

  bool wishListSelect = false;
  bool _isLoading = false;

  Future<void> fetch(PublicProvider publicProvider)async {
    setState(() {
      _isLoading=true;
    });
    await publicProvider.fetchProductDetails(widget.productId!).then((value){
      setState(() {
        _isLoading=false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
    Size size = MediaQuery.of(context).size;
    if(_counter==0){
      setState(() {
        _counter++;
      });
     fetch(publicProvider);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              offset: Offset(0, 75),
              icon: Image.asset(
                'assets/app_icon/body_icon/pink_vertical_more.png',
                scale: .8,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/app_icon/bottom_nav_icon/home.png',
                                  color: Colors.grey,
                                  scale: .8,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .045),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductSearchPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/app_icon/text_field_icon/search_icon.png',
                                  scale: .8,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Search",
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .045),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => WishListNav()));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/app_icon/body_icon/favorite.png',
                                    scale: .7,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Wishlist",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .045),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      value: 1,
                    ),
                  ]),
          trailing2: Container(),
          title: Text(
            'Product Details',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w500,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _isLoading?Column(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                shape: BoxShape.rectangle, width: size.width, height: 130),
          ),
          SizedBox(width: 8),
          SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 10,
                spacing: 20,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 16,
                  borderRadius: BorderRadius.circular(8),
                  minLength: MediaQuery.of(context).size.width / 2,
                )),
          ),
        ],
      ):
      SafeArea(child: _bodyUI(context,publicProvider)),
    );
  }

  Widget _bodyUI(BuildContext context,PublicProvider publicProvider) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height * .85,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      width: size.width,
                      height: size.width,
                      color: Color(0xffF7F5F5),
                      padding: EdgeInsets.all(size.width * .045),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                                width: size.width * .2,
                                decoration: BoxDecoration(
                                  color: Color(0xffEE2A7B).withOpacity(0.13),
                                  borderRadius:
                                      BorderRadius.circular(size.width * .3),
                                ),

                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:size.width * .03,
                                    vertical :size.width * .02,
                                  ),
                                  child: Center(
                                    
                                    child: publicProvider.productDetails!=null?Text(
                                      '$_currentIndex/${publicProvider.productDetails!.data![0].photos!.length}',
                                      style: TextStyle(
                                          color: Color(0xffC31A65),
                                          fontSize: size.width * .04),
                                    ):Text(
                                      '0/0',
                                      style: TextStyle(
                                          color: Color(0xffC31A65),
                                          fontSize: size.width * .04),
                                    ),
                                  ),
                                )),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: (){

                                  setState(() {
                                    wishListSelect = !wishListSelect;

                                  });
                                },
                                child:wishListSelect ==true? CircleAvatar(
                                  radius: 20,
                                  child: Image.asset(
                                    'assets/app_icon/body_icon/pink_love.png',
                                    fit: BoxFit.fill,
                                  ),
                                ):CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 19,

                                    child: Image.asset(
                                      'assets/app_icon/body_icon/favorite.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width,
                                   height: size.width * .75,

                              child: publicProvider.productDetails!=null?Carousel(
                                boxFit: BoxFit.cover,
                                autoplay: false,
                                animationCurve: Curves.fastOutSlowIn,
                                animationDuration: Duration(milliseconds: 1000),
                                dotSize: 6.0,
                                dotIncreasedColor: Color(0xFFFF335C),
                                dotBgColor: Colors.transparent,
                                dotColor: Colors.white60,
                                dotPosition: DotPosition.bottomRight,
                                dotVerticalPadding: 10.0,
                                showIndicator: false,
                                indicatorBgPadding: 7.0,
                                onImageChange: (index,reason){
                                  setState(() {
                                    _currentIndex = reason+1;

                                  });
                                },
                                images: publicProvider.productDetails!.data![0].photos!.map((item) {
                                  return Builder(
                                    builder: (_) {
                                      return Container(
                                        height: 250,
                                        margin: EdgeInsets.symmetric(vertical: 0),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF7F5F5),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Image.network(
                                          'https://bafdo.com/public/$item',
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),


                              ):Container(),
                            ),
                          ),




                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .02),
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.fromLTRB(
                          size.width * .045, 0, 0, size.width * .045),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          publicProvider.productDetails!=null?Text(
                            publicProvider.productDetails!.data![0].name??'',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .045),
                          ):Text(''),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              //  mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/app_icon/body_icon/tk.png',
                                                ),
                                                publicProvider.productDetails!=null?Text(
                                                  '${publicProvider.productDetails!.data![0].priceLower??''}',
                                                  style: TextStyle(
                                                      fontFamily: 'taviraj',
                                                      color: ColorsVariables
                                                          .textColor,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          size.width * .05),
                                                ):Text(''),
                                              ],
                                            ),
                                            SizedBox(
                                              width: size.width * .01,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/app_icon/body_icon/tk_grey.png',
                                                ),
                                                publicProvider.productDetails!=null?Text(
                                                  '${publicProvider.productDetails!.data![0].priceLower??''}',
                                                  style: TextStyle(
                                                      fontFamily: 'taviraj',
                                                      color: Colors.grey,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          size.width * .04),
                                                ):Text(''),
                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: size.width * .03),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xffC31A65),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      size.width * .01)),
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * .004,
                                              size.width * .001,
                                              size.width * .004,
                                              size.width * .001),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                                top: 2,
                                                bottom: 2),
                                            child: Row(
                                              children: [
                                                publicProvider.productDetails!=null?Text(
                                                  '${publicProvider.productDetails!.data![0].discount??''}',
                                                  style: TextStyle(
                                                    color: Color(0xffC31A65),
                                                    fontSize: size.width * .025,
                                                  ),
                                                ):Text(''),
                                                Text(
                                                  '%OFF',
                                                  style: TextStyle(
                                                    color: Color(0xffC31A65),
                                                    fontSize: size.width * .025,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: size.width * .05),
                                        publicProvider.productDetails!=null?Row(
                                          children: [
                                            publicProvider.productDetails!.data![0].rating==1?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):publicProvider.productDetails!.data![0].rating==0.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
                                            publicProvider.productDetails!.data![0].rating==2.0?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):publicProvider.productDetails!.data![0].rating==1.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
                                            publicProvider.productDetails!.data![0].rating==3.0?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):publicProvider.productDetails!.data![0].rating==2.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
                                            publicProvider.productDetails!.data![0].rating==4.0?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):publicProvider.productDetails!.data![0].rating==3.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
                                            publicProvider.productDetails!.data![0].rating==5.0?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):publicProvider.productDetails!.data![0].rating==4.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),

                                            SizedBox(
                                              width: size.width * .02,
                                            ),
                                            Text(
                                              '${publicProvider.productDetails!.data![0].rating}',
                                              style: TextStyle(
                                                  color: ColorsVariables.textColor,
                                                  fontSize: size.width * .03,
                                                  letterSpacing: 0.3,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ],
                                        ):Container(),
                                      ],
                                    ),
                                    SizedBox(height: size.width * .03),
                                    publicProvider.productDetails!=null?Container(
                                      padding: EdgeInsets.only(
                                        right: size.width * .1,
                                      ),
                                      child:  Html(
                                        data: publicProvider.productDetails!.data![0].description??'',
                                      )
                                    ):Container(),
                                    SizedBox(height: size.width * .03),
                                    Row(
                                      children: [
                                        Text(
                                          '108 Reviews',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .03),
                                        ),
                                        SizedBox(
                                          width: size.width * .03,
                                        ),
                                        Container(
                                          height: size.width * .04,
                                          child: VerticalDivider(
                                            color: Color(0xff85848A),
                                            thickness: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .03,
                                        ),
                                        Text(
                                          '1021 Orders',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .03),
                                        ),
                                        SizedBox(
                                          width: size.width * .03,
                                        ),
                                        Container(
                                          height: size.width * .04,
                                          child: VerticalDivider(
                                            color: Color(0xff85848A),
                                            thickness: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * .03,
                                        ),
                                        Text(
                                          '2020 Wish',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .03),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFDE3EE),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(size.width * .3),
                                      bottomLeft:
                                          Radius.circular(size.width * .3),
                                    )),
                                padding: EdgeInsets.fromLTRB(
                                    size.width * .02,
                                    size.width * .01,
                                    size.width * .01,
                                    size.width * .01),
                                child: Icon(
                                  Icons.share,
                                  color: Color(0xffC31A65),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .04),
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.fromLTRB(
                          size.width * .045,
                          size.width * .015,
                          size.width * .045,
                          size.width * .015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Color, Size, Packaging',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                              Text(
                                'Grey, M, Dhaka BD',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => ProductDetailsDialog(),
                              );
                            },
                            child: Text(
                              'Select',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.pink,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .035),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .04),
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.fromLTRB(
                          size.width * .045,
                          size.width * .015,
                          size.width * .045,
                          size.width * .015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discount & Coupon',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                              Row(
                                children: [
                                  Stack(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/pink_button.png'),
                                    Positioned.fill(
                                        child: Center(
                                            child: Text(
                                      '20%off',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * .035),
                                    )))
                                  ]),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Stack(children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/pink_button.png'),
                                    Positioned.fill(
                                        child: Center(
                                            child: Text(
                                      '10%off',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * .035),
                                    )))
                                  ]),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'Get',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: Colors.pink,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .04),
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.fromLTRB(
                          size.width * .045,
                          size.width * .045,
                          size.width * .045,
                          size.width * .045),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Overview',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: Colors.pink,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),
                          ),
                          Image.asset('assets/app_icon/body_icon/next_icon.png')
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .04),
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.all(
                        size.width * .045,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Product Description: ',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),
                              ),
                              publicProvider.productDetails!=null?Expanded(
                                child: Html(
                                  data: publicProvider.productDetails!.data![0].description??'',
                                ),
                              ):Text('')
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .04),
                    // Container(
                    //   width: size.width,
                    //   color: Color(0xffF1F9F9),
                    //   padding: EdgeInsets.fromLTRB(
                    //       size.width * .045,
                    //       size.width * .045,
                    //       size.width * .045,
                    //       size.width * .045),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Frequently Bought Together',
                    //         style: TextStyle(
                    //             fontFamily: 'taviraj',
                    //             color: ColorsVariables.textColor,
                    //             fontStyle: FontStyle.normal,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: size.width * .035),
                    //       ),
                    //       SizedBox(height: size.width * .03),
                    //       Container(
                    //         height: size.width * .6,
                    //         child: ListView.separated(
                    //           separatorBuilder: (context, index) {
                    //             return SizedBox(width: size.width * .02);
                    //           },
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: 5,
                    //           itemBuilder: (context, index) {
                    //             return FeatureCategoryListTile();
                    //           },
                    //         ),
                    //       ),
                    //       Row(children: [
                    //         Image.asset(
                    //             'assets/app_icon/body_icon/pink_sign.png'),
                    //         Text(
                    //           ' This item:',
                    //           style: TextStyle(
                    //               fontFamily: 'taviraj',
                    //               color: ColorsVariables.textColor,
                    //               fontStyle: FontStyle.normal,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: size.width * .035),
                    //         ),
                    //         Text(
                    //           'Assorted Sizes, 100 ct, packaging 5tk',
                    //           style: TextStyle(
                    //               fontFamily: 'taviraj',
                    //               color: ColorsVariables.textColor,
                    //               fontSize: size.width * .035),
                    //         )
                    //       ]),
                    //       Row(children: [
                    //         Image.asset(
                    //             'assets/app_icon/body_icon/pink_sign.png'),
                    //         Text(
                    //           ' This item:',
                    //           style: TextStyle(
                    //               fontFamily: 'taviraj',
                    //               color: ColorsVariables.textColor,
                    //               fontStyle: FontStyle.normal,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: size.width * .035),
                    //         ),
                    //         Text(
                    //           'Assorted Sizes, 100 ct, packaging 5tk',
                    //           style: TextStyle(
                    //               fontFamily: 'taviraj',
                    //               color: ColorsVariables.textColor,
                    //               fontSize: size.width * .035),
                    //         )
                    //       ]),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 20, bottom: 20),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               'Total Price: ',
                    //               style: TextStyle(
                    //                   fontFamily: 'taviraj',
                    //                   color: ColorsVariables.textColor,
                    //                   fontSize: size.width * .055),
                    //             ),
                    //             Image.asset('assets/app_icon/body_icon/tk.png'),
                    //             Text(
                    //               '15',
                    //               style: TextStyle(
                    //                   fontFamily: 'taviraj',
                    //                   color: ColorsVariables.textColor,
                    //                   fontSize: size.width * .055),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Center(
                    //         child: GradientButton(
                    //           onPressed: () {},
                    //           child: Text(
                    //             'Add Both To Cart',
                    //             style: TextStyle(
                    //                 fontFamily: 'taviraj',
                    //                 fontWeight: FontWeight.bold,
                    //                 color: ColorsVariables.splashSkip,
                    //                 fontStyle: FontStyle.normal,
                    //                 fontSize: size.width * .045),
                    //           ),
                    //           borderRadius: 6.97,
                    //           height: size.width * .13,
                    //           width: size.width * .5,
                    //           gradientColors: [
                    //             Colors.pink.shade600,
                    //             Colors.pink.shade400
                    //           ],
                    //         ),
                    //       ),
                    //       SizedBox(height: size.width * .03),
                    //       Text(
                    //         'Related Product',
                    //         style: TextStyle(
                    //             fontFamily: 'taviraj',
                    //             color: ColorsVariables.textColor,
                    //             fontStyle: FontStyle.normal,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: size.width * .045),
                    //       ),
                    //       Container(
                    //         height: size.width * .6,
                    //         child: ListView.separated(
                    //           separatorBuilder: (context, index) {
                    //             return SizedBox(width: size.width * .02);
                    //           },
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: 5,
                    //           itemBuilder: (context, index) {
                    //             return FeatureCategoryListTile();
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //SizedBox(height: size.width * .04),
                    Container(
                      width: size.width,
                      height: size.width,
                      child: ListView.builder(
                          itemCount: 1,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return getReviewTemplate(context);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Related Product',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * .045),
                        ),
                      ),
                    ),
                    Container(
                      height: size.width * .6,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: size.width * .02);
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: publicProvider.relatedProducts!=null?publicProvider.relatedProducts!.data!.length:0,
                        itemBuilder: (context, index) {
                          return RelatedProductListTile(productList: publicProvider.relatedProducts!.data![index]);
                        },
                      ),
                    ),
                    SizedBox(height: size.width * .3),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.width * .25,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                      width: size.width * .2,
                      height: size.width * .2,
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                        Image.asset(
                            'assets/app_icon/app_bar_icon/cart_grey.png'),
                        Positioned(
                          right: -5,
                          top: -8,
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width * .04,
                            height: size.width * .04,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * .02),
                            ),
                          ),
                        )
                          ],
                        ),
                      )),
                  Container(
                    width: size.width * .8,
                    padding: EdgeInsets.fromLTRB(size.width * .02,
                        size.width * .05, size.width * .02, size.width * .03),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
                          child: Container(
                            width: size.width * .36,
                            height: size.width * .13,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xffA7A6A8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => OrderDetails()));
                          },
                          child: Container(
                              width: size.width * .36,
                              height: size.width * .13,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xffC31A65).withOpacity(1),
                                    Color(0xffFA4494).withOpacity(1)
                                  ]),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .04,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getReviewTemplate(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    var rating = '1.0';
    return Container(
      width: size.width,
      color: Color(0xffF1F9F9),
      padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .045,
          size.width * .045, size.width * .045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews (109)',
            style: TextStyle(
                color: Colors.black,
                fontSize: size.width * .04,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: size.width * .03),
          Row(
            children: [
              Container(
                width: size.width * .08,
                height: size.width * .08,
                child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/app_icon/body_icon/boys.png',
                    )),
              ),
              SizedBox(
                width: size.width * .02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edward willson',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * .03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '20 June, 2021',
                    style: TextStyle(
                      color: Color(0xff85848A),
                      fontSize: size.width * .02,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * .3,
              ),
              ElevatedButton(
                onPressed: () {



                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffF6DBE5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(size.width * .3),
                            side: BorderSide(
                              color: Color(0xffF6DBE5),
                            )))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Icon(Icons.thumb_up_alt_outlined,color: ColorsVariables.pinkColor,size: 15,),
                    // Image.asset(
                    //   'assets/app_icon/body_icon/thumb_up.png',
                    // ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Text(
                      'Helpful (6)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * .025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [

              rating=='1.0'?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):rating=='0.5'?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
              rating=='2.0'?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):rating=='1.5'?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
              rating=='3.0'?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):rating=='2.5'?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
              rating=='4.0'?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):rating=='3.5'?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),
              rating=='5.0'?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65)):rating=='4.5'?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65)):Icon(Icons.star_border,size: size.width * .032,),




              Text(
                '  (101)',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * .03),
              ),
            ],
          ),
          Text(
              'This is a very good gamepad for those who look for cheap and smooth gameplay.the analog buttons feel '),
          Container(
            height: size.width * .3,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                      height: size.width * .15,
                      width: size.width * .3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/app_icon/body_icon/joy_stick.png',
                          fit: BoxFit.fill,
                        ),
                      ));
                }),
          ),
          Center(
            child: GradientButton(
              onPressed: () {},
              child: Text(
                'See more',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.bold,
                    color: ColorsVariables.splashSkip,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .045),
              ),
              borderRadius: 6.97,
              height: size.width * .13,
              width: size.width * .3,
              gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
            ),
          ),
        ],
      ),
    );
  }
}
