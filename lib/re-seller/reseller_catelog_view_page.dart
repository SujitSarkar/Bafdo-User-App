import 'package:bafdo/colors.dart';
import 'package:flutter/material.dart';


class ResellerCatelogViewPage extends StatefulWidget {
  @override
  _ResellerCatelogViewPageState createState() => _ResellerCatelogViewPageState();
}

class _ResellerCatelogViewPageState extends State<ResellerCatelogViewPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(      backgroundColor: Color(0xffEFF9F9),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.width*.01,),
            Expanded(
              child:Container(
                      height: size.height,
                child: ListView.builder(

                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Gaming Controller For More Entertainment",
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                            Text(
                              "A Special Electric Gadget For Gaming",
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .035),
                            ),
                            Text(
                              "FLAT 1249 TK",
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                            ),
                            Row(children: [


                              Expanded(child:  Container(
                                height: size.width * .6,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.pink.shade100),
                                  shape: BoxShape.rectangle,
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/app_icon/body_icon/joy_stick.png'),
                                ),
                              ),
                              ),


                              Column(

                                children: [


                                  Container(
                                    height: size.width * .3,
                                    width: size.width * .5,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.pink.shade100),
                                      shape: BoxShape.rectangle,
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/joy_stick.png'),
                                    ),
                                  ),
                                  Container(
                                    height: size.width * .3,
                                    width: size.width * .5,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.pink.shade100),
                                      shape: BoxShape.rectangle,
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/joy_stick.png'),
                                    ),
                                  ),
                                ],)
                            ],),

                            SizedBox(height: size.width*.03,),

                            Row(          mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.download),
                                Padding( padding: const EdgeInsets.all(8.0),

                                  child:  Icon(Icons.share_outlined),),

                                Container(      padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.pink.shade100,
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Row(


                                    children: [
                                      Icon(Icons.mobile_screen_share),

                                      Text('Share')],),)

                              ],),

                          ],
                        ),
                      ),


                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


