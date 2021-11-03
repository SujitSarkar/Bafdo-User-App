import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/provider/user_provider.dart';
import 'package:bafdo/sub_pages/account_page.dart';
import 'package:bafdo/sub_pages/edit_account.dart';
import 'package:bafdo/widgets/drawer_nav_page.dart';
import 'package:bafdo/widgets/nav_page-appbar.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _counter=0;
  bool _isLoading=true;

  Future<void> _customInit(UserProvider userProvider,AuthProvider authProvider)async{
    _counter++;
    print(authProvider.isPrefNull);
    if(authProvider.isPrefNull){
      Future.delayed(Duration(microseconds: 1)).then((value){
        setState(()=>_isLoading=false);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginWithNumber()));
      });
    }else{
      if(userProvider.userModel==null) {
        await userProvider.getUserByToken();
        setState(()=>_isLoading=false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    if(_counter==0) _customInit(userProvider,authProvider);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffEFF9F9),
      drawer: DrawerNavPage(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavPageAppBar(openDrawer: () => _scaffoldKey.currentState!.openDrawer())
      ),
      body: _isLoading
          ? showLoadingWidget
          : _bodyUI(size, userProvider),
    );
  }

  Widget _bodyUI(Size size,UserProvider userProvider) {
    return Column(
      children: [
        SizedBox(height: size.width * .04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [

                ///profile image preview
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/app_icon/body_icon/boys.png'),
                  radius: size.width * .18,
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Image.asset(
                        'assets/app_icon/app_bar_icon/edit_profile.png'))
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.width * .04,
        ),

        ///Username preview
        Container(
          width: size.width,
          child: Text(
            'Saidul Khan',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffFF4DAB),
                fontWeight: FontWeight.w600,
                fontFamily: 'taviraj',
                fontSize: size.width * .06),
          ),
        ),
        SizedBox(
          height: size.width * .06,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffC31A65), Color(0xffFA4494)]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(
                    vertical: size.width * .04, horizontal: size.width * .04),
                child: _textView('My Profile',userProvider),
              ),
              _textView('Account',userProvider),
              _textView('Settings',userProvider),
            ],
          ),
        ),
        SizedBox(
          height: size.width * .06,
        ),

        ///Display user info
        _userInfo(size, 'assets/app_icon/profile_icon/person_outlined.png',
            'Name', 'Saidul Khan'),
        SizedBox(
          height: size.width * .02,
        ),
        _userInfo(size, 'assets/app_icon/profile_icon/message_outlined.png',
            'Email', 'saidulkhan@gmail.com'),
        SizedBox(
          height: size.width * .02,
        ),
        _userInfo(size, 'assets/app_icon/profile_icon/phone_outlined.png',
            'Phone', '+880 123 147 895'),
        SizedBox(
          height: size.width * .02,
        ),
        _userInfo(size, 'assets/app_icon/profile_icon/location_outlined.png',
            'Address', 'Long beach, California'),
        SizedBox(
          height: size.width * .02,
        ),
      ],
    );
  }

  Widget _textView(String title, UserProvider userProvider) {
    return InkWell(
      onTap: ()async {
        title == 'Account'
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => AccountPage()))
            : title == 'Settings'
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditAccount()))
                : await userProvider.getUserByToken();
      },
      child: Text(
        title,
        style: TextStyle(
          color: title == 'My Profile' ? Color(0xffF7F5F5) : Color(0xffA7A6A8),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _userInfo(Size size, String icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xff222232),
            child: Image.asset(icon),
          ),
          SizedBox(
            width: size.width * .04,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Color(0xffA7A6A8),
                      fontSize: size.width * .05,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.width * .025,
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: Color(0xffC4C4C4),
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.width * .02,
                ),
                Divider(
                  thickness: size.width * .002,
                  color: Color(0xff222232),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * .04,
          ),
          Column(
            children: [
              SizedBox(
                height: size.width * .03,
              ),
              Icon(
                Icons.chevron_right_outlined,
                color: Color(0xffA7A6A8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
