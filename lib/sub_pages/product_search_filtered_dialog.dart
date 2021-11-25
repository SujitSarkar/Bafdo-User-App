import 'package:bafdo/model/categories_model.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchFilteredDialog extends StatefulWidget {
  const ProductSearchFilteredDialog({Key? key}) : super(key: key);

  @override
  _ProductSearchFilteredDialogState createState() =>
      _ProductSearchFilteredDialogState();
}

class _ProductSearchFilteredDialogState extends State<ProductSearchFilteredDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  CatDatum? _categories;

  TextEditingController _minPrice=TextEditingController(text: '');
  TextEditingController _maxPrice=TextEditingController(text: '');
  String _isChecked = '';
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return StatefulBuilder(
      builder: (context,setState) {
        return AlertDialog(
          scrollable: true,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.grey,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * .3),
                    child: Text(
                      'Filters',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .045),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Divider(height: 0, color: Colors.grey),

              ///Category Dropdown
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/app_icon/body_icon/circuler_menu_icon.png'),
                    SizedBox(width: 10),
                    Text('Category',style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * .045)),SizedBox(width: 20),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<CatDatum>(
                          value: _categories,
                          isExpanded: true,
                          isDense: true,
                          icon: Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black),
                          itemHeight: size.width*.22,
                          onChanged: (value)=>
                              setState(() => _categories = value),
                          dropdownColor: Colors.white,
                          items: publicProvider.featuredCategories!.data!
                              .map<DropdownMenuItem<CatDatum>>((CatDatum model){
                            return DropdownMenuItem<CatDatum>(
                              value: model,
                              child: Text(model.name!,style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .04),),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 0, color: Colors.grey),
              ///Radio Button
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price High To Low',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .045),
                    ),
                    InkWell(
                      onTap: ()=>setState(()=>_isChecked = 'price_high_to_low'),
                      child: Image.asset(_isChecked !=
                          'price_high_to_low'
                          ? 'assets/app_icon/body_icon/circuler_box.png'
                          : 'assets/app_icon/body_icon/pink_sign.png'),
                    ),
                  ],
                ),
              ),
              Divider(height: 0,color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price Low To High',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .045),
                    ),
                    InkWell(
                      onTap: ()=>setState(()=>_isChecked = 'price_low_to_high'),
                      child: Image.asset(_isChecked !=
                          'price_low_to_high'
                          ? 'assets/app_icon/body_icon/circuler_box.png'
                          : 'assets/app_icon/body_icon/pink_sign.png'),
                    ),
                  ],
                ),
              ),
              Divider(height: 0,color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrival',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .045),
                    ),
                    InkWell(
                      onTap: ()=>setState(()=>_isChecked = 'new_arrival'),
                      child: Image.asset(_isChecked !=
                          'new_arrival'
                          ? 'assets/app_icon/body_icon/circuler_box.png'
                          : 'assets/app_icon/body_icon/pink_sign.png'),
                    ),
                  ],
                ),
              ),
              Divider(height: 0,color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popularity',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .045),
                    ),
                    InkWell(
                      onTap: ()=>setState(()=>_isChecked = 'popularity'),
                      child: Image.asset(_isChecked !=
                          'popularity'
                          ? 'assets/app_icon/body_icon/circuler_box.png'
                          : 'assets/app_icon/body_icon/pink_sign.png'),
                    ),
                  ],
                ),
              ),
              Divider(height: 0,color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * .035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Rated',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * .045),
                    ),
                    InkWell(
                      onTap: ()=>setState(()=>_isChecked = 'top_rated'),
                      child: Image.asset(_isChecked !=
                          'top_rated'
                          ? 'assets/app_icon/body_icon/circuler_box.png'
                          : 'assets/app_icon/body_icon/pink_sign.png'),
                    ),
                  ],
                ),
              ),
              Divider(height: 0,color: Colors.grey),

              ///Min & Max Price
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Price',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * .045),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:_minPrice,
                        decoration: InputDecoration(
                          isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: size.width*.05,vertical:0.0 ),
                            hintText: "00",
                            prefixIcon:  Image.asset('assets/app_icon/body_icon/tk.png',height: 12,width: 12,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey)
                            )
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text('-',style: TextStyle(fontSize: size.width*.07,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _maxPrice,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: size.width*.05,vertical:0.0),
                            hintText: "00",
                            prefixIcon:  Image.asset('assets/app_icon/body_icon/tk.png',height: 8,width: 8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey)
                            )
                        ),
                      ),
                    )
                  ]),
              SizedBox(height: size.width * .1),

              ///Button
              _isLoading?showLoadingWidget:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: GradientButton(
                      onPressed: ()=> Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: Colors.pink,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                      borderRadius: 15,
                      height: size.width * .13,
                      width: size.width * .3,
                      gradientColors: [
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * .1),
                  Center(
                    child: GradientButton(
                      onPressed: () async{
                        setState(()=>_isLoading=true);
                        await publicProvider.getFilteredProducts(
                            //page: _productPage,
                            //name: _searchKey,
                            sortKey: _isChecked,
                            //brands: _selectedBrands.join(",").toString(),
                            categories: _categories==null?"":_categories!.name!,
                            max: _maxPrice.text,
                            min: _minPrice.text
                        );
                        setState(()=>_isLoading=false);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.bold,
                            color: ColorsVariables.splashSkip,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                      borderRadius: 15,
                      height: size.width * .13,
                      width: size.width * .3,
                      gradientColors: [
                        Colors.pink.shade600,
                        Colors.pink.shade400
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }


}


