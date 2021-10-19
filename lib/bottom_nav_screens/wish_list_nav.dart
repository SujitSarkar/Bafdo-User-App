import 'package:bafdo/colors.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/widgets/drawer_nav_page.dart';
import 'package:bafdo/widgets/nav_page-appbar.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:provider/provider.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:flutter/material.dart';

class WishListNav extends StatefulWidget {
  const WishListNav({Key? key}) : super(key: key);

  @override
  _WishListNavState createState() => _WishListNavState();
}

class _WishListNavState extends State<WishListNav>{
  // List<String> categoryList = [
  //   'Wife',
  //   'Eid',
  //   'For Children',
  //   'For Children',
  // ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _counter=0;
  Future<void> _fetch(PublicProvider publicProvider)async{
    setState(() => _counter++);
    if(publicProvider.wishlistModel==null) await publicProvider.fetchWishList();
  }

  @override
  Widget build(BuildContext context){
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final Size size = MediaQuery.of(context).size;
    if(_counter==0) _fetch(publicProvider);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffEFF9F9),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavPageAppBar(openDrawer: ()=>_scaffoldKey.currentState!.openDrawer()),
      ),
      drawer: DrawerNavPage(),
      body: SafeArea(
       child: RefreshIndicator(
         onRefresh: ()async{
           await publicProvider.fetchWishList();
         },
         backgroundColor: Colors.white,
         child: publicProvider.wishlistModel!=null
             ?publicProvider.wishlistModel!.data!.isNotEmpty
             ?ListView.builder(
               itemCount: publicProvider.wishlistModel!.data!.length,
               physics: ClampingScrollPhysics(),
               shrinkWrap: true,
               itemBuilder: (context, index) {
                 return Container(
                   margin: EdgeInsets.symmetric(horizontal: size.width*.04),
                   child: Column(
                     children: [
                       InkWell(
                           onTap: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => ProductDetail(productId: publicProvider.wishlistModel!.data![index].product!.id,)));
                           },
                           child: Row(
                             children: [
                               Container(
                                 width: size.width * .25,
                                 height: size.width * .25,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(9.5),
                                 ),
                                 padding: EdgeInsets.all(size.width * .04),
                                 child: Image.network(
                                   'https://bafdo.com/public/${publicProvider.wishlistModel!.data![index].product!.thumbnailImage!}',
                                   fit: BoxFit.fill,
                                 ),
                               ),
                               Expanded(
                                   child: Container(
                                     padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                                     child: Column(
                                       children: [
                                         Row(
                                           children: [
                                             Text(
                                               'Title: ',
                                               style: TextStyle(
                                                   fontFamily: 'taviraj',
                                                   fontWeight: FontWeight.normal,
                                                   color: ColorsVariables.textColor,
                                                   fontStyle: FontStyle.normal,
                                                   fontSize: size.width * .037),
                                             ),
                                             Text(
                                               publicProvider.wishlistModel!.data![index].product!.name!,
                                               style: TextStyle(
                                                   fontFamily: 'taviraj',
                                                   fontWeight: FontWeight.w500,
                                                   color: ColorsVariables.textColor,
                                                   fontStyle: FontStyle.normal,
                                                   fontSize: size.width * .037),
                                             ),
                                           ],
                                         ),
                                         SizedBox(height: size.width * .01),
                                         // Row(
                                         //   children: [
                                         //     Text(
                                         //       'Category: ',
                                         //       style: TextStyle(
                                         //           fontFamily: 'taviraj',
                                         //           fontWeight: FontWeight.w500,
                                         //           color: ColorsVariables.pinkCategoryTextColor,
                                         //           fontStyle: FontStyle.normal,
                                         //           fontSize: size.width * .035),
                                         //     ),
                                         //     Text(
                                         //       'Computer & Acce...',
                                         //       style: TextStyle(
                                         //           fontFamily: 'taviraj',
                                         //           fontWeight: FontWeight.w500,
                                         //           color: ColorsVariables.pinkCategoryTextColor,
                                         //           fontStyle: FontStyle.normal,
                                         //           fontSize: size.width * .035),
                                         //     ),
                                         //   ],
                                         // ),
                                         // SizedBox(
                                         //   height: size.width * .01,
                                         // ),
                                         publicProvider.wishlistModel!=null?Row(
                                             children: [
                                               publicProvider.wishlistModel!.data![index].product!.rating==1?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==2?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==3?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==0.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))                                                :Icon(Icons.star_border,size: size.width * .032,),
                                               publicProvider.wishlistModel!.data![index].product!.rating==2?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==3?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==1.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :Icon(Icons.star_border,size: size.width * .032,),
                                               publicProvider.wishlistModel!.data![index].product!.rating==3?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==2.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :Icon(Icons.star_border,size: size.width * .032,),
                                               publicProvider.wishlistModel!.data![index].product!.rating==4?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==3.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :Icon(Icons.star_border,size: size.width * .032,),
                                               publicProvider.wishlistModel!.data![index].product!.rating==5?Icon(Icons.star, size: size.width * .032, color: Color(0xffC31A65))
                                                   :publicProvider.wishlistModel!.data![index].product!.rating==4.5?Icon(Icons.star_half,size: size.width * .032, color: Color(0xffC31A65))
                                                   :Icon(Icons.star_border,size: size.width * .032,),
                                             ]
                                         ):Container(),
                                         SizedBox(
                                           height: size.width * .01,
                                         ),
                                         Row(
                                           children: [
                                             Text(
                                               publicProvider.wishlistModel!.data![index].product!.basePrice!,
                                               style: TextStyle(
                                                   fontFamily: 'taviraj',
                                                   fontWeight: FontWeight.w500,
                                                   color: ColorsVariables.textColor,
                                                   fontStyle: FontStyle.normal,
                                                   fontSize: size.width * .038),
                                             ),
                                           ],
                                         ),
                                       ],
                                     ),
                                   )),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   // InkWell(
                                   //   onTap: () {},
                                   //   child: Icon(
                                   //     Icons.more_vert,
                                   //     color: Colors.black,
                                   //   ),
                                   // ),
                                   PopupMenuButton<String>(
                                     icon: Icon(Icons.more_vert),
                                     onSelected: (String result) {
                                       switch (result) {
                                         case 'Add to cart':
                                           showLoadingDialog(context);
                                           publicProvider.addCart(publicProvider.wishlistModel!.data![index].product!.id!, 1).then((value)async{
                                             await publicProvider.fetchCartList();
                                             closeLoadingDialog(context);
                                             showToast('Product added to cart');
                                           });
                                           break;
                                         case 'Delete':
                                           showLoadingDialog(context);
                                           publicProvider.deleteWishList(publicProvider.wishlistModel!.data![index].product!.id!).then((value)async{
                                             await publicProvider.fetchWishList();
                                             closeLoadingDialog(context);

                                             showToast("Removed from wishlist");
                                           });
                                           break;
                                         default:
                                       }
                                     },
                                     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                       const PopupMenuItem<String>(
                                         value: 'Add to cart',
                                         child: Text('Add to cart',style: TextStyle(fontWeight: FontWeight.bold),),
                                       ),
                                       const PopupMenuItem<String>(
                                         value: 'Delete',
                                         child: Text('Delete',style: TextStyle(fontWeight: FontWeight.bold)),
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                             ],
                           )),
                       SizedBox(height: size.width*.03),

                       Divider(
                         color: Color(0xffA7A6A8),
                         height: size.width * .01,
                       ),
                       SizedBox(height: size.width*.03),
                     ],
                   ),
                 );
               },
             )
             :Center(
           child: Text('Empty Wishlist !',
             style:TextStyle(
                 fontFamily: 'taviraj',
                 color: ColorsVariables.textColor,
                 fontWeight: FontWeight.w500,
                 fontSize: size.width*.045)),
         ):Center(
           child: Text('Empty Wishlist !',
               style:TextStyle(
                   fontFamily: 'taviraj',
                   color: ColorsVariables.textColor,
                   fontWeight: FontWeight.w500,
                   fontSize: size.width*.045)),
         ),
       )
      ),
    );
  }
}
