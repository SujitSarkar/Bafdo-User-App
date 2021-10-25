import 'package:bafdo/variables/colors.dart';

import 'package:flutter/material.dart';

Widget getRedFolder(
    BuildContext context, List<String> categoryList, int index) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .03),
        ),
        child: Container(
          width: size.width * .3,
          height: size.width * .28,
          child: Image.asset(
            'assets/app_icon/body_icon/folder.png',
          ),
        ),
      ),
      Text(
        '${categoryList[index]}',
        style: TextStyle(
            fontFamily: 'taviraj',
            color: ColorsVariables.textColor,
            fontStyle: FontStyle.normal,
            fontSize: size.width * .04),
      )
    ],
  );
}

Widget getCollectionFolder(
    BuildContext context, List<String> categoryList, int index) {
  Size size = MediaQuery.of(context).size;
  return
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .03),
        ),
        child: Container(

          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Column(
              children: [
                Container(
                  width: size.width * .3,
                  height: size.width * .2,
                  child: Image.asset(
                    'assets/app_icon/body_icon/folder.png',
                  ),
                ),

                Align(alignment: Alignment.topLeft,

                  child:  Text(
                    '${categoryList[index]}',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .04),
                  ),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container( decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.pinkAccent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ) ,

                        child:  Padding( padding: const EdgeInsets.only(left: 10.0,right: 10.0,),
                          child:Text('Share',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.pinkColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),) ,
                        )
                    ),
                    Container(
                      child: Icon(Icons.delete_outline,color: Colors.pinkAccent,),
                    )
                  ],)
              ],),
          ),
        ),


      );



}
