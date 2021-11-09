import 'dart:convert';
import 'package:bafdo/model/cart_model.dart';
import 'package:bafdo/model/flash_deal_product_model.dart';
import 'package:bafdo/model/home_product_model.dart';
import 'package:bafdo/model/product_details_model.dart';
import 'package:bafdo/model/product_list_model.dart';
import 'package:bafdo/model/related_product_model.dart';
import 'package:bafdo/model/reviews_model.dart';
import 'package:bafdo/model/anniversary_product_list_model.dart';
import 'package:bafdo/model/wish_list_model.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/model/categories_model.dart';
import 'package:bafdo/model/brands_top_model.dart';
import 'package:bafdo/model/brands_model.dart';
import 'package:bafdo/model/sliders_model.dart';
import 'package:bafdo/model/traditional_categories_model.dart';
import 'package:http/http.dart' as http;

class PublicProvider extends AuthProvider{
  String? _message;
  Categories? _categories;
  Categories? _subCategories;
  Categories? _childSubCategories;
  TopBrands? _topBrands;
  Brands? _brands;
  Categories? _featuredCategories;
  TraditionalCategories? _traditionalCategories;
  AnniversaryProductList? _traditionalCategoriesProducts;
  ProductDetails? _productDetails;
  RelatedProducts? _relatedProducts;
  Reviews? _reviews;
  List<CartModel>? _carts;
  WishlistModel? _wishlistModel;

  AnniversaryProductList? get traditionalCategoriesProducts => _traditionalCategoriesProducts;
  AnniversaryProductList? _featuredCategoriesProducts;
  AnniversaryProductList? get featuredCategoriesProducts => _featuredCategoriesProducts;
  ProductDetails? get productDetails => _productDetails;
  RelatedProducts? get relatedProducts => _relatedProducts;
  Reviews? get reviews => _reviews;
  List<CartModel>? get carts => _carts;
  String? get message=> _message;
  get wishlistModel => _wishlistModel;

  ProductList? _handPickedProducts;
  ProductList? get handPickedProducts => _handPickedProducts;
  FlashDealProductModel? _flashDealProducts;
  FlashDealProductModel? get flashDealProducts => _flashDealProducts;
  ProductList? _dailyFeaturedProducts;
  ProductList? get dailyFeaturedProducts => _dailyFeaturedProducts;

  HomeProductModel? _homeProducts;
  HomeProductModel? get homeProducts => _homeProducts;

  List<String> _sliderList=[];
  List<String> get  sliderList=>_sliderList;
  TraditionalCategories? get traditionalCategories => _traditionalCategories;
  Categories? get featuredCategories => _featuredCategories;
  Brands? get brands => _brands;
  TopBrands? get topBrands => _topBrands;
  Categories? get categories => _categories;
  Categories? get subCategories => _subCategories;
  Categories? get childSubCategories => _childSubCategories;

  Future<RelatedProducts?> getRelatedProducts(int productId)async{
    try{
      String url = "https://bafdo.com/api/v2/products/related/$productId";

      var response = await http.get(Uri.parse(url));

      RelatedProducts relatedProducts = relatedProductsFromJson(response.body);
      return relatedProducts;

    }catch(error){
      print(error.toString());
      return null;
    }
  }

  Future<ProductDetails?> getProductDetails(int productId)async{
    try{
      String url = "https://bafdo.com/api/v2/products/$productId";
      var response = await http.get(Uri.parse(url));
      ProductDetails productDetails = productDetailsFromJson(response.body);
      return productDetails;
    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchProductDetails(int productId)async {
    var result = await getProductDetails(productId);
    _productDetails=result;
    await fetchRelatedProducts(productId);
    await fetchReviews(productId);
    notifyListeners();
  }
  Future<void> fetchRelatedProducts(int productId)async {
    var result = await getRelatedProducts(productId);
    _relatedProducts=result;
    notifyListeners();
  }

  Future<Categories?> getSpecialCategories()async{
    try{
      String url = "https://bafdo.com/api/v2/categories/featured";
      var response = await http.get(Uri.parse(url));
      Categories categories = categoriesFromJson(response.body);
      return categories;
    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchSpecialCategories()async {
    var result = await getSpecialCategories();
    _categories=result;
    notifyListeners();
  }

  Future<void> getSubCategories(String url)async{
    try{
      _subCategories=null;
      var response = await http.get(Uri.parse(url));
      _subCategories = categoriesFromJson(response.body);
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }
  Future<void> getChildSubCategories(String url)async{
    try{
      _childSubCategories=null;
      var response = await http.get(Uri.parse(url));
      _childSubCategories = categoriesFromJson(response.body);
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<TopBrands?> getTopBrands()async{
    try{
      String url = "https://bafdo.com/api/v2/brands/top";
      var response = await http.get(Uri.parse(url));
      TopBrands topBrands = topBrandsFromJson(response.body);
      return topBrands;

    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchTopBrands()async {
    var result = await getTopBrands();
    _topBrands=result;
    notifyListeners();
  }

  Future<Brands?> getBrands()async{
    try{
      String url = "https://bafdo.com/api/v2/brands";
      var response = await http.get(Uri.parse(url));
      Brands brands = brandsFromJson(response.body);
      return brands;

    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchBrands()async {
    var result = await getBrands();
    _brands=result;
    notifyListeners();
  }


  Future<Categories?> getFeaturedCategories()async{
    try{
      String url = "https://bafdo.com/api/v2/categories";
      var response = await http.get(Uri.parse(url));
      Categories featuredCategories = categoriesFromJson(response.body);
      return featuredCategories;
    }catch(error){
      print(error.toString());
      return null;
    }
  }

  Future<void> fetchFeaturedCategories()async {
    var result = await getFeaturedCategories();
    _featuredCategories=result;
    notifyListeners();
  }
  Future<void> fetchFeaturedCategoriesProducts(String link)async {
    var result = await getTraditionalProductList(link);
    _featuredCategoriesProducts=result;
    notifyListeners();
  }


  Future<TraditionalCategories?> getTraditionalCategories()async{
    try{
      String url = "https://bafdo.com/api/v1/categories/home";
      var response = await http.get(Uri.parse(url));
      TraditionalCategories traditionalCategories = traditionalCategoriesFromJson(response.body);
      return traditionalCategories;
    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchTraditionalCategories()async {
    var result = await getTraditionalCategories();
    _traditionalCategories=result;
    fetchTraditionalCategoriesProducts(_traditionalCategories!.data![0].links!.products!);
    notifyListeners();
  }

  Future<AnniversaryProductList?> getTraditionalProductList(String link)async{
    try{
      String url = "$link";
      var response = await http.get(Uri.parse(url));
      AnniversaryProductList traditionalProductList = anniversaryProductListFromJson(response.body);
      return traditionalProductList;

    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchTraditionalCategoriesProducts(String link)async {
    var result = await getTraditionalProductList(link);
    _traditionalCategoriesProducts=result;
    notifyListeners();
  }

  Future<Sliders?> getSliders()async{
    try{
      String url = "https://bafdo.com/api/v1/sliders";
      var response = await http.get(Uri.parse(url));
      Sliders sliders = slidersFromJson(response.body);
      return sliders;

    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchSliders()async {
    var result = await getSliders();
    for(int i=0;i<result!.data!.length;i++){
      _sliderList.add('https://bafdo.com/public/${result.data![0].photo!}');
    }
    print(_sliderList.length);
    notifyListeners();
  }


  Future<ProductList?> getHandPickedProducts()async{
    try{
      String url = "https://bafdo.com/api/v2/products/todays-deal";
      var response = await http.get(Uri.parse(url));
      ProductList productList1 = productListFromJson(response.body);
      return productList1;
    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchHandPickProducts()async {
    var result = await getHandPickedProducts();
    _handPickedProducts=result;
    notifyListeners();
  }

  Future<FlashDealProductModel?> getFlashDealProducts()async{
    try{
      String url = "https://bafdo.com/api/v1/products/flash-deal";
      var response = await http.get(Uri.parse(url));
      FlashDealProductModel productList1 = flashDealProductModelFromJson(response.body);
      return productList1;
    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchFlashDealProducts()async {
    var result = await getFlashDealProducts();
    _flashDealProducts=result;
    notifyListeners();
  }

  Future<void> getHomeProducts()async{
    try{
      String url = "https://bafdo.com/api/v2/products/home";
      var response = await http.get(Uri.parse(url));
      if(response.statusCode==200){
        _homeProducts = homeProductModelFromJson(response.body);
      }
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<ProductList?> getDailyFeaturedProducts()async{
    try{
      String url = "https://bafdo.com/api/v2/products/featured";
      var response = await http.get(Uri.parse(url));
      ProductList productList1 = productListFromJson(response.body);
      return productList1;
    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchDailyFeaturedProducts()async {
    var result = await getDailyFeaturedProducts();
    _dailyFeaturedProducts=result;
    notifyListeners();
  }

  Future<Reviews?> getReviews(int productId)async{
    try{
      String url = "https://bafdo.com/api/v2/reviews/product/$productId";
      var response = await http.get(Uri.parse(url));
      Reviews reviews = reviewsFromJson(response.body);
      return reviews;

    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchReviews(int productId)async {
    var result = await getReviews(productId);
    _reviews=result;
    notifyListeners();
  }

  Future<bool> addCart(int productId,int quantity) async {
    try{
      if(prefUserModel==null) await getPrefUser();
      var postBody = jsonEncode({"id": "$productId","user_id": prefUserModel.id,"quantity": "$quantity"});
      final response = await http.post(Uri.parse("https://bafdo.com/api/v2/carts/add"),
          headers: { "Content-Type":"application/json", "Authorization": "Bearer ${prefUserModel.accessToken}"},body: postBody );
      var jsonData = jsonDecode(response.body);
      if(jsonData['result']==true) return true;
      else return false;
    }catch(error){
      return false;
    }
  }

  Future<List<CartModel>> getCartList() async {
    List<CartModel> carts=[];

    final response =await http.post(Uri.parse("https://bafdo.com/api/v2/carts/${prefUserModel.id}"),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer ${prefUserModel.accessToken}"}, );
    var jsonResponse= jsonDecode(response.body);
    if(jsonResponse.isNotEmpty)
     carts = cartModelFromJson(response.body);
    else carts.clear();

    return carts;
  }
  Future<void> fetchCartList()async {
    if(prefUserModel==null) await getPrefUser();
    var result = await getCartList();
    _carts=result;
    notifyListeners();
  }

  Future<void> updateCart(int cartId,int quantity) async {
    if(prefUserModel==null) await getPrefUser();
    var postBody = jsonEncode({"id": "$cartId","quantity": "$quantity"});
    final response = await http.post(Uri.parse("https://bafdo.com/api/v2/carts/change-quantity"),
        headers: { "Content-Type":"application/json", "Authorization": "Bearer ${prefUserModel.accessToken}"},body: postBody );

    print(response.body.toString());
  }

  Future<void> deleteCart(int cartId) async {
    if(prefUserModel==null) await getPrefUser();
    final response = await http.delete(Uri.parse("https://bafdo.com/api/v2/carts/$cartId"),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer ${prefUserModel.accessToken}"}, );

    print(response.body.toString());
  }

  Future<void> addWishList(int productId) async {
    if(prefUserModel==null) await getPrefUser();
    final response =
    await http.get((Uri.parse("https://bafdo.com/api/v2/wishlists-add-product?product_id=$productId&user_id=${prefUserModel.id}")),
      headers: { "Authorization": "Bearer ${prefUserModel.accessToken}"});
    print(response.body);
  }
  Future<void> deleteWishList(int productId) async {
    if(prefUserModel==null) await getPrefUser();
    final response =
    await http.get((Uri.parse("https://bafdo.com/api/v2/wishlists-remove-product?product_id=$productId&user_id=${prefUserModel.id}")),
        headers: { "Authorization": "Bearer ${prefUserModel.accessToken}"});
    print(response.body);
  }
  Future<String?> isProductWished(int productId) async {
    if(prefUserModel==null) await getPrefUser();
    final response =
    await http.get((Uri.parse("https://bafdo.com/api/v2/wishlists-check-product?product_id=$productId&user_id=${prefUserModel.id}")),
        headers: { "Authorization": "Bearer ${prefUserModel.accessToken}"});
    if(response.statusCode==200){
      var jsonData =  jsonDecode(response.body);
      String msg=jsonData["message"];
      _message=msg;
      return _message;
    }
  }
  Future<WishlistModel?> getWishList() async {
    final response =await http.get(Uri.parse("https://bafdo.com/api/v2/wishlists/${prefUserModel.id}"),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer ${prefUserModel.accessToken}"}, );

    WishlistModel? wishlistModel = wishlistModelFromJson(response.body);
    return wishlistModel;
  }
  Future<void> fetchWishList()async {
    if(prefUserModel==null) await getPrefUser();
    _wishlistModel = await getWishList();
    notifyListeners();
  }

  Future<void> getFilteredProducts({name = "",sortKey = "",page = 1,
        brands = "",categories = "",min = "",max = ""})async{

    final String url = "https://bafdo.com/api/v2/products/search" +
        "?page=$page&name=$name&sort_key=$sortKey&brands=$brands&categories=$categories&min=$min&max=$max";

    final response = await http.get(Uri.parse(url));
  }

}