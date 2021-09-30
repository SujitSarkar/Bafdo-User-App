import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/custom_widget/red_folder_list_tile.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:provider/provider.dart';
import '../sub_pages/new_collection_dialog.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/wish_list_details.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class WishListNav extends StatefulWidget {
  const WishListNav({Key? key}) : super(key: key);

  @override
  _WishListNavState createState() => _WishListNavState();
}

class _WishListNavState extends State<WishListNav> {
  // List<String> categoryList = [
  //   'Wife',
  //   'Eid',
  //   'For Children',
  //   'For Children',
  // ];
  @override
  Widget build(BuildContext context) {
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        // backgroundColor: Color(0xffF7F5F5),
        preferredSize: Size.fromHeight(size.width * .2),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/app_icon/app_bar_icon/close.png',
                )),
          ),
          trailing2: Container(),
          title: Text(
            'Wish List',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w700,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
       child: SingleChildScrollView(
         child: Container(
           width: size.width,
           padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .000,//.045,
               size.width * .045, size.width * .28),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               // Padding(
               //   padding: EdgeInsets.only(
               //     bottom: size.width * .045,
               //   ),
               //   child: Text('Your List (3)',
               //       style: TextStyle(
               //           fontFamily: 'taviraj',
               //           fontWeight: FontWeight.w500,
               //           color: ColorsVariables.textColor,
               //           fontStyle: FontStyle.normal,
               //           fontSize: size.width * .04)),
               // ),
               // Column(
               //   crossAxisAlignment: CrossAxisAlignment.start,
               //   children: [
               //     Container(
               //       width: size.width,
               //       // height: size.width,
               //       child: GridView.builder(
               //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //             crossAxisCount: 3,
               //             crossAxisSpacing: size.width * .02,
               //             childAspectRatio: .7),
               //         physics: ClampingScrollPhysics(),
               //         shrinkWrap: true,
               //         itemCount: categoryList.length + 1,
               //         itemBuilder: (context, index) {
               //           if (categoryList.length == index) {
               //             return InkWell(
               //               onTap: (){
               //                 showDialog(
               //                   context: context,
               //                   builder: (_) => NewCollectionDialog(),
               //                 );
               //
               //
               //               },
               //               child: Padding(
               //                 padding: EdgeInsets.only(
               //                     bottom: size.width * .13,
               //                     top: size.width * .013,
               //                     right: size.width * .013,
               //                     left: size.width * .013),
               //                 child: DottedBorder(
               //                   borderType: BorderType.RRect,
               //                   radius: Radius.circular(size.width * .02),
               //                   child: Center(
               //                       child: Icon(Icons.add, size: size.width * .12)),
               //                 ),
               //               ),
               //             );
               //           }
               //
               //           return InkWell(
               //               onTap: () {
               //                 Navigator.push(
               //                     context,
               //                     MaterialPageRoute(
               //                         builder: (_) => WishListDetails()));
               //                 print(index);
               //               },
               //               child: getRedFolder(context, categoryList, index));
               //         },
               //       ),
               //     ),
               //   ],
               // ),
               // Divider(
               //   color: Colors.grey,
               //   height: size.width * .01,
               // ),
               // Row(
               //   children: [
               //     Text('All products',
               //         style: TextStyle(
               //             fontFamily: 'taviraj',
               //             fontWeight: FontWeight.w500,
               //             color: ColorsVariables.textColor,
               //             fontStyle: FontStyle.normal,
               //             fontSize: size.width * .045)),
               //     Expanded(
               //         child: Container(
               //             alignment: Alignment.centerRight,
               //             child: Icon(Icons.edit))),
               //   ],
               // ),
               // Divider(
               //   color: Colors.grey,
               //   height: size.width * .01,
               // ),
               publicProvider.wishlistModel!=null?Container(
                 child: ListView.builder(
                   itemCount: publicProvider.wishlistModel!.data!.length,
                   physics: ClampingScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context, index) {
                     return Container(
                       child: Column(
                         children: [
                           // SizedBox(
                           //   height: size.width * .035,
                           // ),
                           InkWell(
                               onTap: () {
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => ProductDetail(productId: publicProvider.wishlistModel!.data![index].product!.id,)));
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
                                             SizedBox(
                                               height: size.width * .01,
                                             ),
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
                                                 // Image.asset(
                                                 //   'assets/app_icon/body_icon/tk.png',
                                                 // ),
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
                           SizedBox(
                             height: size.width * .035,
                           ),
                           Divider(
                             color: Color(0xffA7A6A8),
                             height: size.width * .01,
                           ),
                         ],
                       ),
                     );
                   },
                 ),
               ):Container(),
               SizedBox(
                 height: size.width * .03,
               ),
               // Row(
               //   children: [
               //     Text('More To Love',
               //         style: TextStyle(
               //             fontFamily: 'taviraj',
               //             color: ColorsVariables.textColor,
               //             fontStyle: FontStyle.normal,
               //             fontWeight: FontWeight.w500,
               //             fontSize: size.width * .045)),
               //     Expanded(
               //       child: Container(
               //           alignment: Alignment.centerRight,
               //           child: Text('See More',
               //               style: TextStyle(
               //                   fontFamily: 'taviraj',
               //                   color: ColorsVariables.textColor,
               //                   fontStyle: FontStyle.normal,
               //                   fontSize: size.width * .04))),
               //     )
               //   ],
               // ),
               // SizedBox(
               //   height: size.width * .03,
               // ),
               // Container(
               //   width: size.width,
               //   child: GridView.builder(
               //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //           crossAxisCount: 2,
               //           crossAxisSpacing: size.width * .001,
               //           mainAxisSpacing: size.width * .01,
               //           childAspectRatio: .79),
               //       physics: ClampingScrollPhysics(),
               //       shrinkWrap: true,
               //       itemCount: 2,
               //       itemBuilder: (context, index) {
               //         return FeatureCategoryListTile();
               //       }),
               // ),
               // SizedBox(
               //   height: size.width * .3,
               // ),
             ],
           ),
         ),
       )
      ),
    );
  }
}
