import 'package:e_commerce_clean_architecture/core/api/api_manager.dart';
import 'package:e_commerce_clean_architecture/core/api/end_points.dart';
import 'package:e_commerce_clean_architecture/core/cache/shared_pref.dart';
import 'package:e_commerce_clean_architecture/features/home/data/data_source/home_ds.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeDs )
class HomeDsImpl implements HomeDs{
  ApiManager apiManager;
  HomeDsImpl(this.apiManager);
  @override
  Future<BrandModel> getBrands() async{
  var response=await apiManager.getData(EndPoints.brands);
  BrandModel brandModel=BrandModel.fromJson(response.data);
  return brandModel;
  }

  @override
  Future<CategoryModel> getCategories() async{
   
    var response=await apiManager.getData(EndPoints.categories);
    CategoryModel categoryModel=CategoryModel.fromJson(response.data);
    return categoryModel;
  }

  @override
  Future<ProductModel> getProducts() async{
    var response=await apiManager.getData(EndPoints.products);
    ProductModel productModel=ProductModel.fromJson(response.data);
    return productModel;
  
  }

  @override
  Future<ProductCartModel> addProductToCart(String productId) async{
    var response=await apiManager.postData(EndPoints.addProductToCart,header: {
      "token":CacheHelper.getToken("token")
    },body: {"productId":productId});
   ProductCartModel model=ProductCartModel.fromJson(response.data);
   return model;
  }

  @override
  Future<CartModel> getCart() async{
    var response=await apiManager.getData(EndPoints.addProductToCart,
        header: {"token":CacheHelper.getToken("token")});
    CartModel model=CartModel.fromJson(response.data);
    return model;

  }


}