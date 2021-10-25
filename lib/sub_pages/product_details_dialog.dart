import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsDialog extends StatefulWidget {
  const ProductDetailsDialog({Key? key}) : super(key: key);

  @override
  _ProductDetailsDialogState createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }
  int? boxColor;
  int? sizeColor;
  int? checkBoxColor;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.grey,
                        ),
                      )),
                  Expanded(
                    child: Container(
                      height: size.width * 1,
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        'assets/app_icon/body_icon/joy_stick.png',
                                        fit: BoxFit.fill,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/app_icon/body_icon/tk.png'),
                                            Text(
                                              '15.00',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  color:
                                                      ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * .04),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'In Stock',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * .035),
                                        ),
                                        Text(
                                          'Selected : BD+Grey+M',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w100,
                                              fontSize: size.width * .035),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Color :',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * .035),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boxColor = 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: boxColor == 1
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .05,
                                          vertical: size.width * .015,
                                        ),
                                        child: Text(
                                          'Red',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: boxColor == 1
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boxColor = 2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: boxColor == 2
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .05,
                                          vertical: size.width * .015,
                                        ),
                                        child: Text(
                                          'Blue',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: boxColor == 2
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boxColor = 3;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: boxColor == 3
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .05,
                                          vertical: size.width * .015,
                                        ),
                                        child: Text(
                                          'Grey',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: boxColor == 3
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boxColor = 4;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: boxColor == 4
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .05,
                                          vertical: size.width * .015,
                                        ),
                                        child: Text(
                                          'B&W',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: boxColor == 4
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .04),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 20),
                                  child: Text(
                                    'Size :',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * .035),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sizeColor = 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: sizeColor == 1
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          'S',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: sizeColor == 1
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .045),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sizeColor = 2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: sizeColor == 2
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          'M',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: sizeColor == 2
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .045),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sizeColor = 3;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: sizeColor == 3
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          'XL',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: sizeColor == 3
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .045),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        sizeColor = 4;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: sizeColor == 4
                                              ? Colors.pink.shade50
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          'XXL',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: sizeColor == 4
                                                  ? Colors.pink
                                                  : Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .045),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Packaging:',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * .035),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              'assets/app_icon/body_icon/packaging.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Special Packaging',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  color:
                                                      ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .035),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/app_icon/body_icon/tk.png'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    '10',
                                                    style: TextStyle(
                                                        fontFamily: 'taviraj',
                                                        color: ColorsVariables
                                                            .textColor,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            size.width * .035),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          checkBoxColor = 1;
                                        });
                                      },
                                      child: checkBoxColor == 1
                                          ? Image.asset(
                                              'assets/app_icon/body_icon/pink_sign.png')
                                          : Image.asset(
                                              'assets/app_icon/body_icon/circuler_box.png')),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              'assets/app_icon/body_icon/packaging.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Special Packaging',
                                              style: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  color:
                                                      ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: size.width * .035),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/app_icon/body_icon/tk.png'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    '10',
                                                    style: TextStyle(
                                                        fontFamily: 'taviraj',
                                                        color: ColorsVariables
                                                            .textColor,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            size.width * .035),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          checkBoxColor = 2;
                                        });
                                      },
                                      child: checkBoxColor == 2
                                          ? Image.asset(
                                              'assets/app_icon/body_icon/pink_sign.png')
                                          : Image.asset(
                                              'assets/app_icon/body_icon/circuler_box.png')),
                                ],
                              ),
                              Container(
                                height: 120,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Colors.grey.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'INT size M',
                                            style: TextStyle(
                                                fontFamily: 'taviraj',
                                                color:
                                                    ColorsVariables.textColor,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * .04),
                                          ),
                                          Image.asset(
                                            'assets/app_icon/body_icon/circuler_question.png',
                                            scale: .5,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Text(
                                          'Height: 16” , Width: 12” , Weight: 80gm , special packaging 10tk.',
                                          style: TextStyle(
                                              fontFamily: 'taviraj',
                                              color: ColorsVariables.textColor,
                                              fontStyle: FontStyle.normal,
                                              fontSize: size.width * .035),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Quantity:',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * .035),
                                    ),
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
                                          radius: 15,
                                          backgroundColor: Colors.grey.shade200,
                                          child: Image.asset(
                                            'assets/app_icon/body_icon/minus.png',
                                            scale: .5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
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
                                        radius: 15,
                                        backgroundColor: Colors.grey.shade200,
                                        child: Image.asset(
                                          'assets/app_icon/body_icon/plus.png',
                                          scale: .5,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Ship From: Dhaka, BD',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .035),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Free Shipping',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .035),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: GradientButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.bold,
                                        color: ColorsVariables.splashSkip,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .045),
                                  ),
                                  borderRadius: 6.97,
                                  height: size.width * .13,
                                  width: size.width * .5,
                                  gradientColors: [
                                    Colors.pink.shade600,
                                    Colors.pink.shade400
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
