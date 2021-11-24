import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/sub_pages/product_search_page.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widget_tile/order_list_tile.dart';
import 'package:bafdo/widgets/custom_appbar.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllOrderListPage extends StatefulWidget {

  @override
  _AllOrderListPageState createState() => _AllOrderListPageState();
}

class _AllOrderListPageState extends State<AllOrderListPage> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  List<String> _stateList=['All','Unpaid','Confirmed','Processing','Shipped','Delivered'];
  String _selectedOrderState='All';

  int _counter = 0;
  bool _isLoading = false;

  Future<void> _customInit(PublicProvider publicProvider) async {
    _counter++;
    if(publicProvider.purchaseHistoryModel==null){
      setState(()=>_isLoading = true);
      await publicProvider.getOrderList(userId: publicProvider.prefUserModel.id);
      setState(()=>_isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _stateList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if (_counter == 0) _customInit(publicProvider);
    return Scaffold(
      backgroundColor: BColors.appBgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomAppBar(
            leading: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png'),
            leadingPress: ()=>Navigator.pop(context),
            title: 'Orders',
            trailing: Image.asset('assets/app_icon/app_bar_icon/close.png'),
            trailingPress: ()=>Navigator.pop(context),
            trailing2: Container(),
          ),
      ),
      body:_isLoading
          ?showLoadingWidget
          :_bodyUI(size,publicProvider),
    );
  }

  Widget _bodyUI(Size size,PublicProvider publicProvider)=>Column(
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
        child: RefreshIndicator(
          onRefresh: ()async=> await publicProvider.getOrderList(userId: publicProvider.prefUserModel.id),
          backgroundColor: Colors.white,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: publicProvider.purchaseHistoryModel.data.length,
            itemBuilder: (context, index)=>
            _selectedOrderState==publicProvider.purchaseHistoryModel.data[index].paymentStatusString!||_selectedOrderState=='All'
                ?OrderListTile(orderModel: publicProvider.purchaseHistoryModel.data[index])
                :Container(),
          ),
        ),
      )
    ],
  );
}
