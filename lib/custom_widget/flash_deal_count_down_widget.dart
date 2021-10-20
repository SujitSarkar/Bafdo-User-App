import 'package:bafdo/sub_pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors.dart';

class FlashDealCountDownWidget extends StatefulWidget {
  final int? endingDate;
  FlashDealCountDownWidget({this.endingDate});

  @override
  _FlashDealCountDownWidgetState createState() => _FlashDealCountDownWidgetState();
}

class _FlashDealCountDownWidgetState extends State<FlashDealCountDownWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          //print(DateFormat('dd/MM/yyyy-- HH:mm:aa').format(DateTime.fromMillisecondsSinceEpoch(widget.endingDate!*1000)));

          int remainingSec,day,hours,minute,second;
          remainingSec = DateTime.fromMillisecondsSinceEpoch((widget.endingDate!*1000))
              .difference(DateTime.now()).inSeconds;
          day = remainingSec~/(24*3600);
          remainingSec = remainingSec%(24*3600);
          hours= remainingSec~/3600;
          remainingSec%=3600;
          minute=remainingSec~/60;
          remainingSec%=60;
          second = remainingSec;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/app_icon/body_icon/flash_deal_icon.png'),
          Text(
            'Flash Deal Ending in ',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w500,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),

          _timeContainer(day.toString(), size),
          Text(':'),
          _timeContainer(hours.toString(), size),
          Text(':'),
          _timeContainer(minute.toString(), size),
          Text(':'),
          _timeContainer(second.toString(), size),

          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                        navigateFrom: 'Flash Deal',
                      )));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .02),
              child: Text('See More',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04)),
            ),
          ),
        ],
      );
    });
  }

  Widget _timeContainer(String time,Size size)=>Expanded(
    child: Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          color: Colors.pink.shade300,
          borderRadius: new BorderRadius.circular(5.0)),
      child: Text(
        time.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'poppins',
            color: Colors.white,
            fontSize: size.width * .035),
      ),
    ),
  );
}
