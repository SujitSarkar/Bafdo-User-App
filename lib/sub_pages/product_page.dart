import 'dart:async';
import 'package:bafdo/custom_widget/home_product_tile.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/category_products_list_tile.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/custom_widget/flash_deal_count_down_widget.dart';
import 'package:bafdo/custom_widget/flash_deal_product_list_tile.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_search_filtered_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final String? navigateFrom;
  final String? featuredCatImageLink;
  ProductPage({required this.navigateFrom,this.featuredCatImageLink});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  bool _isLoading=false;
  int _counter=0;

  Widget _timeContainer(String time,Size size)=>Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 3,vertical: 1),
    decoration: new BoxDecoration(
        gradient: LinearGradient(
            colors: [
              BColors.primaryPink,
              BColors.primaryLitePink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
        borderRadius: new BorderRadius.circular(5.0)),
    child: Text(
      time.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'poppins',
          color: Colors.white,
          fontSize: size.width * .035),
    ),
  );

  _customInit(PublicProvider publicProvider)async{
    setState(()=> _counter++);
    if(widget.featuredCatImageLink!=null){
      setState(()=> _isLoading=true);
      await publicProvider.fetchFeaturedCategoriesProducts(widget.featuredCatImageLink!).then((value){
        setState(()=>_isLoading=false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if(_counter==0) _customInit(publicProvider);

    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: ()=> Navigator.pop(context),
              child: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: widget.navigateFrom == 'Flash Deal'
              ? StreamBuilder(
                stream: Stream.periodic(Duration(seconds: 1), (i) => i),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                  int remainingSec,day,hours,minute,second;
                  remainingSec = DateTime.fromMillisecondsSinceEpoch(publicProvider.flashDealProducts!.data!.endDate!*1000).difference(DateTime.now()).inSeconds;
                  day = remainingSec~/(24*3600);
                  remainingSec = remainingSec%(24*3600);
                  hours= remainingSec~/3600;
                  remainingSec%=3600;
                  minute=remainingSec~/60;
                  remainingSec%=60;
                  second = remainingSec;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/app_icon/body_icon/flash_deal_icon.png'
                      ),
                      Text(
                        ' Flash Deal ',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                      _timeContainer(day.toString(), size),
                      Text(':'),
                      _timeContainer(hours.toString(), size),
                      Text(':'),
                      _timeContainer(minute.toString(), size),
                      Text(':'),
                      _timeContainer(second.toString(), size),
                    ],
                  );
                }
              )
              : Text(widget.navigateFrom.toString(),
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04)),
          trailing1: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => ProductSearchFilteredDialog(),
                );
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/filter_icon.png')),
          trailing2: Container(),
        ),
      ),
      body: _isLoading
          ? new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                  'assets/app_icon/body_icon/loading_icon.png');
            },
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ) :
      _pages(context),
    );
  }

  Widget _pages(BuildContext context) {
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*.02),
      child:widget.navigateFrom == 'Hand Picked'? new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.handPickedProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryProductListTile(productList: publicProvider.handPickedProducts!.data![index]);
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
        mainAxisSpacing: size.width*.03,
        crossAxisSpacing: size.width*.03,
      ):widget.navigateFrom == 'Flash Deal'? StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.flashDealProducts!.data!.products!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return
            FlashDealProductListTile(productList: publicProvider.flashDealProducts!.data!.products!.data![index]);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
        mainAxisSpacing: size.width*.03,
        crossAxisSpacing: size.width*.03,
      ):widget.navigateFrom == 'Daily Featured'?
      StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.dailyFeaturedProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryProductListTile(productList: publicProvider.dailyFeaturedProducts!.data![index]);

        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
        mainAxisSpacing: size.width*.03,
        crossAxisSpacing: size.width*.03,
      ):widget.navigateFrom == 'Feature Categories'?
      StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.featuredCategoriesProducts==null?0:publicProvider.featuredCategoriesProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return FeatureCategoryListTile(productList: publicProvider.featuredCategoriesProducts!.data![index],);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
        mainAxisSpacing: size.width*.03,
        crossAxisSpacing: size.width*.03,
      ):widget.navigateFrom == 'May You Like'?
      StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.homeProducts==null?0:publicProvider.homeProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return HomeProductListTile(productList: publicProvider.homeProducts!.data![index],);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
        mainAxisSpacing: size.width*.03,
        crossAxisSpacing: size.width*.03,
      ) :StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.traditionalCategoriesProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return  FeatureCategoryListTile(productList: publicProvider.traditionalCategoriesProducts!.data![index],);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
        mainAxisSpacing: size.width*.03,
        crossAxisSpacing: size.width*.03,
      ),
    );
  }
}
