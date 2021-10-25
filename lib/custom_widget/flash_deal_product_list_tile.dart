import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/model/flash_deal_product_model.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashDealProductListTile extends StatefulWidget {
  final FlashDealDatum? productList;
  FlashDealProductListTile({this.productList});

  @override
  _FlashDealProductListTileState createState() =>
      _FlashDealProductListTileState();
}

class _FlashDealProductListTileState extends State<FlashDealProductListTile> {
  bool favorite = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final PublicProvider publicProvider =
        Provider.of<PublicProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    if (_counter == 0) {
      setState(() {
        _counter++;
      });
      publicProvider.isProductWished(widget.productList!.id!).then((value) {
        if (publicProvider.message == 'Product present in wishlist') {
          setState(() {
            favorite = true;
          });
        }
      });
    }
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetail(productId: widget.productList!.id!)));
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
                            'https://bafdo.com/public/${widget.productList!.thumbnailImage}',
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
                        '৳ ${widget.productList!.baseDiscountedPrice!.toString().replaceAll('.00','')}',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .035),
                      ),
                      SizedBox(width: size.width * .01),
                      Text(
                        widget.productList!.basePrice!.toString().replaceAll('.00', ''),
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
                    showLoadingDialog(context);
                    publicProvider
                        .addCart(widget.productList!.id!, 1)
                        .then((value) async {
                      await publicProvider.fetchCartList();
                      closeLoadingDialog(context);
                      showToast('Product added to cart');
                    });
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
                  print(publicProvider.prefUserModel.id);
                  if (publicProvider.prefUserModel.id != null) {
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
                    showToast("Please log in first");
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
    else
      return Container();
  }
}
