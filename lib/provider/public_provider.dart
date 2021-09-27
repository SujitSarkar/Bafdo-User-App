import 'package:bafdo/model/product_list_model.dart';
import 'package:bafdo/model/traditional_product_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:bafdo/model/categories_model.dart';
import 'package:bafdo/model/brands_top_model.dart';
import 'package:bafdo/model/brands_model.dart';
import 'package:bafdo/model/sliders_model.dart';
import 'package:bafdo/model/traditional_categories_model.dart';
import 'package:bafdo/model/featured_categories_model.dart';
import 'package:http/http.dart' as http;

class PublicProvider extends ChangeNotifier{
  Categories? _categories;
  TopBrands? _topBrands;
  Brands? _brands;
  FeaturedCategories? _featuredCategories;
  TraditionalCategories? _traditionalCategories;
  TraditionalProductList? _traditionalCategoriesProducts;
  TraditionalProductList? get traditionalCategoriesProducts => _traditionalCategoriesProducts;
  TraditionalProductList? _featuredCategoriesProducts;
  TraditionalProductList? get featuredCategoriesProducts => _featuredCategoriesProducts;

  ProductList? _handPickedProducts;
  ProductList? get handPickedProducts => _handPickedProducts;
  ProductList? _flashDealProducts;
  ProductList? get flashDealProducts => _flashDealProducts;
  ProductList? _dailyFeaturedProducts;
  ProductList? get dailyFeaturedProducts => _dailyFeaturedProducts;

  List<String> _sliderlist=[];
  List<String> get  sliderList=>_sliderlist;
  TraditionalCategories? get traditionalCategories => _traditionalCategories;
  FeaturedCategories? get featuredCategories => _featuredCategories;
  Brands? get brands => _brands;
  TopBrands? get topBrands => _topBrands;
  Categories? get categories => _categories;

  Future<Categories?> getCategories()async{
    try{
      String url = "https://bafdo.com/api/v2/categories";

      var response = await http.get(Uri.parse(url));

      Categories categories = categoriesFromJson(response.body);
      return categories;

    }catch(error){
      print(error.toString());
      return null;
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

  Future<FeaturedCategories?> getFeaturedCategories()async{
    try{
      String url = "https://bafdo.com/api/v1/categories/featured";

      var response = await http.get(Uri.parse(url));

      FeaturedCategories featuredCategories = featuredCategoriesFromJson(response.body);
      return featuredCategories;

    }catch(error){
      print(error.toString());
      return null;
    }
  }
  Future<TraditionalProductList?> getTraditionalProductList(String link)async{
    try{
      String url = "$link";

      var response = await http.get(Uri.parse(url));

      TraditionalProductList traditionalProductList = traditionalProductListFromJson(response.body);
      return traditionalProductList;

    }catch(error){
      print(error.toString());
      return null;
    }
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
      _sliderlist.add('https://bafdo.com/public/${result.data![0].photo!}');
    }
    print(_sliderlist.length);
    notifyListeners();
  }

  Future<void> fetchBrands()async {
    var result = await getBrands();
    _brands=result;
    notifyListeners();
  }

  Future<void> fetchTopBrands()async {
    var result = await getTopBrands();
    _topBrands=result;
    notifyListeners();
  }

  Future<void> fetchCategories()async {
    var result = await getCategories();
    _categories=result;
    notifyListeners();
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

  Future<void> fetchTraditionalCategoriesProducts(String link)async {
    var result = await getTraditionalProductList(link);
    _traditionalCategoriesProducts=result;
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
  Future<ProductList?> getFlashDealProducts()async{
    try{
      String url = "https://bafdo.com/api/v2/products/flash-deal";

      var response = await http.get(Uri.parse(url));

      ProductList productList1 = productListFromJson(response.body);
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
}