import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseHistoryPage extends StatefulWidget {
  const PurchaseHistoryPage({Key? key}):super(key: key);

  @override
  _PurchaseHistoryPageState createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  int _counter = 0;
  bool _isLoading = false;

  Future<void> _customInit(PublicProvider publicProvider) async {
    _counter++;
      setState(()=>_isLoading = true);
      await publicProvider.getOrderList(userId: publicProvider.prefUserModel.id);
      setState(()=>_isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final UserProvider userProvider = Provider.of<UserProvider>(context);
    // final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if (_counter == 0) _customInit(publicProvider);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.width * .2),
        child: CustomAppBar(
          leading: InkWell(
              onTap: ()=> Navigator.pop(context),
              child:
              Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: ()=> Navigator.pop(context),
                child: Image.asset(
                  'assets/app_icon/app_bar_icon/close.png',
                )),
          ),
          trailing2: Container(),
          title: Text(
            'Purchase History',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w700,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      body:_isLoading ? showLoadingWidget : _bodyUI(size),
    );
  }

  Widget _bodyUI(Size size)=>SingleChildScrollView();
}
