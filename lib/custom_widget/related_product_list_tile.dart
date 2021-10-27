import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/model/anniversary_product_list_model.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/product_page.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bafdo/model/related_product_model.dart';
import 'package:provider/provider.dart';

class RelatedProductListTile extends StatefulWidget {
  final Datum? productList;
  RelatedProductListTile({this.productList});

  @override
  _RelatedProductListTileState createState() =>
      _RelatedProductListTileState();
}

class _RelatedProductListTileState extends State<RelatedProductListTile> {
  bool favorite = false;
  int _counter=0;

  @override
  Widget build(BuildContext context) {
    final PublicProvider publicProvider=Provider.of<PublicProvider>(context);
    final Size size = MediaQuery.of(context).size;
    if (_counter == 0) {
      setState(()=>_counter++);
      if(publicProvider.prefUserModel!=null){
        publicProvider.isProductWished(widget.productList!.id!).then((value) {
          if (publicProvider.message == 'Product present in wishlist') {
            setState(()=>favorite = true);
          }
        });
      }
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(productId: widget.productList!.id!)));
      },
      child: Container(
        width: size.width * .38,
        margin: EdgeInsets.symmetric(vertical: 1.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(size.width * .04)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2.0,
                  offset: Offset(0,0.5)
              )
            ]
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Image Container
                Expanded(
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.all(size.width * .01),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * .04))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: CachedNetworkImage(
                        imageUrl:
                        'https://bafdo.com/public/${widget.productList!.thumbnailImage ?? ''}',
                        placeholder: (context, url) =>
                            CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                ///Faster Image
                Image.asset('assets/app_icon/body_icon/faster_icon.png'),

                ///Product Name
                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: Text(
                    widget.productList!.name!,
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .032),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: Row(
                    children: [
                      Text(
                        widget.productList!.mainPrice!.toString().replaceAll('.00', ''),
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .035),
                      ),
                      SizedBox(width: size.width * .01),
                      Text(
                        widget.productList!.strokedPrice!.toString().replaceAll('৳', '').replaceAll('.00', ''),
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            fontSize: size.width * .03),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: _starBuilder(widget.productList!.rating!, size),
                ),
                SizedBox(height: size.width * .03)
              ],
            ),

            ///Add Cart
            Positioned(
                right: size.width*.025,
                bottom: size.width*.025,
                child: InkWell(
                  onTap: () {
                    if(publicProvider.prefUserModel!=null){
                      showLoadingDialog(context);
                      publicProvider
                          .addCart(widget.productList!.id!, 1)
                          .then((value) async {
                        await publicProvider.fetchCartList();
                        closeLoadingDialog(context);
                        showToast('Product added to cart');
                      });
                    }else showToast('Please Login First');
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    size: size.width * .08,
                  ),
                )),

            ///Wishlist
            Positioned(
              right: size.width*.03,
              top: size.width*.03,
              child: InkWell(
                onTap: () {
                  if (publicProvider.prefUserModel != null) {
                    setState(() {
                      favorite = !favorite;
                    });
                    if (favorite == true) {
                      publicProvider
                          .addWishList(widget.productList!.id!)
                          .then((value) async {
                        await publicProvider.fetchWishList();
                        showToast("Added to wishlist");
                      });
                    } else {
                      publicProvider
                          .deleteWishList(widget.productList!.id!)
                          .then((value) async {
                        await publicProvider.fetchWishList();
                        showToast("Removed from wishlist");
                      });
                    }
                  } else {
                    showToast("Please Login First");
                  }
                },
                child: Image.asset(
                  'assets/app_icon/body_icon/favorite.png',
                  color: favorite == false ? Colors.grey : Colors.pink,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _starBuilder(int? rating, Size size) {
    if (rating == 1)
      return Icon(Icons.star, color: Colors.pink, size: size.width * .04);
    if (rating == 2)
      return Row(
        children: [
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04)
        ],
      );
    if (rating == 3)
      return Row(
        children: [
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04)
        ],
      );
    if (rating == 4)
      return Row(
        children: [
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04)
        ],
      );
    if (rating == 5)
      return Row(
        children: [
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04),
          Icon(Icons.star, color: Colors.pink, size: size.width * .04)
        ],
      );
    else return Container();
  }
}

class OfferListTile extends StatefulWidget {
  const OfferListTile({Key? key}) : super(key: key);

  @override
  _OfferListTileState createState() => _OfferListTileState();
}

class _OfferListTileState extends State<OfferListTile> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width * .4,
                height: size.height * .15,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Stack(children: [
                  Center(
                    child: Container(
                      height: size.width * .15,
                      width: size.width * .15,
                      child: Image.asset(
                        'assets/app_icon/body_icon/joy_stick.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: 70,
                          width: 80,
                          child: Image.asset(
                            'assets/app_icon/body_icon/offer_banner_icon.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                            child: Center(
                                child: Text(
                                  "    30% \n     off",
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .03),
                                )))
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: Image.asset(
                        'assets/app_icon/body_icon/favorite.png',
                        color: favorite == true ? Colors.pink : Colors.grey,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: Text(
                'Game controller gami...',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * .03),
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/app_icon/body_icon/tk.png',
                                ),
                                Text(
                                  '15',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/app_icon/body_icon/tk_grey.png',
                                ),
                                Text(
                                  '18',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: size.width * .04),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/app_icon/body_icon/star.png',
                              scale: .7,
                            ),
                            Image.asset('assets/app_icon/body_icon/star.png',
                                scale: .7),
                            Image.asset('assets/app_icon/body_icon/star.png',
                                scale: .7),
                            Image.asset('assets/app_icon/body_icon/star.png',
                                scale: .7),
                            Image.asset('assets/app_icon/body_icon/star.png',
                                scale: .7),
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
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: size.width * .04,
                  right: size.width * .02,
                  child: Icon(
                    Icons.add_circle_outline,
                    size: size.width * .08,
                  ))
            ]),
          ],
        ),
      ),
    );
  }
}

Widget getFavoriteOfferCard(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: size.width * .18,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: Image.asset(
                    'assets/app_icon/body_icon/traditional_product.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  'Helmet',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * .03),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
