import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/sub_pages/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int counter = 0;

  List selectedItem = [];

  bool selectAll = false;

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
          title: Text('Cart',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04)),
          trailing1: InkWell(
              onTap: () {},
              child: Image.asset('assets/app_icon/body_icon/favorite.png')),
          trailing2: Container(),
        ),
      ),
      body: Stack(children: [
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectAll = !selectAll;
                        });
                      },
                      child: selectAll == true
                          ? Image.asset(
                              'assets/app_icon/body_icon/squire_pink_box.png')
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                  'assets/app_icon/body_icon/squire_grey_box.png'),
                            ),
                    ),
                    Text('Select All',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * .045))
                  ],
                ),
                Container(
                  height: size.width,
                  width: size.width,
                  child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Slidable(
                        actionPane: SlidableStrechActionPane(),
                        child: _cartListTile(index),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            iconWidget: Image.asset(
                                'assets/app_icon/body_icon/delete_pink.png'),
                            color: Colors.transparent,
                            onTap: () {},
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Selected items (2)",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * .045)),
                      Row(
                        children: [
                          Text("Total : ",
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .045)),
                          Image.asset('assets/app_icon/body_icon/tk.png'),
                          Text(" 31.98",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("More To Love",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * .045)),
                      Text("See More",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * .045)),
                    ],
                  ),
                ),
                Container(
                  height: size.height * .8,
                  width: size.width,
                  child: new StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: 18,
                    itemBuilder: (BuildContext context, int index) {
                      return FeatureCategoryListTile();
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2 : 3),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: size.width,
            height: size.width * .25,
            color: Colors.white,
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
      ]),
    );
  }

  Widget _cartListTile(var index) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedItem.add(index);
              });

              print(selectedItem);
            },
            child: selectedItem.contains(index) || selectAll == true
                ? InkWell(
                    onTap: () {
                      setState(() {
                        selectedItem.remove(index);
                      });
                    },
                    child: Container(
                      height: size.width * .06,
                      width: size.width * .06,
                      child: Image.asset(
                        'assets/app_icon/body_icon/squire_pink_box.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.width * .03,
                      width: size.width * .03,
                      child: Image.asset(
                        'assets/app_icon/body_icon/squire_grey_box.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          ),
          Container(
            width: size.width * .85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(9.7))),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.width * .15,
                        width: size.width * .15,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                              'assets/app_icon/body_icon/joy_stick.png',
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gaming Controller',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * .04),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/app_icon/body_icon/tk.png'),
                            Text(
                              '15.99',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: Colors.grey.shade600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .035),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 5, right: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (counter > 0) {
                                    counter = counter - 1;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                radius: size.width * .04,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/app_icon/body_icon/minus.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .035,
                            ),
                            child: Text(
                              '0$counter',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .05),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                counter = counter + 1;
                              });
                            },
                            child: CircleAvatar(
                              radius: size.width * .04,
                              backgroundColor: Colors.grey.shade200,
                              child: Image.asset(
                                'assets/app_icon/body_icon/plus.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
