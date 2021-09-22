import 'package:flutter/material.dart';

class TotalSellsDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold( backgroundColor: Color(0xffEFF9F9),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.lightBlue.shade600),
                        bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                      ),
                     // border: Border.all(width: 1 ,color: Colors.grey)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Date',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),),
                    Text('Transaction',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),),
                    Text('Income',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),)
                  ],),
                ),
              ),

              Container(
                height: size.width * .4,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('20/09/2021',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .035),),
                          Row(
                            children: [
                              Text('tr9hty',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),),

                              Icon(Icons.download_outlined)
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('assets/app_icon/body_icon/tk.png'),
                              Text('200',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .035),),
                            ],
                          )
                        ],),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
