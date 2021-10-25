import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';

import 'package:bafdo/seller_collection/seller_order.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> with TickerProviderStateMixin{

  List<Color> gradientColors = [
    const Color(0xffff44cc),
    const Color(0xffff44cc),
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedAnalytic='';

  bool showAvg = false;


  String drawerClick = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsVariables.backgrowndColor,
      key: _scaffoldKey,
      drawer: Drawer(


        child:  DrawerTiles()
      ),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child:
              Image.asset('assets/app_icon/app_bar_icon/menu.png',)),
          trailing1: Container(

height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/app_icon/text_field_icon/search_icon.png',),

                fit: BoxFit.fill,
              ),


            ),),
          trailing2: Container(),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Dashboard',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .05),),
          ),
        ),
      ),


      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.width*.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/app_icon/body_icon/tk.png',),
                  Text('5,000,00.00',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w600,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .06),)
                ],),
              Text('2020 Yearly income',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Analytics',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .05),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              _selectedAnalytic = 'All Time';
                            });

                          },
                          child: Container(

                            decoration: BoxDecoration(
                                color:  _selectedAnalytic=='All Time'?Colors.pink:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(6),


                                )

                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                              child: Text('All Time',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedAnalytic=='All Time'?Colors.white:Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03),),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _selectedAnalytic = 'Today';
                            });

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:  _selectedAnalytic=='Today'?Colors.pink:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(6),


                                )

                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                              child: Text('Today',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedAnalytic=='Today'?Colors.white:Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03),),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _selectedAnalytic = 'Weekly';
                            });

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:  _selectedAnalytic=='Weekly'?Colors.pink:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(6),


                                )

                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                              child: Text('Weekly',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedAnalytic=='Weekly'?Colors.white:Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03),),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _selectedAnalytic = 'Monthly';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:  _selectedAnalytic=='Monthly'?Colors.pink:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(6),


                                )

                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                              child: Text('Monthly',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedAnalytic=='Monthly'?Colors.white:Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03),),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _selectedAnalytic = 'Yearly';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:  _selectedAnalytic=='Yearly'?Colors.pink:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(6),


                                )

                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                              child: Text('Yearly',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: _selectedAnalytic=='Yearly'?Colors.white:Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(children: [
                      Text('Total Earning',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .05),),
                      Text('Statistic for all time',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .03),),
                    ],),
                    Row(children: [
                      Image.asset('assets/app_icon/body_icon/tk.png',),
                      Text('20,000,00',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),),

                    ],)
                  ],),
              ),

              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(

                      child: LineChart(
                        showAvg ? avgData() : mainData(),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width*.02,
                  //   height: size.width*.02,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         showAvg = !showAvg;
                  //       });
                  //     },
                  //     child: Text(
                  //       'avg',
                  //       style: TextStyle(
                  //           fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/app_icon/body_icon/tk.png',),
                  Text('1,000,00.00',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w600,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .06),)
                ],),
              Text('2020 Average Monthly income',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),),

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
                    Text('See More',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),),


                  ],),
              ),

              Container(
                height: size.width*.85,
                width: size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerOrder()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: size.width * .2,
                                  width: size.width * .2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),


                                    color: Colors.grey.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/joy_stick.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gaming Controller for PC",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04),
                                    ),
                                    Text(
                                      "Brand: Xiaomi",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04),
                                    ),
                                    Row(
                                      children: [

                                        Image.asset(
                                            'assets/app_icon/body_icon/tk.png'),
                                        Text(
                                          "20.99",
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),
                                        ),
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
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Best Selling',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),),
                        Text('Selected by Orders',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),),
                      ],
                    ),
                    Text('See More',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),),


                  ],),
              ),

              Container(
                height: size.width*.85,
                width: size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.width * .2,
                                width: size.width * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),


                                  color: Colors.grey.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/app_icon/body_icon/joy_stick.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gaming Controller for PC",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                  Text(
                                    "Brand: Xiaomi",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total: ",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .04),
                                      ),
                                      Image.asset(
                                          'assets/app_icon/body_icon/tk.png'),
                                      Text(
                                        "20.000.99",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .04),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),



              Center(child: Text('Seller Home Nav')),
            ],
          ),
        ),

      ),

    );
  }
  LineChartData mainData() {
    Size size = MediaQuery.of(context).size;
    return LineChartData(

      lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.white,
              tooltipRoundedRadius:  8,
              getTooltipItems: defaultLineTooltipItem
          )
      ),

      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color:  Colors.grey,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color:  Colors.grey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),

        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
              TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .03),

          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Jan';
              case 1:
                return 'Feb';
              case 2:
                return 'Mar';
              case 3:
                return 'Apr';
              case 4:
                return 'May';
              case 5:
                return 'Jun';
              case 6:
                return 'Jul';
              case 7:
                return 'Aug';
              case 8:
                return 'Sep';
              case 9:
                return 'Oct';
              case 10:
                return 'Nov';
              case 11:
                return 'Dec';

            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(showTitles: false),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color:  Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),

      ],




    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Jan';
              case 1:
                return 'Feb';
              case 2:
                return 'Mar';
              case 3:
                return 'Apr';
              case 4:
                return 'May';
              case 5:
                return 'Jun';
              case 6:
                return 'Jul';
              case 7:
                return 'Aug';
              case 8:
                return 'Sep';
              case 9:
                return 'Oct';
              case 10:
                return 'Nov';
              case 11:
                return 'Dec';

            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
