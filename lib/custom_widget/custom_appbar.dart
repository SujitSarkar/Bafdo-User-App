import 'package:bafdo/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Widget leading;
  Widget? title;
  Widget trailing1;
  Widget trailing2;

  CustomAppBar({
    required this.leading,
    required this.title,
    required this.trailing1,
    required this.trailing2,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                leading,
                Center(child: title!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    trailing1,
                    trailing2,
                  ],
                )
              ],
            ),
            Divider(color: ColorsVariables.dividerColor)
          ],
        ),
      ),
    );
  }
}
