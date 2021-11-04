import 'dart:convert';
import 'dart:io';

import 'package:bafdo/pages/login_with_number.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/provider/user_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  int _counter = 0;
  bool _isLoading = true;
  File? _image;
  TextEditingController _name=TextEditingController(text: '');
  TextEditingController _email=TextEditingController(text: '');
  TextEditingController _phone=TextEditingController(text: '');

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
    _name.text = userProvider.userModel!.name??'';
    _email.text = userProvider.userModel!.email??'';
    _phone.text = userProvider.userModel!.phone??'';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    if (_counter == 0) _customInit(userProvider, authProvider);

    return Scaffold(
        backgroundColor: Color(0xffEFF9F9),
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.width * .2),
          child: CustomAppBar(
            leading: InkWell(
                onTap: ()=>Navigator.pop(context),
                child:
                    Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
            trailing1: Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                  onTap: ()=>Navigator.pop(context),
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
        body:_isLoading ? showLoadingWidget : _bodyUI(size,userProvider));
  }

  Widget _bodyUI(Size size,UserProvider userProvider) {
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
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: InkWell(
                        onTap: ()=>_getImage(userProvider),
                          child: Image.asset('assets/app_icon/body_icon/camera.png')))
                ],
              ),
            ],
          ),
          SizedBox(height: size.width * .06),
          Text(
            'User Information',
            style: TextStyle(
                color: Color(0xffC73C86),
                fontWeight: FontWeight.w700,
                fontSize: size.width * .06,
                fontFamily: 'nobile'),
          ),
          SizedBox(height: size.width * .06),

          _textBuilder(size, 'Full Name'),
          _textBuilder(size, 'Phone Number'),
          _textBuilder(size, 'Email Address'),

          // SizedBox(height: size.width * .06),
          // Text(
          //   'Address',
          //   style: TextStyle(
          //       color: Color(0xffC73C86),
          //       fontWeight: FontWeight.w700,
          //       fontSize: size.width * .06,
          //       fontFamily: 'nobile'),
          // ),
          // SizedBox(height: size.width * .06),

          // ///Address input
          // Row(
          //   children: [
          //     Image.asset(
          //       'assets/app_icon/body_icon/location.png',
          //       height: size.width * .08,
          //       width: size.width * .08,
          //     ),
          //     Expanded(
          //       child: TextFormField(
          //         cursorColor: Colors.black,
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontFamily: 'taviraj',
          //           fontWeight: FontWeight.w500,
          //           fontSize: size.width * .05,
          //         ),
          //         decoration: InputDecoration(
          //           focusedBorder: InputBorder.none,
          //           enabledBorder: InputBorder.none,
          //           disabledBorder: InputBorder.none,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          ///save button
          Container(
            width: size.width,
            height: size.width * .12,
            child: ElevatedButton(
                onPressed: () async{
                  await userProvider.profileUpdate(_name.text, _email.text);
                },
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

  Widget _textBuilder(Size size,String title)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color(0xff757575),
          fontFamily: 'nobile',
          fontWeight: FontWeight.w400,
        ),
      ),

      TextFormField(
        controller: title=='Full Name'
            ?_name
            :title=='Phone Number'
            ?_phone
            :_email,
        readOnly: title=='Phone Number'?true:false,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'taviraj',
          fontWeight: FontWeight.w500,
          fontSize: size.width * .04),
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
      //Divider(thickness: 1, color: Color(0xffE9E9E9)),
      SizedBox(height: size.width * .06),
    ],
  );

  Future<void> _getImage(UserProvider userProvider) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));

      String base64Image = base64Encode(_image!.readAsBytesSync());
      String fileName = _image!.path.split("/").last;
      showLoadingDialog(context);
      await userProvider
          .profileImageUpdate(base64Image, fileName)
          .then((value) {
        if (value) {
          showToast('Success');
          Navigator.pop(context);
        } else {
          showToast('Failed!');
          Navigator.pop(context);
        }
      });
    } else
      showToast('Image not selected');
  }
}
