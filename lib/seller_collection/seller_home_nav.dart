import 'package:bafdo/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SellerHomeNav extends StatefulWidget {
  @override
  _SellerHomeNavState createState() => _SellerHomeNavState();
}

class _SellerHomeNavState extends State<SellerHomeNav> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
            children: [
  

              SizedBox(height: size.width*.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('assets/app_icon/body_icon/tk.png',),
                Text('5,000,00.00',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w600,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .06),)
              ],),
              Text('2020 Yearly income',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),),

              Text('Analytics',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(

                        decoration: BoxDecoration(
                            color:  Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(6),


                          )

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                          child: Text('All Time',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .03),),
                        ),
                      ),
                        Container(
                          child: Text('Today',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .03),),
                        ),
                        Container(
                          child: Text('Weekly',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .03),),
                        ),
                        Container(
                          child: Text('Monthly',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .03),),
                        ),
                        Container(
                          child: Text('Yearly',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .03),),
                        ),
                    ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  Column(children: [
                    Text('Total Earning',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .05),),
                    Text('Statistic for all time',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .03),),
                  ],),
                  Row(children: [
                    Image.asset('assets/app_icon/body_icon/tk.png',),
                    Text('20,000,00',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),),

                  ],)
                ],),
              ),

              Container(
                width: size.width,
                height: size.width*.5,
                child: Image.asset('assets/app_icon/body_icon/statistic_carve.png',fit: BoxFit.fill,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/app_icon/body_icon/tk.png',),
                  Text('1,000,00.00',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w600,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .06),)
                ],),
              Text('2020 Average Monthly income',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .03),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Recently Added',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045),),
                  Text('See More',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045),),


                ],),
              ),

              Container(
                height: size.width*.85,
                width: size.width,
                child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.width * .2,
                                width: size.width * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),


                                  color: Colors.grey.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/app_icon/body_icon/joy_stick.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gaming Controller for PC",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                  Text(
                                    "Brand: Xiaomi",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                  Row(
                                    children: [

                                      Image.asset(
                                          'assets/app_icon/body_icon/tk.png'),
                                      Text(
                                        "20.99",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .04),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Best Selling',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),),
                        Text('Selected by Orders',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .035),),
                      ],
                    ),
                    Text('See More',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),),


                  ],),
              ),

              Container(
                height: size.width*.85,
                width: size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.width * .2,
                                width: size.width * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),


                                  color: Colors.grey.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/app_icon/body_icon/joy_stick.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gaming Controller for PC",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                  Text(
                                    "Brand: Xiaomi",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total: ",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .04),
                                      ),
                                      Image.asset(
                                          'assets/app_icon/body_icon/tk.png'),
                                      Text(
                                        "20.000.99",
                                        style: TextStyle(
                                            fontFamily: 'taviraj',
                                            color: ColorsVariables.textColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: size.width * .04),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),



              Center(child: Text('Seller Home Nav')),
            ],
        ),
          ),

        ));
  }
}
