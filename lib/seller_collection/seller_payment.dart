import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';
import 'package:bafdo/widget_tile/payment_card.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerPayment extends StatefulWidget {
  @override
  _SellerPaymentState createState() => _SellerPaymentState();
}

class _SellerPaymentState extends State<SellerPayment> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String paymentItem = 'nogot';
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
          trailing1: Container(),
          trailing2: Container(),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Payment',
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
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: paymentCard(context,'Total Income',5000.00),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: paymentCard(context,'Net Income',5000.00),
                      ))
                ],),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: paymentCard(context,'Pending Clearance',5000.00),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: paymentCard(context,'Available for \n Withdrawal',5000.00),
                    ),
                  )
                ],),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Payment Withdraw',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.amountTextColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),

                    ),

                    child: Column(
                      children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      paymentItem = 'nogot';
                                    });
                                  },
                                  child: paymentItem == 'nogot'
                                      ? Image.asset(
                                      'assets/app_icon/body_icon/squire_pink_box.png')
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/squire_grey_box.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Bkash'),
                                ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      paymentItem = 'bkash';
                                    });
                                  },
                                  child: paymentItem == 'bkash'
                                      ? Image.asset(
                                      'assets/app_icon/body_icon/squire_pink_box.png')
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/squire_grey_box.png'),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nagad'),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      paymentItem = 'ssl';
                                    });
                                  },
                                  child: paymentItem == 'ssl'
                                      ? Image.asset(
                                      'assets/app_icon/body_icon/squire_pink_box.png')
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/squire_grey_box.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Bank Account'),
                                ),
                              ],
                            ),

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Image.asset('assets/app_icon/text_field_icon/ac_number_icon.png'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "000 0000 000 000",
                                fillColor: Colors.white70),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(

                            decoration: InputDecoration(
                                prefixIcon: Image.asset('assets/app_icon/text_field_icon/tk_icon.png'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Type Amount",
                                fillColor: Colors.white70),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [

                            Icon(Icons.lock,color: Colors.grey,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Your transaction is secured with Bafdo encryption.',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),),
                            ),

                          ],),
                        ),


                      ],
                    ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Withdraw',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.bold,
                          color: ColorsVariables.splashSkip,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                    borderRadius: 9,
                    height: size.width * .15              ,
                    width: size.width,
                    gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Top Customers',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),),
                      Text('by Orders & Payment',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),),
                    ],
                  ),
                ),

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: size.width*.2,
                                  width: size.width*.2,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/app_icon/body_icon/boys.png',fit: BoxFit.fitWidth,),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Text('Saidul Khan',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.w500,
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),),
                                  Text('Total Orders: 55',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .035),),
                                  Row(
                                    children: [
                                      Image.asset('assets/app_icon/body_icon/tk.png'),
                                      Text('20,000.99',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            fontWeight: FontWeight.bold,
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .04),),
                                    ],
                                  ),
                                ],)
                            ],
                          ),
                        )
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
