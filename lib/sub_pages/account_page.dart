import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/sub_pages/edit_account.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
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
      body: _bodyUI(context, size),
    );
  }

  Widget _bodyUI(BuildContext context, Size size) {
    return ListView(
      children: [
        SizedBox(
          height: size.width * .05,
        ),

        /// Card design
        _userVerifiedCard(context, size),
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

  Widget _userVerifiedCard(BuildContext context, Size size) {
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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),

                    ///profile image preview
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/app_icon/body_icon/boys.png'),
                      radius: size.width * .13,
                    ),
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
                          'Saidul Khan',
                          style: TextStyle(
                              color: Color(0xffFF4DAB),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'taviraj',
                              fontSize: size.width * .055),
                        ),
                        SizedBox(
                          width: size.width * .04,
                        ),

                        ///email preview
                        Text(
                          'user123@gmail.com',
                          style: TextStyle(
                              color: Color(0xff757575),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'taviraj',
                              fontSize: size.width * .045),
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
              SizedBox(
                height: size.width * .04,
              ),

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
