import 'package:bafdo/model/priyo_manush_model.dart';
import 'package:bafdo/sub_pages/notifications_page.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widget_tile/priyomanush_list_tile.dart';
import 'package:bafdo/widgets/custom_appbar.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriyoManushList extends StatefulWidget {
  @override
  _PriyoManushListState createState() => _PriyoManushListState();
}

class _PriyoManushListState extends State<PriyoManushList> {

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BColors.appBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(
          leading: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png'),
          leadingPress: ()=>Navigator.pop(context),
          title: 'Priyo Manush',
          trailing: Stack(
            children: [
              Image.asset('assets/app_icon/app_bar_icon/notification.png'),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Text('7',
                  style: TextStyle(color: Colors.white,fontSize: 6,fontFamily: 'taviraj')),
                ),
              )
            ],
          ),
          trailingPress: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationPage())),
          trailing2: Container(),
        ),
      ),
      body: _bodyUI(size),
    );
  }

  Widget _bodyUI(Size size)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        ///Search Field
        TextField(
          style: PublicVariables.smallTextStyle(size),
          decoration: formDecoration(size).copyWith(
              hintText: 'Search Priyo Manush',
              suffixIcon: Image.asset('assets/app_icon/text_field_icon/search_active.png')
          ),
        ),
        SizedBox(height: 10.0),

        ///Priyo manush Listview
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: priyomanushDataList().length,
            itemBuilder: (context, index)=>PriyomanushListTile(
                priyoManushModel: priyomanushDataList()[index]),
          ),
        )
      ],
    ),
  );
}

