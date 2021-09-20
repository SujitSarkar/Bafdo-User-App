import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomOutlineButton extends StatelessWidget {
  Function() onPressed;
  Widget child;
  double borderRadius;
  double height;
  double width;
  Color borderColor;
  Color splashColor;
  CustomOutlineButton({
    required this.child,required this.onPressed,required this.borderRadius,required this.height,
    required this.width,required this.borderColor, required this.splashColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      splashColor: splashColor,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(color: borderColor)
        ),
        child: child,
      ),
    );
  }
}
