import 'package:bafdo/model/purchase_history_model.dart';
import 'package:bafdo/sub_pages/order_details.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/solid_color_button.dart';
import 'package:flutter/material.dart';

class OrderListTile extends StatelessWidget {
  final OrderModel orderModel;
  OrderListTile({required this.orderModel});

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>
          OrderDetails(link: orderModel.links!.details!))),
      child: Container(
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
            // Image.asset('assets/app_icon/body_icon/joy_stick.png',width: 80,height: 80,fit: BoxFit.fill),
            SizedBox(width: 5),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: PublicVariables.smallTextStyle(size).copyWith(color: Colors.grey.shade800,fontSize: 12.0),
                  children: <TextSpan>[
                    TextSpan(text: '${orderModel.code}\n',style: TextStyle(color: Colors.black,fontSize: 14.0)),
                    TextSpan(text: '${orderModel.paymentType}\n'),
                    TextSpan(text: '${orderModel.grandTotal}',style: TextStyle(color: Colors.black,fontSize: 13.0)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SolidColorButton(
                      child: Text(orderModel.paymentStatusString!,
                      style: PublicVariables.popupMenuTextStyle(size)),
                      onPressed: (){},
                      borderRadius: 7.0,
                      height: 28,
                      width: 110,
                      bgColor:orderModel.paymentStatus=='unpaid'
                          ?BColors.unpaidColor
                          :BColors.makePaymentColor),
                  // SizedBox(height: 5),
                  // SolidColorButton(
                  //     child: Text('Make a payment',
                  //         style: PublicVariables.popupMenuTextStyle(size)),
                  //     onPressed: (){},
                  //     borderRadius: 7.0,
                  //     height: 28,
                  //     width: 110,
                  //     bgColor: BColors.makePaymentColor),
                  SizedBox(height: 5),
                  Text(orderModel.date!,style: PublicVariables.hintSmallTextStyle(size).copyWith(fontSize: 12.0))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
