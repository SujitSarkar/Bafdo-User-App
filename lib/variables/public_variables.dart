import 'package:flutter/material.dart';
import 'colors.dart';
import 'color_variable.dart';

class PublicVariables{
  static hintSmallTextStyle(Size size)=> TextStyle(
  fontSize: size.width*.038,
  color: BColors.greyColor,
  fontFamily: 'taviraj',
  //fontWeight: FontWeight.bold
  );
  static smallTextStyle(Size size)=> TextStyle(
    fontSize: size.width*.038,
    color: BColors.fontColor,
    fontFamily: 'taviraj',
    //fontWeight: FontWeight.bold
  );
  static primaryBtnTextStyle(Size size)=> TextStyle(
    fontSize: size.width*.044,
    color: Colors.white,
    fontFamily: 'taviraj',
    fontWeight: FontWeight.bold
  );
  static outlineBtnTextStyle(Size size)=> TextStyle(
    fontSize: size.width*.044,
    color: Colors.pink,
    fontFamily: 'taviraj',
    fontWeight: FontWeight.bold
  );
  static popupMenuTextStyle(Size size)=> TextStyle(
    fontSize: 12.0,
    color: Colors.grey.shade900,
    fontFamily: 'taviraj',
  );
  static otpTextStyle(Size size)=> TextStyle(
      fontFamily: 'taviraj',
      color: ColorsVariables.textColor,
      fontStyle: FontStyle.normal,
      fontSize: size.width * .06
  );




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

  static final List<DropdownMenuItem<String>>  dropDownGenderItem = genderItems
      .map((String value) =>
      DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  static final List<DropdownMenuItem<String>> dropDownYearsItem = yearItems
      .map((String value) =>
      DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  static final List<DropdownMenuItem<String>> dropDownDaysItem = dayItems
      .map((String value) =>
      DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();

  static final List<DropdownMenuItem<String>> dropDownMonthsItem =
  monthItems.map((String value) {
    return DropdownMenuItem<String>(value: value, child: Text(value));
  }).toList();

}