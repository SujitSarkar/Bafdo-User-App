
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/outline_button.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class NewCollectionDialog extends StatefulWidget {
  @override
  _NewCollectionDialogState createState() => _NewCollectionDialogState();
}

class _NewCollectionDialogState extends State<NewCollectionDialog>   with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }
  String searchValue = '';
  String navigateDetailsWidget = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
         Scaffold(
           body: Center(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                height: size.width *.6,
                width: size.width*.8,

                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Create a wishlist',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),),
                        )),
                    SizedBox(
                      height: size.width*.03,
                    ),
                    Container(
                      width: size.width *.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                       // border: Border.all(width: 1,color: Colors.pinkAccent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(size.width * .03),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                          child: TextFormField(
                            controller: _searchController,

                            style: TextStyle(color: Colors.black),

                            decoration: InputDecoration(
                              labelText: 'Wishlist Name',
                                focusColor: Colors.pink,

                                hintStyle: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),


                                enabledBorder: OutlineInputBorder(

                                  borderSide: BorderSide(
                                      color: Colors.pinkAccent,
                                      width: 1.0),
                                ),
                                disabledBorder: InputBorder.none,
                               focusedBorder: OutlineInputBorder(

                                 borderSide: BorderSide(
                                     color: Colors.pinkAccent,
                                     width: 1.0),
                               ),
                            ),
                            onChanged: (content) {
                              setState(() {
                                searchValue = content;
                              });
                            },
                            cursorColor: Color(0xff131214),
                          )),
                    ),

                    SizedBox(
                      height: size.width*.1,
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left: size.width * .05,right: size.width * .05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomOutlineButton(child: Text('Cancel',  style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.pinkColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),), onPressed: (){Navigator.pop(context);}, borderRadius: 10, height: size.width*.13, width: size.width*.3, borderColor: ColorsVariables.pinkColor, splashColor: ColorsVariables.pinkColor),

                          GradientButton(

                            child: Text('OK',  style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),), onPressed: (){

                          },borderRadius:  10, height: size.width*.13,width:size.width*.3 ,gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
                          )



                        ],
                      ),
                    )


                  ],
                ),

        ),
             ),
           ),
         );


  }
}



