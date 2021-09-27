import 'dart:async';
import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/category_products_list_tile.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_search_filtered_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final String? navigateFrom;
  ProductPage({required this.navigateFrom});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  Timer? _timer;
  int seconds = 0;

  String? endingHours = '00';
  String? endingMinute = '00';

  String? endingSecond = '00';

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (seconds > 3) {
            timer.cancel();
          } else {
            if (seconds < 4) {
              setState(() {
                seconds = seconds + 1;
              });
            }

            // if (seconds == 0) {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => LoginWithNumber()));
            // }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: widget.navigateFrom == 'Flash Deal'
              ? Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Image.asset(
                        'assets/app_icon/body_icon/flash_deal_icon.png',
                      ),
                      Text(
                        'Flash Deal ',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                      Container(
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
                          endingSecond!,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        )),
                      ),
                      Text(' : '),
                      Container(
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
                          endingSecond!,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        )),
                      ),
                      Text(' : '),
                      Container(
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
                          endingSecond!,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        )),
                      ),
                    ],
                  ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                          'Boi mela',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                          'Controller',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                          'Bijoy Mela',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                          'Gaming Controller',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Divider(
                height: 4,
                color: Colors.grey,
              ),
            ),
            seconds < 3
                ? Container(
                    height: 500,
                    width: size.width,
                    child: new StaggeredGridView.countBuilder(
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
                    ),
                  )
                : _pages(context)
          ],
        ),
      ),
    );
  }

  Widget _pages(BuildContext context) {
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .8,
      width: size.width,
      child:widget.navigateFrom == 'Hand Picked'? new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.handPickedProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryProductListTile(productList: publicProvider.handPickedProducts!.data![index]);
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ):widget.navigateFrom == 'Flash Deal'? StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.flashDealProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return
            CategoryProductListTile(productList: publicProvider.flashDealProducts!.data![index]);

        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ):widget.navigateFrom == 'Daily Featured'?
      StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.dailyFeaturedProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryProductListTile(productList: publicProvider.dailyFeaturedProducts!.data![index]);

        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ):widget.navigateFrom == 'Feature  Categories'?
      StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.featuredCategoriesProducts==null?0:publicProvider.featuredCategoriesProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return
            FeatureCategoryListTile(productList: publicProvider.featuredCategoriesProducts!.data![index],);

        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ):StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: publicProvider.traditionalCategoriesProducts!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return  FeatureCategoryListTile(productList: publicProvider.traditionalCategoriesProducts!.data![index],);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
