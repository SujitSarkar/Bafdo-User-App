import 'package:bafdo/colors.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/cart_page.dart';
import 'package:bafdo/sub_pages/coupos_page.dart';
import 'package:bafdo/sub_pages/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavPageAppBar extends StatefulWidget {
  final Function() openDrawer;
   NavPageAppBar({required this.openDrawer});

  @override
  State<NavPageAppBar> createState() => _NavPageAppBarState();
}

class _NavPageAppBarState extends State<NavPageAppBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return AppBar(
      leading: GestureDetector(
        onTap: widget.openDrawer,
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width * .025, 0, 0, 0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: size.width * .1,
            child: Image.asset(
              'assets/app_icon/app_bar_icon/menu.png',
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width * .2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.width * .002,
                    width: size.width * .01,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.width * .01,
                    ),
                    //size == 14.91
                    child: Text(
                      'GO WITH BEST',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .018),
                    ),
                  ),
                  Container(
                    height: size.width * .002,
                    width: size.width * .01,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        Container(
          width: size.width * .4,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, size.width * .045, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Image.asset(
                          'assets/app_icon/app_bar_icon/busket_active.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: -5.0,
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * .04,
                        height: size.width * .04,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${publicProvider.carts!=null
                              ? publicProvider.carts!.isNotEmpty
                              ?publicProvider.carts![0].cartItems!.length:'0':'0'}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * .02),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * .025,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NotificationPage()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Image.asset(
                          'assets/app_icon/app_bar_icon/notification.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: -5.0,
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
                              color: Colors.white,
                              fontSize: size.width * .02),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
