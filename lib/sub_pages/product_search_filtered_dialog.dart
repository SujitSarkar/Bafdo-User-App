import 'package:bafdo/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class ProductSearchFilteredDialog extends StatefulWidget {
  const ProductSearchFilteredDialog({Key? key}) : super(key: key);

  @override
  _ProductSearchFilteredDialogState createState() =>
      _ProductSearchFilteredDialogState();
}

class _ProductSearchFilteredDialogState
    extends State<ProductSearchFilteredDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

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

  // int? boxColor;
  // int? sizeColor;
  // int? checkBoxColor;

  // int counter = 0;

  String _isChecked = '';

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
                  Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.grey,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * .3),
                        child: Text(
                          'Filters',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * .04),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: size.width * .9,
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.width * .1, bottom: size.width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/circuler_menu_icon.png'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Category',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        'MI',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/next_icon_grey.png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.width * .1, bottom: size.width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/app_icon/body_icon/circuler_menu_icon.png'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Brand',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        'Xiaomi',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/next_icon_grey.png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.width * .1, bottom: size.width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Only with photos',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isChecked = 'Only with photos';
                                        });
                                      },
                                      child: Image.asset(_isChecked !=
                                              'Only with photos'
                                          ? 'assets/app_icon/body_icon/circuler_box.png'
                                          : 'assets/app_icon/body_icon/pink_sign.png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.width * .1, bottom: size.width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'New Arrival',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isChecked = 'New Arrival';
                                        });
                                      },
                                      child: Image.asset(_isChecked !=
                                              'New Arrival'
                                          ? 'assets/app_icon/body_icon/circuler_box.png'
                                          : 'assets/app_icon/body_icon/pink_sign.png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.width * .1, bottom: size.width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Recomended',
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .045),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isChecked = 'Recomended';
                                        });
                                      },
                                      child: Image.asset(_isChecked !=
                                              'Recomended'
                                          ? 'assets/app_icon/body_icon/circuler_box.png'
                                          : 'assets/app_icon/body_icon/pink_sign.png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Price',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * .045),
                              ),
                            ),
                          ),
                          Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.71))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                          'assets/app_icon/body_icon/tk.png'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 5),
                                        child: Container(
                                          height: size.width * .1,
                                          width: size.width * .15,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: '0',
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  fontFamily: 'taviraj',
                                                  color:
                                                      ColorsVariables.textColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * .045),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontFamily: 'taviraj',
                                      color: ColorsVariables.textColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .1),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.71))),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/app_icon/body_icon/tk.png'),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5),
                                          child: Container(
                                            height: size.width * .1,
                                            width: size.width * .15,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintText: '10,000',
                                                hintStyle: TextStyle(
                                                    fontFamily: 'taviraj',
                                                    color: ColorsVariables
                                                        .textColor,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        size.width * .045),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.width * .1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: GradientButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.pink,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .045),
                                  ),
                                  borderRadius: 15,
                                  height: size.width * .13,
                                  width: size.width * .3,
                                  gradientColors: [
                                    Colors.white,
                                    Colors.white,
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * .1,
                              ),
                              Center(
                                child: GradientButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        fontWeight: FontWeight.bold,
                                        color: ColorsVariables.splashSkip,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .045),
                                  ),
                                  borderRadius: 15,
                                  height: size.width * .13,
                                  width: size.width * .3,
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
