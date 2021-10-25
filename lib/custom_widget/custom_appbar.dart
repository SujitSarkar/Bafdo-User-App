import 'package:bafdo/variables/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leading;
  final Widget? title;
  final Widget trailing1;
  final Widget trailing2;

  CustomAppBar({
    required this.leading,
    required this.title,
    required this.trailing1,
    required this.trailing2,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(top: 8.0),
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
            SizedBox(height: 2.0),
            Divider(color: ColorsVariables.dividerColor)
          ],
        ),
      ),
    );
  }
}
