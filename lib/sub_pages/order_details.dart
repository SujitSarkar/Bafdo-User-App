import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  final String link;
  const OrderDetails({Key? key,required this.link}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double _animatedHeight = 150.0;
  int _counter=0;
  bool _isLoading=true;

  Future<void> _customInit(PublicProvider publicProvider)async{
    _counter++;
    //print(widget.link.replaceAll('v1', 'v2'));
    await publicProvider.getOrderDetails(widget.link.replaceAll('v1', 'v2'));
    setState(()=>_isLoading=false);
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if(_counter==0) _customInit(publicProvider);

    return Scaffold(
      backgroundColor: Color(0xffF9F6F6),
      appBar: PreferredSize(
        // backgroundColor: Color(0xffF7F5F5),
        preferredSize: Size.fromHeight(
          size.width * .25,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: ()=>Navigator.pop(context),
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/app_icon/app_bar_icon/customer_care_icon.png',
                )),
          ),
          trailing2: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              offset: Offset(0, kToolbarHeight),
              icon: Image.asset(
                'assets/app_icon/app_bar_icon/vertical_menu.png',
                scale: .8,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Open dispute",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),
                        ),
                      ),
                      value: 1,
                    ),
                  ]),
          title: Text(
            'Orders Details',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w700,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      body:_isLoading
          ? showLoadingWidget
          : ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8D5A6),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        child: Text(
                          'Unpaid',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '58698',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .045),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.copy,
                                color: Colors.pink,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'July 5, 12:01am',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.dividerColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Timeline',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045),
                  ),
                  AnimatedContainer(
                    height: _animatedHeight,
                    width: size.width,
                    duration: const Duration(milliseconds: 480),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'July 5',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),
                                  ),
                                  Text(
                                    '12:01am',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.pink,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      height: size.width * .14,
                                      color: Colors.pink,
                                      width: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unpaid',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * .035),
                                  ),
                                  Text(
                                    'You order is unpaid please pay to \nconfirm this order-Bafdo',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        color: ColorsVariables.textColor,
                                        fontSize: size.width * .035),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'July 5',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),
                                  ),
                                  Text(
                                    '12:01am',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: ColorsVariables.dividerColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      height: size.width * .14,
                                      color: ColorsVariables.dividerColor,
                                      width: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Confirmed',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * .035),
                                  ),
                                  Container(
                                    width: size.width * .6,
                                    child: Text(
                                      'You order has been confirmed by Bafdo',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .035),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'July 5',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color:
                                            ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),
                                  ),
                                  Text(
                                    '12:01am',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color:
                                            ColorsVariables.dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.grey,
                                  ),

                                  // VerticalDivider(
                                  //   width: 2,
                                  //   color: Colors.grey,
                                  // )
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      height: size.width * .2,
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Processing',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * .035),
                                  ),
                                  Container(
                                    width: size.width * .6,
                                    child: Text(
                                      'Your order is ready to shipped. Product will be recieved within 48 hours.',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          color:
                                              ColorsVariables.textColor,
                                          fontSize: size.width * .035),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'July 5',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables
                                            .dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize:
                                            size.width * .035),
                                  ),
                                  Text(
                                    '12:01am',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables
                                            .dividerColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize:
                                            size.width * .035),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.grey,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 20),
                                    child: Container(
                                      height: size.width * .22,
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipped',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables
                                            .textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            size.width * .035),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: size.width * .6,
                                        child: Text(
                                          'Your order has been shipped by deliver partner with tracking number',
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              color: ColorsVariables
                                                  .textColor,
                                              fontSize: size.width *
                                                  .035),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '#BFD7373831815',
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            color: ColorsVariables
                                                .textColor,
                                            fontSize:
                                                size.width * .035),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(
                                                left: 5),
                                        child: Icon(
                                          Icons.copy,
                                          color: Colors.pink,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'July 5',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables
                                                  .dividerColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize:
                                                  size.width * .035),
                                        ),
                                        Text(
                                          '12:01am',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables
                                                  .dividerColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize:
                                                  size.width * .035),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.grey,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                          child: Container(
                                            height: size.width * .12,
                                            color: Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Delivered',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables
                                                  .textColor,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.width * .035),
                                        ),
                                        Container(
                                          width: size.width * .6,
                                          child: Text(
                                            'Your order has been successfully delivered by E-courier',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                color: ColorsVariables
                                                    .textColor,
                                                fontSize:
                                                    size.width * .035),
                                          ),
                                        ),
                                      ],
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () => setState(() {
                        if (_animatedHeight == 500.0) {
                          setState(() {
                            _animatedHeight = 150.0;
                          });
                        } else {
                          setState(() {
                            _animatedHeight = 500.0;
                          });
                        }
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            _animatedHeight == 500
                                ? 'Show Less'
                                : 'Show All',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: Colors.pink,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),
                          ),
                          Image.asset(
                            _animatedHeight == 500
                                ? 'assets/app_icon/body_icon/up_arrow_icon.png'
                                : 'assets/app_icon/body_icon/down_arrow_icon.png',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .045),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.width * .2,
                        width: size.width * .2,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(
                          'assets/app_icon/body_icon/joy_stick.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gaming Controller for Perso...',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontSize: size.width * .045),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/app_icon/body_icon/tk.png',
                                ),
                                Text(
                                  '15.99',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontSize: size.width * .035),
                                ),
                              ],
                            ),
                            Text(
                              'Color: Grey,  Size: M,  Quantity: 02',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontSize: size.width * .035),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summery',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .045),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontSize: size.width * .035),
                      ),
                      Text(
                        'x2',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontSize: size.width * .035),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontSize: size.width * .035),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/app_icon/body_icon/tk.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '105.99',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .035),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontSize: size.width * .035),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/app_icon/body_icon/tk.png',
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Text(
                            '20.00',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .035),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontSize: size.width * .035),
                      ),
                      Row(
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.bold,
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .045),
                          ),
                          Image.asset(
                            'assets/app_icon/body_icon/tk.png',
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Text(
                            '30.00',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .035),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Total',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .045),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/app_icon/body_icon/tk.png',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '95.99',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * .035),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'More To Love',
          //         style: TextStyle(
          //             fontFamily: 'taviraj',
          //             color: ColorsVariables.textColor,
          //             fontWeight: FontWeight.w600,
          //             fontStyle: FontStyle.normal,
          //             fontSize: size.width * .045),
          //       ),
          //       Text(
          //         'See More',
          //         style: TextStyle(
          //             fontFamily: 'taviraj',
          //             color: ColorsVariables.dividerColor,
          //             fontStyle: FontStyle.normal,
          //             fontSize: size.width * .045),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   height: size.height * .8,
          //   width: size.width,
          //   child: new StaggeredGridView.countBuilder(
          //     physics: NeverScrollableScrollPhysics(),
          //     crossAxisCount: 4,
          //     itemCount: 18,
          //     itemBuilder: (BuildContext context, int index) {
          //       return FeatureCategoryListTile();
          //     },
          //     staggeredTileBuilder: (int index) =>
          //         new StaggeredTile.count(2, index.isEven ? 2 : 3),
          //     mainAxisSpacing: 4.0,
          //     crossAxisSpacing: 4.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
