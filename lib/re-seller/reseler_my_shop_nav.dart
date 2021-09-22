import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/red_folder_list_tile.dart';
import 'package:bafdo/re-seller/collection_detaills.dart';
import '../sub_pages/new_collection_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ReselerMyShop extends StatefulWidget {
  const ReselerMyShop({Key? key}) : super(key: key);

  @override
  _ReselerMyShopState createState() => _ReselerMyShopState();
}

class _ReselerMyShopState extends State<ReselerMyShop>  with SingleTickerProviderStateMixin{
  TabController? _tabController;
  List<String> categoryList = [
    'Wife',
    'Eid',
    'For Children',
    'For Children',
  ];
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return

      Scaffold(
      backgroundColor: Color(0xffEFF9F9),

      body:SafeArea(child:Container(
        child:Column(children: [
          TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.pink,
          tabs: [
            Tab(
              text: 'My Collection',
            ),
            Tab(
              text: 'Exclusive Collection',
            ),

          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(children: [
                    Text('You have 3 Collection',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),),
                    Text('Please add the new Product in your Collection',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .035),),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Container(
                          width: size.width,
                          // height: size.width,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: size.width * .02,
                                childAspectRatio: 1.2),
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoryList.length + 1,
                            itemBuilder: (context, index) {
                              if (categoryList.length == index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.width * .13,
                                      top: size.width * .013,
                                      right: size.width * .05,
                                      left: size.width * .05),
                                  child: InkWell(
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (_) => NewCollectionDialog(),
                                      );


                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(size.width * .02),

                                       child:Center(child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [

                                           Text('Add New Collection',textAlign: TextAlign.center,),
                                           Icon(Icons.add, size: size.width * .12)

                                         ],),),



                                    ),
                                  ),
                                );
                              }

                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CollectionDetailsPage()));
                                    print(index);
                                  },
                                  child: getCollectionFolder(context, categoryList, index));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],),
                ),


 Center(
   child: Text('Sorry You Don'+'t have any curated collections now'),
 )




              ],
              controller: _tabController,
            ),),

        ],)
      ), )
      );

  }
}
