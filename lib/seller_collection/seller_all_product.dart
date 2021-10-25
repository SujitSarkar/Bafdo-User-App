import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:flutter/material.dart';

class SellerAllProduct extends StatefulWidget {
  @override
  _SellerAllProductState createState() => _SellerAllProductState();
}

class _SellerAllProductState extends State<SellerAllProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(   backgroundColor: ColorsVariables.backgrowndColor,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
              Image.asset('assets/app_icon/app_bar_icon/menu.png',)),
          trailing1: Container(),
          trailing2: Container(),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('All Products',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .05),),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recently Added',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),),
                      InkWell(
                        onTap: (){

                        },
                        child: Text('See More',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.width*1.1 ,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1.8 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: 4,
                      itemBuilder: (BuildContext ctx, index) {
                        return OfferListTile();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Favourites',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),),
                      InkWell(
                        onTap: (){

                        },
                        child: Text('See More',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.width*1.1 ,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1.8 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: 4,
                      itemBuilder: (BuildContext ctx, index) {
                        return OfferListTile();
                      }),
                ),
                Center(child: Text('Seller All Product')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
