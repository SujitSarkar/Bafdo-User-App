import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class MaBafdo extends StatefulWidget {
  const MaBafdo({Key? key}) : super(key: key);

  @override
  _MaBafdoState createState() => _MaBafdoState();
}

class _MaBafdoState extends State<MaBafdo> {
  static const genderItems = <String>['Male', 'Female', 'Others'];
  static const yearItems = <String>[
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032',
    '2033',
    '2034',
    '2035',
    '2036',
    '2037',
    '2038',
    '2039',
    '2040',
    '2041',
    '2042',
    '2043',
    '2044',
    '2045',
    '2046',
    '2047',
    '2048',
    '2049',
    '2050',
  ];
  static const dayItems = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];
  static const monthItems = <String>[
    'January',
    'Februery',
    'March',
    'April',
    'May',
    'Jun',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<DropdownMenuItem<String>> _dropDownGenderItem = genderItems
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  final List<DropdownMenuItem<String>> _dropDownYearsItem = yearItems
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  final List<DropdownMenuItem<String>> _dropDownDaysItem = dayItems
      .map((String value) =>
          DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();

  final List<DropdownMenuItem<String>> _dropDownMonthsItem =
      monthItems.map((String value) {
    return DropdownMenuItem<String>(value: value, child: Text(value));
  }).toList();

  String _btnSelectedVal = 'Male';
  String _selectedYearValue = '1990';
  String _selectedDayValue = '01';
  String _selectedMothValue = 'January';

  bool phoneVarified = false;
  bool emailVarified = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: Text('Edit Profile'),
          trailing1: Image.asset('assets/app_icon/app_bar_icon/close.png'),
          trailing2: Container(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
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
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
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
                height: size.width * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: ListTile(
                  leading: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      elevation: 0,
                      dropdownColor: Colors.white,
                      items: this._dropDownGenderItem,
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
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            elevation: 0,
                            dropdownColor: Colors.white,
                            items: this._dropDownYearsItem,
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
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              elevation: 0,
                              dropdownColor: Colors.white,
                              items: this._dropDownDaysItem,
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
                    SizedBox(
                      width: size.width * .005,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              elevation: 0,
                              dropdownColor: Colors.white,
                              items: this._dropDownMonthsItem,
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
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            phoneVarified = !phoneVarified;
                          });
                        },
                        icon: phoneVarified == true
                            ? Image.asset(
                                'assets/app_icon/body_icon/varified_icon.png')
                            : Icon(Icons.edit_rounded),
                      ),
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: '+88017454545',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
                ),
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
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            emailVarified = !emailVarified;
                          });
                        },
                        icon: emailVarified == true
                            ? Image.asset(
                                'assets/app_icon/body_icon/varified_icon.png')
                            : Icon(Icons.edit_rounded),
                      ),
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'bafdo@gmail.com',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
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
              Container(
                height: size.width * .15,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit_rounded),
                      ),
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'House 16,Uttora 12',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: size.width * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * .1,
                          right: size.width * .1,
                          top: 13,
                          bottom: 13),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .1,
                  ),
                  Center(
                    child: GradientButton(
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
                      height: size.width * .13,
                      width: size.width * .4,
                      gradientColors: [
                        Colors.pink.shade600,
                        Colors.pink.shade400
                      ],
                    ),
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
                height: size.width * .13,
                width: size.width * .4,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
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
