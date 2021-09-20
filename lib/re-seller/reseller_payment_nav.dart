import 'package:bafdo/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentNav extends StatefulWidget {
  @override
  _PaymentNavState createState() => _PaymentNavState();
}

class _PaymentNavState extends State<PaymentNav> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Color(0xffEFF9F9),
        child: Column(children: [


      Padding( padding: const EdgeInsets.all(8.0),
      child: Container(
        

        width: size.width*.9 ,
        height: size.width*.3,

        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.all(Radius.circular(10))

        ),

        child:Center(child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Your Total Income',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .04),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/app_icon/body_icon/tk.png'),
              Text('200',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .05),),
            ],),

          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.pink.shade100,


            ),
            child:   Text('So far sold in stores',
            style: TextStyle(
                fontFamily: 'taviraj',
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .04),),
            ),




        ],),),

        ) ,),

      Expanded(child:  Container(
        height: size.width ,
        width: size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 12,
          itemBuilder: (context, index) {
            return  Card(
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start
                      ,children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Next Payout Due",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Sun,Sep 13,Sun,Sep 19",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Final Payout will vary based on Order Status",
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .03),
                        ),
                      ),
                    ],),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children:[
                          Image.asset(
                              'assets/app_icon/body_icon/tk.png'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "0",
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                          ),
                          Image.asset(
                              'assets/app_icon/body_icon/next_icon_grey.png'),
                        ])
                    ),


                  ],
                ),
              ),
            );

          },
        ),
      ),)


    ],) );
  }
}
