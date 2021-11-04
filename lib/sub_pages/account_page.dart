import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/provider/user_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/sub_pages/edit_account.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _counter = 0;
  bool _isLoading = true;

  Future<void> _customInit(UserProvider userProvider, AuthProvider authProvider) async {
    _counter++;
    print(authProvider.isPrefNull);
    if (authProvider.isPrefNull) {
      Future.delayed(Duration(microseconds: 1)).then((value) {
        setState(() => _isLoading = false);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginWithNumber()));
      });
    } else {
      if (userProvider.userModel == null) {
        await userProvider.getUserByToken();
        setState(() => _isLoading = false);
      } else
        setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    if (_counter == 0) _customInit(userProvider, authProvider);
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
            'Profile',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.w700,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .045),
          ),
        ),
      ),
      body:_isLoading ? showLoadingWidget : _bodyUI(size,userProvider),
    );
  }

  Widget _bodyUI(Size size, UserProvider userProvider) {
    return ListView(
      children: [
        SizedBox(
          height: size.width * .05,
        ),

        /// Card design
        _userVerifiedCard(size, userProvider),
        SizedBox(
          height: size.width * .05,
        ),
        _option(size, 'assets/app_icon/body_icon/user.png', 'My Account',
            Icons.chevron_right_outlined),
        _option(size, 'assets/app_icon/body_icon/notification.png',
            'Notifications', Icons.chevron_right_outlined),
        _option(size, 'assets/app_icon/body_icon/sliders.png', 'Settings',
            Icons.chevron_right_outlined),
        _option(size, 'assets/app_icon/body_icon/help.png', 'Help',
            Icons.chevron_right_outlined),
        _option(size, 'assets/app_icon/body_icon/logout.png', 'Logout', null)
      ],
    );
  }

  Widget _userVerifiedCard(Size size, UserProvider userProvider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .06),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size.width * .06)),
          padding: EdgeInsets.symmetric(
              vertical: size.width * .04, horizontal: size.width * .05),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: userProvider.userModel!.avatarOriginal!.isNotEmpty
                        ? CachedNetworkImage(
                        imageUrl: 'https://bafdo.com/public/${userProvider.userModel!.avatarOriginal!}',
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: size.width*.3,
                        width: size.width*.3,
                        fit: BoxFit.cover
                    ) : Container(
                        color: Colors.grey.shade300,
                        child: Icon(Icons.person,color: Colors.pink,size: size.width*.3)),
                  ),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ///username preview
                        Text(
                          userProvider.userModel!.name??'',
                          style: TextStyle(
                              color: Color(0xffFF4DAB),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'taviraj',
                              fontSize: size.width * .055),
                        ),
                        SizedBox(width: size.width * .04),

                        ///email preview
                        userProvider.userModel!.email!=null
                            ?Text(
                          userProvider.userModel!.email??'',
                          style: TextStyle(
                              color: Color(0xff757575),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'taviraj',
                              fontSize: size.width * .04),
                        ):Text(
                          userProvider.userModel!.phone??'',
                          style: TextStyle(
                              color: Color(0xff757575),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'taviraj',
                              fontSize: size.width * .04),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * .05),
                            color: Color(0xff43D76A),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .04,
                              vertical: size.width * .015),
                          child: Text(
                            'Verified',
                            style: TextStyle(
                                color: Color(0xffF1F9F9),
                                fontWeight: FontWeight.w400,
                                fontSize: size.width * .04),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: size.width * .04),

              /// Edit Account Button
              Container(
                width: size.width,
                height: size.width * .12,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccount()));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(size.width * .02),
                                    side:
                                        BorderSide(color: Color(0xffFF4DAB))))),
                    child: Text(
                      'Edit Account',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF1F9F9),
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _option(
      Size size, String leadingImage, String title, IconData? iconData) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            leadingImage,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Color(0xff1A1C3D),
                fontSize: size.width * .04,
                fontWeight: FontWeight.w500),
          ),
          trailing: Icon(iconData),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Divider(
            thickness: size.width * .002,
            color: Color(0xffD8D8D8),
          ),
        )
      ],
    );
  }
}
