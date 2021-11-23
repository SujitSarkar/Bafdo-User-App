import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/model/address_model.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/provider/sqlite_database_helper.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/widgets/gradient_button.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  final String ownerId;
  final String totalAmount;
  const CheckoutPage({Key? key,required this.ownerId,required this.totalAmount}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String paymentItem = 'Cash On Delivery';
  int selectIndex = 0;
  int _counter=0;
  bool _addressLoading=false;
  final TextEditingController _address = TextEditingController(text: '');
  final TextEditingController _city = TextEditingController(text: '');
  final TextEditingController _phone = TextEditingController(text: '');
  final TextEditingController _zip = TextEditingController(text: '');
  final TextEditingController _country = TextEditingController(text: '');
  final GlobalKey<FormState>  _formKey = GlobalKey();

  _customInit(DatabaseHelper databaseHelper)async{
    _counter++;
    await databaseHelper.getAddressList();
    print(databaseHelper.addressList.length);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DatabaseHelper databaseHelper = Provider.of<DatabaseHelper>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if(_counter==0) _customInit(databaseHelper);

    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: ()=> Navigator.pop(context),
              child: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: Text('Checkout',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04)),
          trailing1: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset('assets/app_icon/app_bar_icon/close.png')),
          trailing2: Container(),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping to',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .04)),
                InkWell(
                  onTap: ()=>addAddressDialog(databaseHelper,size),
                  child: Image.asset(
                      'assets/app_icon/body_icon/drop_circuler_add.png'),
                )
              ],
            ),
          ),
          ListView.builder(
            // scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount:databaseHelper.addressList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _checkoutListTile(index,databaseHelper);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Payment Method',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    color: ColorsVariables.textColor,
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * .04)),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Container(
              height: size.width * .4,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            paymentItem = 'nagad';
                          });
                        },
                        child: paymentItem == 'nagad'
                            ?Image.asset(
                                'assets/app_icon/body_icon/squire_pink_box.png')
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/squire_grey_box.png'),
                              ),
                      ),
                      Image.asset(
                        'assets/app_icon/body_icon/nogot_logo.png',height:size.width * .15,width:  size.width * .15,

                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            paymentItem = 'bkash';
                          });
                        },
                        child: paymentItem == 'bkash'
                            ? Image.asset(
                                'assets/app_icon/body_icon/squire_pink_box.png')
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/squire_grey_box.png'),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/app_icon/body_icon/bkash_logo.png',height:size.width * .15,width:  size.width * .15,

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            paymentItem = 'Cash On Delivery';
                          });
                        },
                        child: paymentItem == 'Cash On Delivery'
                            ? Image.asset(
                                'assets/app_icon/body_icon/squire_pink_box.png')
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'assets/app_icon/body_icon/squire_grey_box.png'),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Cash On Delivery'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping fee',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04)),
                        Text('৳ 0.00',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub total',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04)),
                        Text('৳${widget.totalAmount}',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04)),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: ColorsVariables.dividerColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('৳ ${widget.totalAmount}',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),

          ///Order Button
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GradientButton(
              onPressed: ()async{
                showLoadingDialog(context);
                await publicProvider.createNewOrder(widget.ownerId, paymentItem).then((value)async{
                  await publicProvider.fetchCartList();
                  closeLoadingDialog(context);
                });
              },
              child: Text(
                'Complete Order',
                style: TextStyle(
                    fontFamily: 'taviraj',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: size.width * .045),
              ),
              borderRadius: 6.97,
              height: size.width * .13,
              width: size.width,
              gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
            ),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }

  void addAddressDialog(DatabaseHelper databaseHelper, Size size){
    showDialog(
      context: context,
       builder: (context)=>StatefulBuilder(builder: (context, setState)=>AlertDialog(
         insetPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
         title: Text('Add New Address',textAlign: TextAlign.center),
         scrollable: true,
          content:Form(
             key: _formKey,
            child: Column(
              children: [
                _textFieldBuilder('Phone', size),
                _textFieldBuilder('Address', size),
                _textFieldBuilder('Country', size),
                _textFieldBuilder('City', size),
                _textFieldBuilder('Postal Code', size),
                SizedBox(height: size.width*.06),
                _addressLoading ? SizedBox(
                  width: size.width,
                  child: showLoadingWidget)
                :GradientButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                  setState(()=> _addressLoading=true);
                  AddressModel addressModel=AddressModel(
                    _country.text,_address.text,_city.text,_phone.text,_zip.text);
                    databaseHelper.insertAddress(addressModel).then((value) =>{
                        setState(()=> _addressLoading=false),
                        showToast('Address Added'),
                        _address.clear(),_phone.clear(),_zip.clear(),_country.clear(),
                        _city.clear(),
                        closeLoadingDialog(context),
                    });
                  }
          
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: size.width * .045),
                ),
                borderRadius: 6.97,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              ],
            ),
          )
       ))
      );
  }

    void updateAddressDialog(DatabaseHelper databaseHelper, Size size){
    showDialog(
      context: context,
       builder: (context)=>StatefulBuilder(builder: (context, setState)=>AlertDialog(
         insetPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
         title: Text('Add New Address',textAlign: TextAlign.center),
         scrollable: true,
          content:Form(
             key: _formKey,
            child: Column(
              children: [
                _textFieldBuilder('Phone', size),
                _textFieldBuilder('Address', size),
                _textFieldBuilder('Country', size),
                _textFieldBuilder('City', size),
                _textFieldBuilder('Postal Code', size),
                SizedBox(height: size.width*.06),
                _addressLoading ? SizedBox(
                  width: size.width,
                  child: showLoadingWidget)
                :GradientButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                  setState(()=> _addressLoading=true);
                  AddressModel addressModel=AddressModel(
                    _country.text,_address.text,_city.text,_phone.text,_zip.text);
                    databaseHelper.updateAddress(addressModel).then((value){
                      setState(()=> _addressLoading=false);
                        showToast('Address Update');
                        _address.clear();_phone.clear();_zip.clear();_country.clear();
                        _city.clear();
                        closeLoadingDialog(context);
                    });
                  }
          
                },
                child: Text(
                  'Update',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: size.width * .045),
                ),
                borderRadius: 6.97,
                height: size.width * .13,
                width: size.width,
                gradientColors: [Colors.pink.shade600, Colors.pink.shade400],
              ),
              ],
            ),
          )
       ))
      );
  }

  Widget _textFieldBuilder(String hint, Size size)=>TextFormField(
    controller: hint=='Address'
    ?_address
    :hint=='Country'
    ?_country
    :hint=='City'
    ?_city
    :hint=='Postal Code'
    ?_zip:_phone,
    validator: (value)=>value!.isEmpty?'Enter $hint':null,
    style: TextStyle(fontFamily: 'taviraj',color: Colors.grey.shade900),
    minLines: hint=='Address'?2:1,
    maxLines: hint=='Address'?2:1,
    decoration: InputDecoration(
    hintText:hint,
    alignLabelWithHint: true,
    hintStyle: TextStyle(fontSize:size.width*.04,
    fontFamily: 'taviraj')),
                
  );

  Widget _checkoutListTile(int index,DatabaseHelper databaseHelper){
    final Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(()=>selectIndex=index);
                  },
                  child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            selectIndex==index?'assets/app_icon/body_icon/squire_pink_box.png'
                            :'assets/app_icon/body_icon/squire_grey_box.png'),
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(databaseHelper.addressList[index].address,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                    Text(databaseHelper.addressList[index].phone,
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.dividerColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                    Text('${databaseHelper.addressList[index].country}'
                        '${databaseHelper.addressList[index].city}'
                        '${databaseHelper.addressList[index].zip}',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.dividerColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                  ],
                ),

                // Image.asset('assets/app_icon/body_icon/drop_circuler_add.png')
              ],
            ),
            InkWell(onTap: () {
              _address.text=databaseHelper.addressList[index].address;
              _country.text=databaseHelper.addressList[index].country;
              _city.text=databaseHelper.addressList[index].city;
              _zip.text=databaseHelper.addressList[index].zip;
              _phone.text=databaseHelper.addressList[index].phone;
              updateAddressDialog(databaseHelper, size);
            }, child: Icon(Icons.edit_outlined)),
          ],
        ),
      ),
    );
  }
}
