import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/sub_pages/recently_views.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/notification_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final String? url;
  CategoryPage({required this.url});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController _searchController = TextEditingController();
   int _listIndex=0;
   int _counter=0;
   bool _loading=true;
   bool _loading2=true;

  Future<void> _customInit(PublicProvider publicProvider)async{
    setState(()=> _counter++);
    print(widget.url);
    await publicProvider.getSubCategories(widget.url!).then((value)async{
      if(publicProvider.subCategories!.data!.isNotEmpty){
        await publicProvider.getChildSubCategories(publicProvider.subCategories!.data![0].links!.subCategories!);
        setState(() {
          _loading=false;
          _loading2=false;
        });
      }else{
        _loading=false;
        _loading2=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if(_counter==0) _customInit(publicProvider);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * .2),
        child: CustomAppBar(
          leading: InkWell(
              onTap: ()=> Navigator.pop(context),
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: Text(
            'Categories',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: size.width * .06),
          ),
          trailing1: InkWell(
              onTap: () {
                Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (_) => RecentlyViews()));
              },
              child: Image.asset('assets/app_icon/app_bar_icon/close.png')),
          trailing2: Container(),
        ),
      ),

      body: !_loading
          ?publicProvider.subCategories!.data!.isNotEmpty
          ? Column(
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

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///Sidebar
                Container(
                    width: size.width * .25,
                    color: Colors.white,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: publicProvider.subCategories!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Stack(
                                alignment:Alignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async{
                                      setState(()=>_listIndex = index);
                                      setState(()=>_loading2=true);
                                      await publicProvider.getChildSubCategories(publicProvider.subCategories!.data![index].links!.subCategories!);
                                      setState(()=>_loading2=false);
                                    },
                                    child: Container(
                                      color:Colors.white,
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: size.width * .03),
                                            Container(
                                              height: size.width * .09,
                                              width: size.width * .09,
                                              child: publicProvider.subCategories!.data![index].banner!.isNotEmpty?
                                              Image.network(
                                                'https://bafdo.com/public/${publicProvider.subCategories!.data![index].banner}',
                                                fit: BoxFit.fill)
                                                  :Image.asset('assets/app_icon/body_icon/favorite.png', fit: BoxFit.fill),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.width*.02),
                                              child: Text(
                                                  '${publicProvider.subCategories!.data![index].name}',
                                                  textAlign:TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'taviraj',
                                                      color:
                                                          _listIndex == index
                                                              ? Colors.pink
                                                              : Colors.grey,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize:
                                                          size.width * .035)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right:0.0,
                                    child: Visibility(
                                      visible: _listIndex == index,
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/virtical_indicator.png'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.width * .03)
                            ],
                          );
                        })),

                ///Subcategory Content
                Container(
                    width: size.width * .7,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Your Favorite',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * .045)),
                          ),
                          !_loading2
                              ?GridView.builder(
                            itemCount: publicProvider.childSubCategories!.data!.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                              return getFavoriteOfferCard(context,publicProvider.childSubCategories!.data![index]);
                            },
                          ):LinearProgressIndicator(),

                          // Padding(
                          //   padding: EdgeInsets.only(left: 10),
                          //   child: Text('Special Events',
                          //       style: TextStyle(
                          //           fontFamily: 'taviraj',
                          //           color: ColorsVariables.textColor,
                          //           fontStyle: FontStyle.normal,
                          //           fontWeight: FontWeight.w500,
                          //           fontSize: size.width * .045)),
                          // ),
                          // GridView.builder(
                          //   itemCount: 8,
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 2,
                          //   ),
                          //   physics: NeverScrollableScrollPhysics(),
                          //   shrinkWrap: true,
                          //   itemBuilder: (context, index) {
                          //     return getFavoriteOfferCard(context);
                          //   },
                          // ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      )
          : Center(child: Text('No Subcategories found !',
          style:TextStyle(
              fontFamily: 'taviraj',
              color: ColorsVariables.textColor,
              fontWeight: FontWeight.w500,
              fontSize: size.width*.045)))
          :showLoadingWidget,
    );
  }
}
