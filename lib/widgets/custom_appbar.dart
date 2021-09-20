import 'package:bafdo/variables/color_variable.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Widget leading;
  String title;
  Widget trailing;
  Widget trailing2;
  Function()? leadingPress;
  Function()? trailingPress;
  Function()? trailing2Press;
  CustomAppBar({required this.leading, required this.title,
    required this.trailing, required this.trailing2,this.leadingPress,
  this.trailingPress,this.trailing2Press});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: leadingPress,
                    child: leading),
                Expanded(
                  child: Text(title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          color: BColors.fontColor,
                          fontSize: size.width*.05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: trailingPress,
                        child: trailing),
                    InkWell(
                      onTap: trailing2Press,
                        child: trailing2)
                  ],
                )
              ],
            ),
            Divider(color: BColors.greyColor)
          ],
        ),
      ),
    );
  }
}
