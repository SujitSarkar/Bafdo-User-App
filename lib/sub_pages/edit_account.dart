import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffEFF9F9),
        resizeToAvoidBottomInset: true,
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
              'Edit Account',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w700,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .045),
            ),
          ),
        ),
        body: _bodyUI(size));
  }

  Widget _bodyUI(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: ListView(
        children: [
          SizedBox(
            height: size.width * .04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ///profile image preview
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/app_icon/body_icon/boys.png'),
                    radius: size.width * .16,
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child:
                          Image.asset('assets/app_icon/body_icon/camera.png'))
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.width * .06,
          ),
          Text(
            'User Information',
            style: TextStyle(
                color: Color(0xffC73C86),
                fontWeight: FontWeight.w700,
                fontSize: size.width * .06,
                fontFamily: 'nobile'),
          ),
          SizedBox(
            height: size.width * .06,
          ),

          ///first name & last name input
          _twoFieldRow(size, 'First Name', 'Saidul', 'Last Name', 'Khan'),
          SizedBox(
            height: size.width * .06,
          ),
          Text(
            'Email',
            style: TextStyle(
              color: Color(0xff757575),
              fontFamily: 'nobile',
              fontWeight: FontWeight.w400,
            ),
          ),

          ///Email input
          TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'taviraj',
              fontWeight: FontWeight.w500,
              fontSize: size.width * .04,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE9E9E9))),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE9E9E9))),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE9E9E9))),
            ),
          ),

          SizedBox(
            height: size.width * .06,
          ),

          ///gender & phone number input
          _twoFieldRow(size, 'Gender', 'Male', 'Phone', '+880 1478 594682'),
          SizedBox(
            height: size.width * .06,
          ),
          Text(
            'Address',
            style: TextStyle(
                color: Color(0xffC73C86),
                fontWeight: FontWeight.w700,
                fontSize: size.width * .06,
                fontFamily: 'nobile'),
          ),
          SizedBox(
            height: size.width * .06,
          ),

          ///Address input
          Row(
            children: [
              Image.asset(
                'assets/app_icon/body_icon/location.png',
                height: size.width * .08,
                width: size.width * .08,
              ),
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * .05,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),

          Divider(
            thickness: 1,
            color: Color(0xffE9E9E9),
          ),
          SizedBox(
            height: size.width * .06,
          ),

          ///save button
          Container(
            width: size.width,
            height: size.width * .12,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * .02),
                            side: BorderSide(color: Color(0xffC31A65))))),
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF1F9F9),
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04),
                )),
          )
        ],
      ),
    );
  }

  Widget _twoFieldRow(Size size, String fieldName1, String value1,
      String fieldName2, String value2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fieldName1,
                style: TextStyle(
                  color: Color(0xff757575),
                  fontFamily: 'nobile',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * .05),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * .04,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE9E9E9))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE9E9E9))),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE9E9E9))),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fieldName2,
                style: TextStyle(
                  color: Color(0xff757575),
                  fontFamily: 'nobile',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * .05),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * .04,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE9E9E9))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE9E9E9))),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE9E9E9))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
