import 'package:bafdo/pages/priyo_manush_list.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/custom_appbar.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/outline_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPriyoManush extends StatefulWidget {
  @override
  _AddPriyoManushState createState() => _AddPriyoManushState();
}

class _AddPriyoManushState extends State<AddPriyoManush> {

  List<String> _bannerItem=[
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
  ];
  final GlobalKey<PopupMenuButtonState<int>> _genderKey = GlobalKey();
  final GlobalKey<PopupMenuButtonState<int>> _specialDayKey = GlobalKey();
  DateTime _dateTime=DateTime.now();
  TextEditingController _name= TextEditingController(text: '');
  TextEditingController _age= TextEditingController(text: '');
  TextEditingController _relation= TextEditingController(text: '');
  TextEditingController _gender= TextEditingController(text: '');
  TextEditingController _specialDay= TextEditingController(text: '');
  TextEditingController _date= TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: BColors.appBgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomAppBar(
            leading: InkWell(
                onTap: (){Navigator.pop(context);},
                child: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
            title: 'Add Prio Manush',
            trailing: Image.asset('assets/app_icon/app_bar_icon/close.png'),
            trailing2: Container(),
          )
      ),
      body: _bodyUI(size),
    );
  }

  Widget _bodyUI(Size size)=>SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      children: [
        ///Slider
        CarouselSlider(
          options: CarouselOptions(
            height: 130,
            aspectRatio: 16/9,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: _bannerItem.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey.shade50,
                        image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.fitHeight
                        )
                    ),
                  );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20),

        ///Instruction
        Text('Add Your Favourite\nPerson Here',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: size.width*.05,
              fontFamily: 'taviraj',
              fontWeight: FontWeight.w500
          ),),

        ///TextFormField
        _textBuilder('Name', 'Write your favourite name here',size),
        _textBuilder('Age', 'Age',size),
        _textBuilder('Relation Status', 'Write here',size),
        _textBuilder('Gender', 'Select',size),
        _textBuilder('Special Day', 'Birthday',size),
        _textBuilder('Date', '14 / 02 / 21',size),
        SizedBox(height: 30),

        ///Benifit Text
        InkWell(
          onTap: (){},
          child: Text('Benifit',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width*.044,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'taviraj',
                  decoration: TextDecoration.underline
              )),
        ),
        SizedBox(height: 10),

        ///Add Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GradientButton(
              child: Text('Add',style: PublicVariables.primaryBtnTextStyle(size)),
              onPressed: (){},
              borderRadius: size.width*.02,
              height: size.width*.14,
              width: MediaQuery.of(context).size.width,
              gradientColors: [
                Theme.of(context).primaryColor,
                Color(0xffFF2586),
              ]),
        ),
        SizedBox(height: 15),

        ///See all Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomOutlineButton(
            child: Text('See All Prio Manush',style: PublicVariables.outlineBtnTextStyle(size)),
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PriyoManushList())),
            borderRadius: size.width*.02,
            borderColor: Theme.of(context).primaryColor,
            splashColor: Colors.pink.shade100,
            height: size.width*.14,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );

  Widget _textBuilder(String title, String hint, Size size)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(title,
              style: PublicVariables.smallTextStyle(size)),
        ),
        TextFormField(
          controller: title=='Name'
              ?_name
              :title=='Age'
              ?_age
              :title=='Relation Status'
              ?_relation
              :title=='Gender'
              ?_gender
              :title=='Special Day'
              ?_specialDay:_date,
          onTap: (){
            if(title=='Date') _pickDate(context);
          },
          decoration: formDecoration(size).copyWith(
              hintText: hint,
              suffixIcon: title=='Gender'
                  ?_genderPopup(size)
                  :title=='Special Day'
                  ?_specialDayPopup(size)
                  :title=='Date'?Image.asset('assets/app_icon/body_icon/calender.png'):null
          ),
          readOnly:  title=='Gender' || title=='Special Day'||title=='Date'?true:false,
          style: PublicVariables.smallTextStyle(size),
        ),
        SizedBox(height: 15),
      ],
    ),
  );

  Widget _genderPopup(Size size)=>PopupMenuButton<int>(
    key: _genderKey,
    icon: Icon(Icons.keyboard_arrow_down_rounded,color: BColors.greyColor),
    onSelected: (int val){
      setState(() {
        if(val==1) _gender.text='Male';
        if(val==2) _gender.text='Female';
        if(val==3) _gender.text='Others';
      });
    },
    itemBuilder: (context) {
      return <PopupMenuEntry<int>>[
        PopupMenuItem(child: Text('Male',style: PublicVariables.smallTextStyle(size)), value: 1),
        PopupMenuItem(child: Text('Female',style: PublicVariables.smallTextStyle(size)), value: 2,),
        PopupMenuItem(child: Text('Others',style: PublicVariables.smallTextStyle(size)), value: 3,)
      ];
    },
    tooltip: 'Select options',
    offset: Offset(0,40.0),
  );

  Widget _specialDayPopup(Size size)=>PopupMenuButton<int>(
    key: _specialDayKey,
    icon: Icon(Icons.keyboard_arrow_down_rounded,color: BColors.greyColor),
    onSelected: (int val){
      setState(() {
        if(val==1) _specialDay.text ='Birthday';
        if(val==2) _specialDay.text ='Marriage Day';
        if(val==3) _specialDay.text ='Anniversary';
        if(val==4) _specialDay.text ='Valentine Day';
        if(val==5) _specialDay.text ="Mother's Day";
        if(val==6) _specialDay.text ="Father's Day";
      });
    },
    itemBuilder: (context) {
      return <PopupMenuEntry<int>>[
        PopupMenuItem(child: Text('Birthday',style: PublicVariables.smallTextStyle(size)), value: 1),
        PopupMenuItem(child: Text('Marriage day',style: PublicVariables.smallTextStyle(size)), value: 2),
        PopupMenuItem(child: Text('Anniversary',style: PublicVariables.smallTextStyle(size)), value: 3),
        PopupMenuItem(child: Text('Valentine Day',style: PublicVariables.smallTextStyle(size)), value: 4),
        PopupMenuItem(child: Text("Mother's Day",style: PublicVariables.smallTextStyle(size)), value: 5),
        PopupMenuItem(child: Text("Father's Day",style: PublicVariables.smallTextStyle(size)), value: 6),
      ];
    },
    tooltip: 'Select options',
    //color: Colors.white,
    offset: Offset(0,40.0),
  );

  void _pickDate(BuildContext context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((date)=>
        setState((){
          _dateTime=date!;
          _date.text = '${_dateTime.day} / ${_dateTime.month} / ${_dateTime.year}';
        }));
  }
}

