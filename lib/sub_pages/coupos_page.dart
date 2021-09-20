import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/coupons_list_tile.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  _CouponsPageState createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  double _animatedHeight = 100.0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  String insideTab = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Stack(
              //  clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: size.width * .05,
                    child: Image.asset(
                      'assets/app_icon/body_icon/cart.png',
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * .04,
                    height: size.width * .04,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * .02),
                    ),
                  ),
                )
              ],
            ),
          ),
          trailing2: Container(),
          title: Text(
            'My Coupons',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: size.width * .05),
          ),
        ),
      ),
      backgroundColor: Color(0xffEFF9F9),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TabBar(
                  controller: _tabController,
                  automaticIndicatorColorAdjustment: true,
                  labelColor: Colors.pink,
                  labelStyle: TextStyle(
                      fontFamily: 'taviraj',
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * .035),
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'All (25)',
                    ),
                    Tab(
                      text: 'Coupons (15) ',
                    ),
                    Tab(
                      text: 'Discount task (10)',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Available';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Available'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Available',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Available'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Used';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Used'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Used',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Used'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Expired';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Expired'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Expired',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Expired'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 13,
                            itemBuilder: (context, index) {
                              return CouponsListTile();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // second tab bar view widget
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Available';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Available'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Available',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Available'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Used';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Used'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Used',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Used'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Expired';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Expired'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Expired',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Expired'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 13,
                            itemBuilder: (context, index) {
                              return CouponsListTile();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Available';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Available'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Available',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Available'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Used';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Used'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Used',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Used'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    insideTab = 'Expired';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: insideTab == 'Expired'
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Text(
                                        'Expired',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: insideTab == 'Expired'
                                                ? Colors.white
                                                : Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 13,
                            itemBuilder: (context, index) {
                              return CouponsListTile();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
