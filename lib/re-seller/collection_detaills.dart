import 'package:bafdo/colors.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectionDetailsPage extends StatefulWidget {
  @override
  _CollectionDetailsPageState createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Collection Name',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),),

                        Icon(Icons.edit_outlined)
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: ColorsVariables.pinkColor),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 3,bottom: 3),
                          child: Text('Share',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.pinkColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),),
                        )),
                  ],
                ),
              ),
              Divider(height: 1,
              color: Colors.grey,),
              Expanded(
                child:Container(
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetail()));
                        },
                        child: Padding(
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "TK 1,559",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04),
                                    ),
                                    Text(
                                      "TK 2,599",

                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,

                                          fontSize: size.width * .04),
                                    ),
                                    Text(
                                      "(40%)",
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.pinkColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04),
                                    ),
                                  ],
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

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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


                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
