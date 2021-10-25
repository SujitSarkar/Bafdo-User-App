import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/outline_button.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/drawer_nav_page.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/nav_page-appbar.dart';
import 'package:flutter/material.dart';

class MaBafdo extends StatefulWidget {
  const MaBafdo({Key? key}) : super(key: key);

  @override
  _MaBafdoState createState() => _MaBafdoState();
}

class _MaBafdoState extends State<MaBafdo> {


  String _btnSelectedVal = 'Male';
  String _selectedYearValue = '1990';
  String _selectedDayValue = '01';
  String _selectedMothValue = 'January';

  bool phoneVarified = false;
  bool emailVarified = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavPageAppBar(openDrawer: ()=>_scaffoldKey.currentState!.openDrawer()),
      ),
      drawer: DrawerNavPage(),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile Completed',
                  style: TextStyle(
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .05,
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.pink.shade400,
                      radius: size.width * .04,
                      child: Text('0%',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * .03,
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: size.width * .2,
                        color: Color(0xffC31A65),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.pink.shade400,
                      radius: size.width * .04,
                      child: Text('25%',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * .03,
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: size.width * .2,
                        color: Color(0xffC31A65),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.pink.shade400,
                      radius: size.width * .04,
                      child: Text('50%',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * .03,
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: size.width * .25,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text('Personal informations',
                  style: TextStyle(
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .05,
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500)),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text('Name',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: myBafdoFormDecoration(size),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text('Gender',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                width: size.width * .35,
                height: size.width * .11,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.grey)),
                child:  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      elevation: 0,
                      isDense: true,
                      dropdownColor: Colors.white,
                      items: PublicVariables.dropDownGenderItem,
                      value: _btnSelectedVal,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _btnSelectedVal = newValue;
                          });
                        }
                      },
                    ),
                  ),

              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text('Birthday',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            elevation: 0,
                            dropdownColor: Colors.white,
                            items: PublicVariables.dropDownYearsItem,
                            value: _selectedYearValue,
                            style: TextStyle(
                              color: ColorsVariables.textColor,
                              fontSize: size.width * .04,
                              fontFamily: 'taviraj',
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  _selectedYearValue = newValue;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              elevation: 0,
                              isDense: true,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              items: PublicVariables.dropDownDaysItem,
                              value: _selectedDayValue,
                              style: TextStyle(
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .04,
                                fontFamily: 'taviraj',
                              ),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedDayValue = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              elevation: 0,
                              isDense: true,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              items: PublicVariables.dropDownMonthsItem,
                              value: _selectedMothValue,
                              style: TextStyle(
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .04,
                                fontFamily: 'taviraj',
                              ),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedMothValue = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text('Mobile number',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              TextField(
                decoration: myBafdoFormDecoration(size).copyWith(
                  suffixIcon: Icon(Icons.edit_rounded),
                  hintText: '+88017454545',
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text('Email',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              TextField(
                decoration: myBafdoFormDecoration(size).copyWith(
                  suffixIcon: Icon(Icons.edit_rounded),
                  hintText: '+bafdo@gmail.com',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text('Address',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              TextField(
                decoration: myBafdoFormDecoration(size).copyWith(
                  suffixIcon: Icon(Icons.edit_rounded),
                  hintText: 'House 16, Uttara 12',
                ),
              ),
              SizedBox(height: size.width * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomOutlineButton(
                      child: Text('Cancel'),
                      onPressed: (){},
                      borderRadius: 5.0,
                      height: size.width*.1,
                      width: size.width * .4,
                      borderColor: Colors.grey,
                      splashColor: Colors.pink.shade200),
                  SizedBox(
                    width: size.width * .1,
                  ),
                  GradientButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.splashSkip,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                    borderRadius: 6.97,
                    height: size.width * .1,
                    width: size.width * .4,
                    gradientColors: [
                      Colors.pink.shade600,
                      Colors.pink.shade400
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .06,
              ),
              Text('Change Password',
                  style: TextStyle(
                      color: ColorsVariables.textColor,
                      fontSize: size.width * .05,
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500)),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Text('Old Password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * .05,
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500)),
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: '*************',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Text('New Password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * .05,
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500)),
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: '*************',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Text('Confirm Password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * .05,
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500)),
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: '*************',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: size.width * .08,
              ),
              GradientButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.splashSkip,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .045),
                ),
                borderRadius: 6.97,
                height: size.width * .1,
                width: size.width * .4,
                gradientColors: [
                  Colors.pink.shade600,
                  Colors.pink.shade400
                ],
              ),
              SizedBox(
                height: size.width * .5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
