import 'dart:io';

import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/seller_collection/drawer_tiles.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/public_variables.dart';
import 'package:bafdo/widgets/form_decoration.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerUploadProduct extends StatefulWidget {
  @override
  _SellerUploadProductState createState() => _SellerUploadProductState();
}

class _SellerUploadProductState extends State<SellerUploadProduct> {

  TextEditingController _title= TextEditingController(text: '');
  TextEditingController _model= TextEditingController(text: '');
  TextEditingController _description= TextEditingController(text: '');
  TextEditingController _price= TextEditingController(text: '');

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const brandItems = <String>['Select a brand','Xiomi', 'Symphony', 'Nokia'];
  final List<DropdownMenuItem<String>> _dropDownBrandItem = brandItems
      .map((String value) =>
      DropdownMenuItem<String>(value: value, child: Text(value)))
      .toList();
  String _brandSelectedVal = 'Select a brand';

  List <Color> colors =<Color>[Color(0xffFFFFFF), Color(0xff000000),Color(0xffB81B60),Color(0xffE562B9),Color(0xff6960FF)];



  List selectedColor=[];

  List selectedSize=[];

  List<String> sizeVarient=['S','M','L','XL','XXL'];

  final ImagePicker _picker = ImagePicker();

   XFile? image1;
   XFile? image2;
   XFile? image3;
   XFile? image4;
   XFile? image5;
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsVariables.backgrowndColor,
      key: _scaffoldKey,
      drawer: Drawer(


          child:  DrawerTiles()
      ),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(
          size.width * .2,
        ),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child:
              Image.asset('assets/app_icon/app_bar_icon/menu.png',)),
          trailing1: Container(),
          trailing2: Container(),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Upload Product',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  fontWeight: FontWeight.w500,
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .05),),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textBuilder('Title', 'Title',size),
              Padding(
                padding: EdgeInsets.only( bottom: 5,left: size.width * .05,right: size.width * .05,),
                child: Text('Brand',
                    style: TextStyle(
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .04,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only( bottom: size.width * .04,left: size.width * .05,right: size.width * .05,),
                child: Container(
                  width: size.width ,
                  height: size.width * .15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: ListTile(
                 //   trailing: Icon(Icons.arrow_drop_down_outlined),
                    leading: DropdownButtonHideUnderline(

                      child: DropdownButton<String>(

                        elevation: 0,
                        dropdownColor: Colors.white,
                        items: this._dropDownBrandItem,
                        value: _brandSelectedVal,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _brandSelectedVal = newValue;
                            });
                          }
                        },
                      ),
                    ),

                  ),
                ),
              ),
              _textBuilder('Model', 'Model',size),

              Padding(
                padding: EdgeInsets.only( left: size.width * .05,right: size.width * .05,),

                child: Text('Select Available Color',
                    style: TextStyle(
                    color: ColorsVariables.textColor,
                    fontSize: size.width * .04,
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only( bottom: size.width * .02,left: size.width * .05,right: size.width * .05,),

                child: Container(
                  height: size.width*.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

                          if(selectedColor.contains(index)){
                            setState(() {
                              selectedColor.remove(index);
                            });

                          }else {
                            setState(() {
                              selectedColor.add(index);
                            });


                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: colors[index],

                            ),

                             child: selectedColor.contains(index)? Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Image.asset('assets/app_icon/body_icon/checked.png',fit: BoxFit.fill,),
                               ),
                             ):Image.asset('assets/app_icon/body_icon/squire_grey_box.png',),

                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: size.width * .05,right: size.width * .05,),

                child: Text('Select Available Size',
                    style: TextStyle(
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .04,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only( bottom: size.width * .02,left: size.width * .05,right: size.width * .05,),

                child: Container(
                  height: size.width*.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

                          if(selectedSize.contains(index)){
                            setState(() {
                              selectedSize.remove(index);
                            });

                          }else {
                            setState(() {
                              selectedSize.add(index);
                            });


                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),

                            color:  selectedSize.contains(index)?
                               Colors.pink.shade200:Colors.white,

                            ),

                            child: Padding(
                              padding:  EdgeInsets.only(left: size.width * .06,right: size.width * .06,top: size.width * .04,bottom: size.width * .04),
                              child:Center(child: Text(sizeVarient[index]))
                            )

                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

             _textBuilder('Description', 'Description',size),
               _textBuilder('Price', 'Price',size),

              Padding(
                padding:  EdgeInsets.only(left: size.width * .06,right: size.width * .06,top: size.width * .04,bottom: size.width * .04),

                child: Text('Add upto 5 photos',
                    style: TextStyle(
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .05,
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500)),
              ),

              Padding(
                padding:  EdgeInsets.only(left: size.width * .06,right: size.width * .06,bottom: size.width * .04),

                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {

                        setState(() async{
                          image1 = await _picker.pickImage(source: ImageSource.gallery);
                        });

                      },
                      child: Container(
                        height: size.width*.25,
                        width:  size.width*.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(width: 1,color: Colors.grey)
                        ),

                        child:image1==null? Padding(
                          padding:  EdgeInsets.only(left: size.width * .02,right: size.width * .02,top: size.width * .06,bottom: size.width * .06),
                          child: Column(children: [

                            Icon(Icons.photo),
                            Text('Add to photo',
                                style: TextStyle(
                                    color: ColorsVariables.textColor,
                                    fontSize: size.width * .025,
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500)),
                          ],),
                        ):Image.file(File(image1!.path),fit: BoxFit.fill,),
                      ),
                    ),
                  ),

                  SizedBox(width:size.width * .01 ,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() async{
                          image2 = await _picker.pickImage(source: ImageSource.gallery);
                        });

                      },
                      child: Container(

                        height: size.width*.25,
                        width:  size.width*.2,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(width: 1,color: Colors.grey)
                        ),

                        child: image2==null? Padding(
                          padding:  EdgeInsets.only(left: size.width * .02,right: size.width * .02,top: size.width * .06,bottom: size.width * .06),
                          child: Column(children: [

                            Icon(Icons.photo),
                            Text('Add to photo',
                                style: TextStyle(
                                    color: ColorsVariables.textColor,
                                    fontSize: size.width * .025,
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500)),
                          ],),
                        ):Image.file(File(image2!.path,),fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                  SizedBox(width:size.width * .01,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(()async {
                          image3 = await _picker.pickImage(source: ImageSource.gallery);
                        });

                      },
                      child: Container(
                        height: size.width*.25,
                        width:  size.width*.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(width: 1,color: Colors.grey)
                        ),

                        child: image3==null? Padding(
                          padding:  EdgeInsets.only(left: size.width * .02,right: size.width * .02,top: size.width * .06,bottom: size.width * .06),
                          child: Column(children: [

                            Icon(Icons.photo),
                            Text('Add to photo',
                                style: TextStyle(
                                    color: ColorsVariables.textColor,
                                    fontSize: size.width * .025,
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500)),
                          ],),
                        ):Image.file(File(image3!.path),fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(width:size.width * .01,),
                  Expanded(
                    child: InkWell(
                      onTap: () {

                        setState(() async{
                          image4 = await _picker.pickImage(source: ImageSource.gallery);
                        });

                      },
                      child: Container(
                        height: size.width*.25,
                        width:  size.width*.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(width: 1,color: Colors.grey)
                        ),

                        child:image4==null? Padding(
                          padding:  EdgeInsets.only(left: size.width * .02,right: size.width * .02,top: size.width * .06,bottom: size.width * .06),
                          child: Column(children: [

                            Icon(Icons.photo),
                            Text('Add to photo',
                                style: TextStyle(
                                    color: ColorsVariables.textColor,
                                    fontSize: size.width * .025,
                                    fontFamily: 'taviraj',
                                    fontWeight: FontWeight.w500)),
                          ],),
                        ):Image.file(File(image4!.path),fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],),
              ),
              SizedBox(width:size.width * .01,),
              Padding(
                padding:  EdgeInsets.only(left: size.width * .06,right: size.width * .06,bottom: size.width * .04),

                child: InkWell(
                  onTap: () {

                    setState(() async{
                      image5 = await _picker.pickImage(source: ImageSource.gallery);

                    });

                  },
                  child: Container(
                    height: size.width*.25,
                    width:  size.width*.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(width: 1,color: Colors.grey),
                          //
                          // image: DecorationImage(image: FileImage(File(image5!.path),),fit: BoxF)


                    ),


                    child: image5==null? Padding(
                      padding:  EdgeInsets.only(left: size.width * .025,right: size.width * .025,top: size.width * .06,bottom: size.width * .06),
                      child: Column(children: [


                        Icon(Icons.photo),
                        Text('Add to photo',
                            style: TextStyle(
                                color: ColorsVariables.textColor,
                                fontSize: size.width * .025,
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500)),
                      ],),
                    ):Image.file(File(image5!.path),fit: BoxFit.fill,),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width * .025,right: size.width * .025,top: size.width * .06,bottom: size.width * .06),

                child: Text('***You must upload at least one photo',
                    style: TextStyle(
                        color: ColorsVariables.textColor,
                        fontSize: size.width * .03,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500)),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GradientButton(
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text(
                        'Upload',

                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                    ],
                  ),
                  borderRadius: 9,
                  height: size.width * .13,
                  width: size.width,
                  gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
                ),
              ),

SizedBox(height: 50,)
              //
              //
              //
              // Center(
              //     child: Text('Seller Upload Product')
              // ),
            ],
          ),
        ),
      ),
    );
  }
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
          maxLines:title=='Description'? 5:1 ,
          textAlign: TextAlign.left,
              decoration: new InputDecoration(

                hintText:title=='Title'?'Type a name':title=='Model'?'Type model number':
                title=='Description'?'Write details about your product' :'Pick a price',
                hintStyle: TextStyle(color: Colors.grey,),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),

              ),
          controller: title=='Title'
              ?_title

              :title=='Model'
              ?_model
              :title=='Description'
              ?_description
              :_price,

          onTap: (){

          },


        ),
        SizedBox(height: 15),
      ],
    ),
  );




}
