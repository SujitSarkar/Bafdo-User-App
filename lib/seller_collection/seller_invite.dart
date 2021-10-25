import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class SellerInvite extends StatefulWidget {
  @override
  _SellerInviteState createState() => _SellerInviteState();
}

class _SellerInviteState extends State<SellerInvite> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  double animatedheight = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsVariables.backgrowndColor,
      key: _scaffoldKey,
      drawer: Drawer(


          child:  DrawerTiles()
      ),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child:
              Image.asset('assets/app_icon/app_bar_icon/menu.png',)),
          trailing1: Container(),
          trailing2: Container(),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Invite Seller',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .05),),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){

                if(animatedheight==0){
                  setState(() {
                    animatedheight = 100;

                  });
                }else {
                  setState(() {
                    animatedheight = 0;

                  });
                }


              },
              child: Padding(
                padding:  EdgeInsets.only(left: size.width * .02,right: size.width * .02),
                child: Card(
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: size.width * .15,right: size.width * .15,top: size.width * .1,bottom: size.width * .1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                Text('Invite your Friends and get a \nbonus point for next purchase.',textAlign: TextAlign.center,
                  style: TextStyle(

                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04),),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('http://Bafdofjahscjk',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.pinkColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .04),),
                ),


        ],
        ),
                    )),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: size.width * .05,right: size.width * .05),
              child: AnimatedContainer(
                  height: animatedheight,
                  duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GradientButton(
                          onPressed: () {

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Icon(Icons.copy,color: Colors.white,),
                              Text(
                                'Copy Link',

                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04),
                              ),
                            ],
                          ),
                          borderRadius: 9,
                          height: size.width * .13,
                          width: size.width*.5,
                          gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
                        ),
                      ),

                      animatedheight==100?Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.pink),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(Icons.share,color: ColorsVariables.pinkColor,),
                          )):Container()

                    ],)


              ),
            ),
          ],
        ),
      ),
    );
  }
}
