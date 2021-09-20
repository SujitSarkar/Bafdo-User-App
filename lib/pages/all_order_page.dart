import 'package:bafdo/sub_pages/notifications_page.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widget_tile/order_list_tile.dart';
import 'package:bafdo/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AllOrderListPage extends StatefulWidget {

  @override
  _AllOrderListPageState createState() => _AllOrderListPageState();
}

class _AllOrderListPageState extends State<AllOrderListPage> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  List<String> _stateList=[
    'All','Unpaid','Confirmed','Processing','Shipped','Delivered'
  ];
  String? _selectedOrderState;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _stateList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: BColors.appBgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomAppBar(
            leading: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png'),
            leadingPress: ()=>Navigator.pop(context),
            title: 'Orders',
            trailing: Image.asset('assets/app_icon/text_field_icon/search_icon.png'),
            trailingPress: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductSearchPage())),
            trailing2: Container(),
          ),
      ),
      body: _bodyUI(size),
    );
  }

  Widget _bodyUI(Size size)=>Column(
    children: [
      ///Tab bar
      TabBar(
        onTap: (covariant) async {
          setState(() {
            _selectedOrderState= _stateList.elementAt(covariant);
          });
        },
        isScrollable: true,
        controller: _tabController,
        indicator: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 2.4,
                  color: Colors.pink,
                ))),
        //indicatorColor: Colors.green,
        indicatorSize: TabBarIndicatorSize.label,
        physics: BouncingScrollPhysics(),
        tabs: _stateList.map<Widget>((item)=>
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text(item,
                  style: PublicVariables.hintSmallTextStyle(size).copyWith(
                      color: _selectedOrderState==item? Colors.pink:Colors.grey
                  )),
            )).toList(),
      ),
      SizedBox(height: 10.0),

      ///Order List
      Expanded(
        child: ListView.builder(
          //shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 40,
          itemBuilder: (context, index)=>OrderListTile(),
        ),
      )
    ],
  );
}
