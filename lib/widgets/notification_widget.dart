import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showLoadingDialog(BuildContext context) {
  showGeneralDialog(
      //barrierLabel: _title,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: SpinKitSpinningLines(color: Colors.white, size: 60.0),
        );
      });
}

Widget showLoadingWidget = Align(
  alignment: Alignment.center,
  child: SpinKitSpinningLines(color: Colors.pink, size: 60.0),
);

void closeLoadingDialog(BuildContext context) => Navigator.pop(context);

void showToast(String? message) {
  Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.75),
      textColor: Colors.white,
      fontSize: 16.0);
}
