import 'package:bafdo/colors.dart';
import 'package:bafdo/model/traditional_product_list_model.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bafdo/model/featured_categories_model.dart';
import 'package:provider/provider.dart';

class FeatureCategoryListTile extends StatefulWidget {
  TraditinalProductListDatum? productList;


  FeatureCategoryListTile({this.productList});

  @override
  _FeatureCategoryListTileState createState() =>
      _FeatureCategoryListTileState();
}

class _FeatureCategoryListTileState extends State<FeatureCategoryListTile> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductDetail(productId: widget.productList!.id!)));
        },
        child: Container(
          width: size.width * .43,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(size.width * .01),
                  child: Container(
                    // width: size.width * .4,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Stack(children: [
                      Center(
                        child: Image.network(
                          'https://bafdo.com/public/${widget.productList!.thumbnailImage??''}',
                          fit: BoxFit.fill,
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
                            color: favorite == false ? Colors.grey : Colors.pink,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/app_icon/body_icon/faster_icon.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                      ),
                      child: Text(
                        widget.productList!.name!,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width * .03),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Align(
                                      //   alignment: Alignment.topLeft,
                                      //   child: Image.asset(
                                      //     'assets/app_icon/body_icon/tk.png',
                                      //   ),
                                      // ),
                                      Text(
                                        widget.productList!.strokedPrice!,
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * .035),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .01,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Image.asset(
                                      //   'assets/app_icon/body_icon/tk_grey.png',
                                      // ),
                                      Text(
                                        widget.productList!.mainPrice!,
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: size.width * .03),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, bottom: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/app_icon/body_icon/star.png',
                                      scale: .7,
                                    ),
                                    Image.asset(
                                        'assets/app_icon/body_icon/star.png',
                                        scale: .7),
                                    Image.asset(
                                        'assets/app_icon/body_icon/star.png',
                                        scale: .7),
                                    Image.asset(
                                        'assets/app_icon/body_icon/star.png',
                                        scale: .7),
                                    Image.asset(
                                        'assets/app_icon/body_icon/star.png',
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
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            right: 5,
                            bottom: 5,
                            child: Icon(
                              Icons.add_circle_outline,
                              size: size.width * .08,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

Widget getFeatureCard(BuildContext context,Datum featuredCategories) {
  final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: ()async{
        await publicProvider.fetchFeaturedCategoriesProducts(featuredCategories.links!.products!).then((value){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                    navigateFrom: 'Feature  Categories',
                  )));
        });

      },
      child: Stack(
          children: [
        Container(
          width: size.width * .6,
          height: size.width * .3,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://bafdo.com/public/${featuredCategories.banner??''}',
                ),
                fit: BoxFit.cover
            ),
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        Positioned.fill(
          top: size.width * .1,
          child: Column(
            children: [
              Text(
                featuredCategories.name??'',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * .03),
              ),
              Text(
                '${featuredCategories.links!.products!.length}',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),
              ),
              Text(
                'Brands',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),
              ),
            ],
          ),
        )
      ]),
    ),
  );
}
