import 'package:bafdo/bottom_nav_screens/wish_list_nav.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/related_product_list_tile.dart';
import 'package:bafdo/home.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import 'package:bafdo/sub_pages/product_details_dialog.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class ProductDetail extends StatefulWidget {
  final int? productId;
  final String? featuredCatImageLink;

  ProductDetail({this.productId,this.featuredCatImageLink});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  //SharedPreferences? preferences;
  int _counter=0;
  bool thumbValue = false;
  int reviewCount=1;
  int _currentIndex = 1;
  bool wishListSelect = false;
  bool _isLoading = false;

  Future<void> fetch(PublicProvider publicProvider)async {
      setState(()=> _isLoading=true);
      await publicProvider.fetchProductDetails(widget.productId!).then((value){
        setState(()=>_isLoading=false);
      });
  }

  @override
  Widget build(BuildContext context) {
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final Size size = MediaQuery.of(context).size;
    if(_counter==0){
      setState(()=> _counter++);
      fetch(publicProvider);
      if(publicProvider.prefUserModel!=null){
        publicProvider.isProductWished(widget.productId!).then((value){
          if(publicProvider.message=='Product present in wishlist'){
            setState(()=>wishListSelect=true);
          }
        });
      }

    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CustomAppBar(
          leading: InkWell(
              onTap: ()=>Navigator.pop(context),
              child:Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
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
                                SizedBox(width: 30),
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
                            SizedBox(height: 8),
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
                                SizedBox(width: 30),
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
                            SizedBox(height: 8),
                            Divider(
                              height: 1,
                              color: Colors.grey
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
                    ///Product Image
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
                                  if(publicProvider.prefUserModel!=null){
                                    setState(()=>wishListSelect = !wishListSelect);
                                    if(wishListSelect == true){
                                      publicProvider.addWishList(widget.productId!).then((value)async{
                                        await publicProvider.fetchWishList();
                                        showToast("Added to wishlist");
                                      });
                                    }else{
                                      publicProvider.deleteWishList(widget.productId!).then((value)async{
                                        await publicProvider.fetchWishList();
                                        showToast("Removed from wishlist");
                                      });
                                    }
                                  }else showToast('Please Login First');

                                },
                                child:CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Image.asset(
                                    wishListSelect?'assets/app_icon/body_icon/pink_love.png'
                                        :'assets/app_icon/body_icon/favorite.png',
                                    fit: BoxFit.fill,
                                  ),
                                )
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
                                          'https://bafdo.com/public/${item.path}',
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ):Container(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * .02),
                    ///Product Name
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.fromLTRB(size.width * .045, 0, 0, size.width * .045),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Product name
                          Text(
                            publicProvider.productDetails!.data![0].name??'',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.bold,
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .045),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ///Price
                                    Text(
                                      '${publicProvider.productDetails!.data![0].priceHighLow??''}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontWeight:FontWeight.w500,
                                          fontSize: size.width*.04),
                                    ),
                                    SizedBox(height: size.width * .03),

                                    Row(
                                      children: [
                                        Icon(Icons.star,size: size.width * .04,color: Colors.pink),
                                        Icon(Icons.star,size: size.width * .04,color: Colors.pink),
                                        Icon(Icons.star,size: size.width * .04,color: Colors.pink),
                                        Icon(Icons.star,size: size.width * .04,color: Colors.pink),
                                        Icon(Icons.star,size: size.width * .04,color: Colors.pink),

                                        SizedBox(width: size.width * .02),
                                        Text(
                                          '${publicProvider.productDetails!.data![0].rating}',
                                          style: TextStyle(
                                              color: ColorsVariables.textColor,
                                              fontSize: size.width * .04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.width * .03),

                                    publicProvider.productDetails!=null?Container(
                                      padding: EdgeInsets.only(
                                        right: size.width * .4,
                                      ),
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Sold By:',style: TextStyle(
                                              fontFamily: 'poppins',
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .03),),
                                          Text(publicProvider.productDetails!.data![0].shopName!,style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),)
                                        ],
                                      )
                                    ):Container(),
                                    SizedBox(height: size.width * .03),
                                  ],
                                ),
                              )),

                              ///Share Logo
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

                              // Text(
                              //   'Grey, M, Dhaka BD',
                              //   style: TextStyle(
                              //       fontFamily: 'poppins',
                              //       color: Colors.grey,
                              //       fontStyle: FontStyle.normal,
                              //       fontSize: size.width * .04),
                              // )
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

                    ///Description
                    Container(
                      width: size.width,
                      color: Color(0xffF1F9F9),
                      padding: EdgeInsets.all(
                        size.width * .045,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description:',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width*.04,
                            fontFamily:'taviraj'
                          )),
                          Html(
                            data: publicProvider.productDetails!.data![0].description??'',
                          ),
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
                    ListView.builder(
                        itemCount: publicProvider.reviews==null?0:publicProvider.reviews!.data!.length==0?0:reviewCount,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return getReviewTemplate(context,publicProvider,index);
                        }),
                    SizedBox(height: size.width * .02),
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
                          return SizedBox(width: size.width * .04);
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

          ///Bottom Button Section
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
                        child: GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CartPage())),
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
                              child:Text(
                                '${publicProvider.carts!=null
                                    ? publicProvider.carts!.isNotEmpty
                                    ?publicProvider.carts![0].cartItems!.length:'0':'0'}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * .02),
                              ),
                            ),
                          )
                            ],
                          ),
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
                            if(publicProvider.prefUserModel!=null){
                              showLoadingDialog(context);
                              publicProvider.addCart(widget.productId!, 1).then((value)async{
                                if(value){
                                  await publicProvider.fetchCartList();
                                  closeLoadingDialog(context);
                                  showToast('Product added to cart');
                                }else{
                                  closeLoadingDialog(context);
                                  showToast('Stock out');
                                }
                              });
                            }else showToast('Please Login First');

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
                                    builder: (context) => CartPage()));
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

  Widget getReviewTemplate(BuildContext context,PublicProvider publicProvider,int index) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Color(0xffF1F9F9),
      padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .045,
          size.width * .045, size.width * .045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews (${publicProvider.reviews!.data!.length})',
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
                child: publicProvider.reviews!.data![index].avatar==''?CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/app_icon/body_icon/priyo_male.png',
                    )):CircleAvatar(
                    backgroundImage: NetworkImage(
                      publicProvider.reviews!.data![index].avatar!,
                    )),
              ),
              SizedBox(
                width: size.width * .02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    publicProvider.reviews!.data![index].userName!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * .03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    publicProvider.reviews!.data![index].time!,
                    style: TextStyle(
                      color: Color(0xff85848A),
                      fontSize: size.width * .02,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: size.width * .3,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //
              //   },
              //   style: ButtonStyle(
              //       elevation: MaterialStateProperty.all<double>(0),
              //       backgroundColor:
              //       MaterialStateProperty.all<Color>(Color(0xffF6DBE5)),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(size.width * .3),
              //               side: BorderSide(
              //                 color: Color(0xffF6DBE5),
              //               )))),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //
              //       Icon(Icons.thumb_up_alt_outlined,color: ColorsVariables.pinkColor,size: 15,),
              //       // Image.asset(
              //       //   'assets/app_icon/body_icon/thumb_up.png',
              //       // ),
              //       SizedBox(
              //         width: size.width * .01,
              //       ),
              //       Text(
              //         'Helpful (6)',
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: size.width * .025,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: size.width * .01,
          ),
          Row(
            children: [

              publicProvider.reviews!.data![index].rating==1?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==2?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==3?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==0.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))                                                :Icon(Icons.star_border,size: size.width * .032,),
              publicProvider.reviews!.data![index].rating==2?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==3?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==1.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :Icon(Icons.star_border,size: size.width * .032,),
              publicProvider.reviews!.data![index].rating==3?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==2.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :Icon(Icons.star_border,size: size.width * .032,),
              publicProvider.reviews!.data![index].rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==3.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :Icon(Icons.star_border,size: size.width * .032,),
              publicProvider.reviews!.data![index].rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                  :publicProvider.reviews!.data![index].rating==4.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                  :Icon(Icons.star_border,size: size.width * .032,),




              // Text(
              //   '  (101)',
              //   style: TextStyle(
              //       fontFamily: 'taviraj',
              //       color: Colors.grey,
              //       fontStyle: FontStyle.normal,
              //       fontWeight: FontWeight.bold,
              //       fontSize: size.width * .03),
              // ),
            ],
          ),
          SizedBox(
            height: size.width * .02,
          ),
          Text(
              publicProvider.reviews!.data![index].comment!),
          // Container(
          //   height: size.width * .3,
          //   width: size.width,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 6,
          //       itemBuilder: (context, index) {
          //         return Container(
          //             height: size.width * .15,
          //             width: size.width * .3,
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Image.asset(
          //                 'assets/app_icon/body_icon/joy_stick.png',
          //                 fit: BoxFit.fill,
          //               ),
          //             ));
          //       }),
          // ),
          reviewCount!=publicProvider.reviews!.data!.length?Center(
            child: GradientButton(
              onPressed: () {
                setState(() {
                  reviewCount=publicProvider.reviews!.data!.length;
                });
              },
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
          ):Container(),
        ],
      ),
    );
  }
}
