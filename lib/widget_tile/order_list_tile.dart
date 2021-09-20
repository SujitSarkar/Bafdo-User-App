import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/solid_color_button.dart';
import 'package:flutter/material.dart';

class OrderListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0,left: 20,right: 20),
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/app_icon/body_icon/joy_stick.png',width: 80,height: 80,fit: BoxFit.fill),
          SizedBox(width: 5),
          Expanded(
            child: RichText(
              text: TextSpan(
                //text: 'Hello ',
                style: PublicVariables.smallTextStyle(size).copyWith(color: Colors.grey.shade800,fontSize: 12.0),
                children: <TextSpan>[
                  TextSpan(text: '#BF98GFT57D\n',style: TextStyle(color: Colors.black,fontSize: 14.0)),
                  TextSpan(text: 'Gaming control...\n'),
                  TextSpan(text: '৳ 15.99',style: TextStyle(color: Colors.black,fontSize: 13.0)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SolidColorButton(
                    child: Text('Unpaid',
                    style: PublicVariables.popupMenuTextStyle(size)),
                    onPressed: (){},
                    borderRadius: 7.0,
                    height: 28,
                    width: 110,
                    bgColor: BColors.unpaidColor),
                SizedBox(height: 5),
                SolidColorButton(
                    child: Text('Make a payment',
                        style: PublicVariables.popupMenuTextStyle(size)),
                    onPressed: (){},
                    borderRadius: 7.0,
                    height: 28,
                    width: 110,
                    bgColor: BColors.makePaymentColor),
                SizedBox(height: 5),
                Text('July 5, 12:05 am',style: PublicVariables.hintSmallTextStyle(size).copyWith(fontSize: 12.0))
              ],
            ),
          )
        ],
      ),
    );
  }
}
