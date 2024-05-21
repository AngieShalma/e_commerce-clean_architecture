import 'package:e_commerce_clean_architecture/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductModel.dart';

import '../models/CartModel.dart';

abstract class HomeDs {
  Future<BrandModel> getBrands();
  Future<CategoryModel> getCategories();
  Future<ProductModel> getProducts();
  Future<ProductCartModel> addProductToCart(String productId);
  Future<CartModel> getCart();
}
