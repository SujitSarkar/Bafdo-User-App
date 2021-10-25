import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/checkout_page.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _counter = 0;
  dynamic _totalPrice = 0;

  Future<void> _updateTotalPrice(PublicProvider publicProvider) async{
    setState(() => _counter++);
    if(publicProvider.carts!.isNotEmpty) {
      _totalPrice = 0;
      for (int i = 0; i < publicProvider.carts![0].cartItems!.length; i++) {
        setState(() {
          _totalPrice = _totalPrice +
              publicProvider.carts![0].cartItems![i].quantity! *
                  publicProvider.carts![0].cartItems![i].price!;
        });
      }
    } else {
      setState(() {
        _totalPrice = 0;
      });
    }
    if(publicProvider.carts==null) await publicProvider.fetchCartList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if (_counter == 0) _updateTotalPrice(publicProvider);

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
          title: Text('Cart',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04)),
          trailing1: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset('assets/app_icon/app_bar_icon/close.png')),
          //trailing1: Container(),
          trailing2: Container(),
        ),
      ),
      body:RefreshIndicator(
        onRefresh: ()async{
          await publicProvider.fetchCartList();
        },
        backgroundColor: Colors.white,
        child: publicProvider.carts!=null
            ?publicProvider.carts!.isNotEmpty
            ? Stack(children: [
          ListView(
            children: [
              // Row(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         setState(() {
              //           selectAll = !selectAll;
              //         });
              //         if(selectAll==true){
              //           for(int i=0;i<publicProvider.carts![0].cartItems!.length;i++){
              //             tPrice=(publicProvider.carts![0].cartItems![i].price!*publicProvider.carts![0].cartItems![i].quantity!);
              //           }
              //           setState(() {
              //             totalPrice=tPrice;
              //           });
              //         }else{
              //           setState(() {
              //             totalPrice=0;
              //           });
              //         }
              //       },
              //       child: selectAll == true
              //           ? Image.asset(
              //               'assets/app_icon/body_icon/squire_pink_box.png')
              //           : Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Image.asset(
              //                   'assets/app_icon/body_icon/squire_grey_box.png'),
              //             ),
              //     ),
              //     Text('Select All',
              //         style: TextStyle(
              //             fontFamily: 'taviraj',
              //             color: ColorsVariables.textColor,
              //             fontStyle: FontStyle.normal,
              //             fontWeight: FontWeight.w500,
              //             fontSize: size.width * .045))
              //   ],
              // ),
              ///Cart item list
              ListView.builder(
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: publicProvider.carts![0].cartItems!.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableStrechActionPane(),
                    child: Container(
                      margin: EdgeInsets.all(size.width * .02),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(9.7))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///Left Section
                          Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(size.width * .02),
                                  child: Container(
                                    height: size.width * .15,
                                    width: size.width * .15,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5))),
                                    child: Padding(
                                      padding: EdgeInsets.all(size.width * .02),
                                      child: Image.network(
                                          'https://bafdo.com/public/${publicProvider.carts![0].cartItems![index].productThumbnailImage!}',
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${publicProvider.carts![0].cartItems![index].productName!}'
                                        'jhfkjd hfkjdhf kjdha fkjdahf kjh ',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .04),
                                      ),
                                      Text(
                                        '৳ ${publicProvider.carts![0].cartItems![index].price!}',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: Colors.grey.shade600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .035),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///Right Section
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (publicProvider.carts![0].cartItems![index]
                                            .quantity !=
                                        1) {
                                      showLoadingDialog(context);
                                      await publicProvider
                                          .updateCart(
                                              publicProvider.carts![0]
                                                  .cartItems![index].id!,
                                              (publicProvider
                                                      .carts![0]
                                                      .cartItems![index]
                                                      .quantity! -
                                                  1))
                                          .then((value) async {
                                        await publicProvider.fetchCartList();
                                        closeLoadingDialog(context);
                                        _updateTotalPrice(publicProvider);
                                        //showToast('1 item removed to cart');
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: size.width * .03,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Image.asset(
                                      'assets/app_icon/body_icon/minus.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * .02),
                                  child: Text(
                                    '${publicProvider.carts![0].cartItems![index].quantity!}',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * .05),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    showLoadingDialog(context);
                                    await publicProvider
                                        .addCart(
                                            publicProvider.carts![0]
                                                .cartItems![index].productId!,
                                            1)
                                        .then((value) async {
                                      await publicProvider.fetchCartList();
                                      closeLoadingDialog(context);
                                      _updateTotalPrice(publicProvider);
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: size.width * .03,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Image.asset(
                                      'assets/app_icon/body_icon/plus.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        iconWidget: Image.asset(
                            'assets/app_icon/body_icon/delete_pink.png'),
                        color: Colors.transparent,
                        onTap: () async {
                          showLoadingDialog(context);
                          await publicProvider
                              .deleteCart(
                                  publicProvider.carts![0].cartItems![index].id!)
                              .then((value) async {
                            await publicProvider.fetchCartList();
                            closeLoadingDialog(context);
                            _updateTotalPrice(publicProvider);
                            showToast('Product removed from cart');
                          });
                        },
                      )
                    ],
                  );
                },
              ),

              ///Total Price section
              Padding(
                padding: EdgeInsets.all(size.width * .02),
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text("Total : ",
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * .045)),
                        Text("৳ $_totalPrice",
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * .045)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * .25)
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("More To Love",
              //           style: TextStyle(
              //               fontFamily: 'taviraj',
              //               color: ColorsVariables.textColor,
              //               fontStyle: FontStyle.normal,
              //               fontWeight: FontWeight.w500,
              //               fontSize: size.width * .045)),
              //       Text("See More",
              //           style: TextStyle(
              //               fontFamily: 'taviraj',
              //               color: Colors.grey,
              //               fontStyle: FontStyle.normal,
              //               fontWeight: FontWeight.w500,
              //               fontSize: size.width * .045)),
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

          ///Bottom Section
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.width * .25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * .8,
                    padding: EdgeInsets.fromLTRB(size.width * .02,
                        size.width * .05, size.width * .02, size.width * .03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
                          child: Container(
                            width: size.width * .36,
                            height: size.width * .13,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xffA7A6A8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              'Order As Gift',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckoutPage()),
                            );
                          },
                          child: Container(
                              width: size.width * .36,
                              height: size.width * .13,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xffC31A65).withOpacity(1),
                                    Color(0xffFA4494).withOpacity(1)
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .04,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]):Center(
          child: Text('Empty Cart !',
          style:TextStyle(
              fontFamily: 'taviraj',
              color: ColorsVariables.textColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: size.width * .045),),
        ):Center(
        child: Text('Empty Cart !',
        style:TextStyle(
            fontFamily: 'taviraj',
            color: ColorsVariables.textColor,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: size.width * .045),),
    ),
      ),
    );
  }


}
