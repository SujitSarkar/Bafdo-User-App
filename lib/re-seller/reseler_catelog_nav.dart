import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/special_category_list_tile.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/re-seller/reseller_catelog_view_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReselerCatelogNav extends StatefulWidget {
  const ReselerCatelogNav({Key? key}) : super(key: key);

  @override
  _ReselerCatelogNavState createState() => _ReselerCatelogNavState();
}

class _ReselerCatelogNavState extends State<ReselerCatelogNav> {
  List<String> _special_gift_categories = [
    'Anniversary',
    'Birth day',
    'Him',
    'Her',
    'Kids',
    'Wedding',
    'House warming',
    'Personalised'
  ];

  List<String> _feature_icons_list = [
    'assets/app_icon/body_icon/wedding.png',
    'assets/app_icon/body_icon/birthday.png',
    'assets/app_icon/body_icon/him.png',
    'assets/app_icon/body_icon/her.png',
    'assets/app_icon/body_icon/kids.png',
    'assets/app_icon/body_icon/anniversary.png',
    'assets/app_icon/body_icon/house_warming.png',
    'assets/app_icon/body_icon/personalized.png',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      body: SafeArea(

            child: SingleChildScrollView(

                child: Expanded(child:Container(
                  height: size.height*5,
                  width: size.width,


                  child: Column(
                    children: [
                      SizedBox(height: size.width*.01,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: size.width*.1,
                          width: size.width*.5,

                          decoration: BoxDecoration(

                              border: Border.all(width: 1,color: Colors.pink),


                              borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                          ),

                          child: Text('Top Category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .05),),),
                      ),
                      SizedBox(height: size.width*.01,),
                      GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: size.width * 0,
                          ),
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(

                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ResellerCatelogViewPage()));
                                },

                              child: specialCategoryListTile(
                                  context,
                                  publicProvider.categories!.data![index].name??'',
                                  'https://bafdo.com/public/${publicProvider.categories!.data![index].banner??''}'),



                            );
                          }),
                      SizedBox(height: size.width*.01,),
                      SizedBox(height: size.width*.01,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: size.width*.1,
                          width: size.width*.5,

                          decoration: BoxDecoration(

                              border: Border.all(width: 1,color: Colors.pink),


                              borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                          ),

                          child: Text('Essentials',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .05),),),
                      ),
                      SizedBox(height: size.width*.01,),
                      Container(
                        height: size.width * .35,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: size.width * .2,
                                    width: size.width * .2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.pink.shade100),
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          'assets/app_icon/body_icon/joy_stick.png'),
                                    ),
                                  ),
                                  Text(
                                    "Joy Stick",
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.width*.01,),


                      Expanded(
                        child:Container(




                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
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



                )
                  ,),



             )







      ),





    );
  }
}
