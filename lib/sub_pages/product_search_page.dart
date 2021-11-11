import 'package:bafdo/custom_widget/category_products_list_tile.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:bafdo/variables/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/sub_pages/product_search_filtered_dialog.dart';
import 'package:bafdo/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  TextEditingController _searchController = TextEditingController(text: "");
  SharedPreferences? _preferences;
  List<String> _recentSearch=[];
  bool _hideRecentSearch=true;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initialize();
  }
  Future<void> _initialize()async{
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _recentSearch = _preferences!.getStringList('recentSearchList')??[];
    });
  }

  void _saveRecentSearchList()async{
    if(!_recentSearch.contains(_searchController.text))
    _recentSearch.add(_searchController.text);
    _preferences!.setStringList('recentSearchList', _recentSearch);
    setState((){
      _recentSearch = _preferences!.getStringList('recentSearchList')??[];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        // backgroundColor: Color(0xffF7F5F5),
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          trailing1: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => ProductSearchFilteredDialog(),
              );
            },
            child: Image.asset(
              'assets/app_icon/app_bar_icon/filter_icon.png',
              scale: .8,
            ),
          ),
          trailing2: Container(),
          title: Container(
            width: size.width * .7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(size.width * .03),
              ),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                child: TextFormField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  onTap: ()=> setState(()=>_hideRecentSearch=false),
                  onChanged: (val){
                    _searchController;
                    setState(() {});
                  },
                  onFieldSubmitted: (val)async{
                    _saveRecentSearchList();
                    showLoadingDialog(context);
                    await publicProvider.getSearchProducts(_searchController.text);
                    _searchController.clear();
                    closeLoadingDialog(context);
                    _focusNode.unfocus();
                    setState((){
                      _focusNode.unfocus();
                      _hideRecentSearch=true;
                    });
                  },
                  onEditingComplete: (){
                    setState((){
                      _focusNode.unfocus();
                      _hideRecentSearch=true;
                    });
                  },
                  style: TextStyle(color: Colors.pink),
                  decoration: InputDecoration(
                      focusColor: Colors.pink,
                      hintText: 'Search product',
                      hintStyle: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),
                      suffixIcon: InkWell(
                        onTap: ()async{
                          _saveRecentSearchList();
                          showLoadingDialog(context);
                          await publicProvider.getSearchProducts(_searchController.text);
                          _searchController.clear();
                          closeLoadingDialog(context);
                          setState((){
                            _focusNode.unfocus();
                            _hideRecentSearch=true;
                          });
                          },
                        child: Image.asset(
                          'assets/app_icon/text_field_icon/search_icon.png',
                          color: _searchController.text.isNotEmpty
                              ? Colors.pink
                              : Colors.grey,
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  cursorColor: Color(0xff131214),
                )),
          ),
          hideUnderLine: true,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: _bodyUI(publicProvider)
    );
  }

  Widget _bodyUI(PublicProvider publicProvider) {
    final Size size = MediaQuery.of(context).size;
    return ListView(
      physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          ///Recent Search
          _hideRecentSearch
              ?Container()
              :Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width*.05,vertical: size.width*.04),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Search',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04),
            ),
            Divider(height: 8, color: Colors.grey),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _recentSearch.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: ()async{
                    _saveRecentSearchList();
                    showLoadingDialog(context);
                    await publicProvider.getSearchProducts(_searchController.text);
                    closeLoadingDialog(context);
                    setState(()=>_hideRecentSearch=true);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(_recentSearch[index],
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: BColors.fontColor,
                          fontSize: size.width * .035)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
          SizedBox(height: size.width*.04),

          ///Search Product
          publicProvider.searchProducts!=null
              ?Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*.04),
                child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: publicProvider.searchProducts!.data!.length,
            itemBuilder: (BuildContext context, int index) {
                return CategoryProductListTile(productList: publicProvider.searchProducts!.data![index]);
            },
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2.2 : 2.5),
            mainAxisSpacing: size.width*.03,
            crossAxisSpacing: size.width*.03,
          )):Container(),
    ]);
  }
}
