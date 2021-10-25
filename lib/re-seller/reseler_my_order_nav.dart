import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/red_folder_list_tile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ReselerMyOrder extends StatefulWidget {
  const ReselerMyOrder({Key? key}) : super(key: key);

  @override
  _ReselerMyOrderState createState() => _ReselerMyOrderState();
}

class _ReselerMyOrderState extends State<ReselerMyOrder> with SingleTickerProviderStateMixin{
  TextEditingController _searchController = TextEditingController();

  TabController? _tabController;
  List<String> categoryList = [
    'Wife',
    'Eid',
    'For Children',
    'For Children',
  ];
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {  Size size = MediaQuery.of(context).size;
    return Scaffold(
            backgroundColor: Color(0xffEFF9F9),

      body: SafeArea(child:  Container(

          child: Column(children: [


            Material(color: Colors.pink.shade100,
              child:    TabBar(

                unselectedLabelColor: Colors.black,
                labelColor: Colors.pink,
                tabs: [
                  Tab(
                    text: 'ACTIVE',
                  ),
                  Tab(
                    text: 'COMPLETE',
                  ),
                  Tab(
                    text: 'CANCELLED',
                  ),

                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [


                  Column(children: [

                    Container(
                      width: size.width,
                      color: Colors.pink.shade100,
                      child:     Padding(
                          padding: EdgeInsets.all(size.width * .03,),
                          child: Container(
                            width: size.width * .8,

                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(padding:EdgeInsets.only(left:size.width * .03,right:size.width * .03, ),
                          child:  TextFormField(

                            controller: _searchController,
                            decoration: InputDecoration(
                                hintText: 'Search product',
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                                suffixIcon: Image.asset(
                                  'assets/app_icon/text_field_icon/search_icon.png',
                                ),
                                enabled: true,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                            cursorColor: Color(0xff131214),
                          ),
                          ) ,


                          )),
                    ),


                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(child:   Container(
                          width: size.width*.4,
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          child: Center(
                            child:Padding(padding:EdgeInsets.only(top:size.width * .01,bottom:size.width * .01,),

                            child:  Text('Sort',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .035),) ,) ,

                          ) ,
                        ),),

                     Expanded(child:  Container( decoration: BoxDecoration(border: Border.all(width: 1)), width: size.width*.4,
                         child: Center(
                           child: Padding(padding:EdgeInsets.only(top:size.width * .01,bottom:size.width * .01,),
                             child:  Text('Filtered',
                               style: TextStyle(
                                   fontFamily: 'taviraj',
                                   color: ColorsVariables.textColor,
                                   fontStyle: FontStyle.normal,
                                   fontSize: size.width * .035),),),
                           )
                     ))

                    ],)

                  ],),


                  Column(children: [

                    Container(
                      width: size.width,
                      color: Colors.pink.shade100,
                      child:     Padding(
                          padding: EdgeInsets.all(size.width * .03,),
                          child: Container(
                            width: size.width * .8,

                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(padding:EdgeInsets.only(left:size.width * .03,right:size.width * .03, ),
                              child:  TextFormField(

                                controller: _searchController,
                                decoration: InputDecoration(
                                    hintText: 'Search product',
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                    suffixIcon: Image.asset(
                                      'assets/app_icon/text_field_icon/search_icon.png',
                                    ),
                                    enabled: true,
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                                cursorColor: Color(0xff131214),
                              ),
                            ) ,


                          )),
                    ),


                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(child:   Container(
                          width: size.width*.4,
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          child: Center(
                            child:Padding(padding:EdgeInsets.only(top:size.width * .01,bottom:size.width * .01,),

                              child:  Text('Sort',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),) ,) ,

                          ) ,
                        ),),

                        Expanded(child:  Container( decoration: BoxDecoration(border: Border.all(width: 1)), width: size.width*.4,
                            child: Center(
                              child: Padding(padding:EdgeInsets.only(top:size.width * .01,bottom:size.width * .01,),
                                child:  Text('Filtered',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .035),),),
                            )
                        ))

                      ],)

                  ],),
                  Column(children: [

                    Container(
                      width: size.width,
                      color: Colors.pink.shade100,
                      child:     Padding(
                          padding: EdgeInsets.all(size.width * .03,),
                          child: Container(
                            width: size.width * .8,

                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(padding:EdgeInsets.only(left:size.width * .03,right:size.width * .03, ),
                              child:  TextFormField(

                                controller: _searchController,
                                decoration: InputDecoration(
                                    hintText: 'Search product',
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                    suffixIcon: Image.asset(
                                      'assets/app_icon/text_field_icon/search_icon.png',
                                    ),
                                    enabled: true,
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                                cursorColor: Color(0xff131214),
                              ),
                            ) ,


                          )),
                    ),


                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(child:   Container(
                          width: size.width*.4,
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          child: Center(
                            child:Padding(padding:EdgeInsets.only(top:size.width * .01,bottom:size.width * .01,),

                              child:  Text('Sort',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),) ,) ,

                          ) ,
                        ),),

                        Expanded(child:  Container( decoration: BoxDecoration(border: Border.all(width: 1)), width: size.width*.4,
                            child: Center(
                              child: Padding(padding:EdgeInsets.only(top:size.width * .01,bottom:size.width * .01,),
                                child:  Text('Filtered',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .035),),),
                            )
                        ))

                      ],)

                  ],),




                ],
                controller: _tabController,
              ),),

          ],)
      ),
        ),


    );
  }
}
