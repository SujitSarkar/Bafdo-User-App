import 'package:bafdo/colors.dart';
import 'package:flutter/material.dart';

class ReselerChatPage extends StatefulWidget {
  @override
  _ReselerChatPageState createState() => _ReselerChatPageState();
}

class _ReselerChatPageState extends State<ReselerChatPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),

      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children:[

              Center(
                child: Text('There is no chat yet',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04),),
              ),


            Positioned(

              bottom: 0,
               left: 0,

              child:  Column(
                children: [
                  Container(
                    width: size.width ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * .03),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                        child: TextFormField(
                          controller: _searchController,
                          style: TextStyle(color: Colors.pink),
                          decoration: InputDecoration(
                              focusColor: Colors.pink,
                              hintText: 'Search product',
                              hintStyle: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04),
                              suffixIcon: InkWell(
                                onTap: () {

                                },
                                child: Icon(Icons.send_rounded)
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          onChanged: (content) {

                          },
                          cursorColor: Color(0xff131214),
                        )),
                  ),

                ],
              ),),



            ],


          ),
        ),
      ),
    );
  }
}
