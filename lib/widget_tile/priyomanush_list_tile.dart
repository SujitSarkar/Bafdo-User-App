import 'package:bafdo/model/priyo_manush_model.dart';
import 'package:bafdo/pages/all_order_page.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriyomanushListTile extends StatelessWidget {
  PriyoManushModel priyoManushModel;
  PriyomanushListTile({required this.priyoManushModel});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
    final Size size= MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(priyoManushModel.imageLink!,width: 80,height: 80,fit: BoxFit.fitHeight),
          SizedBox(width: 5),
          Expanded(
            child: RichText(
              text: TextSpan(
                //text: 'Hello ',
                style: PublicVariables.smallTextStyle(size).copyWith(color: Colors.grey.shade800,fontSize: size.width*.034),
                children: <TextSpan>[
                  TextSpan(text: '${priyoManushModel.name!}\n',style: TextStyle(color: Colors.black,fontSize: size.width*.04)),
                  TextSpan(text: 'Relations: ${priyoManushModel.relation}\n'),
                  TextSpan(text: 'Special Day: ${priyoManushModel.specialDay}\n'),
                  TextSpan(text: 'Date: ',style: TextStyle(color: Colors.black,fontSize: size.width*.036)),
                  TextSpan(text: '${priyoManushModel.date}'),
                ],
              ),
            ),
          ),
          PopupMenuButton<int>(
            key: _key,
            icon: Icon(Icons.adaptive.more,color: BColors.greyColor),
            onSelected: (int val){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AllOrderListPage()));
            },
            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                    child: Row(
                  children: [
                    Icon(Icons.edit,size: size.width*.05),
                    Text(' Edit',style: PublicVariables.popupMenuTextStyle(size)),
                  ],
                ), value: 1),
                PopupMenuItem(
                  child: Row(
                  children: [
                    Icon(CupertinoIcons.delete,size: 16.0),
                    Text(' Remove',style: PublicVariables.popupMenuTextStyle(size)),
                  ],
                ), value: 2,),
              ];
            },
            tooltip: 'Select options',
            offset: Offset(0,40.0),
          )
        ],
      ),
    );
  }
}
