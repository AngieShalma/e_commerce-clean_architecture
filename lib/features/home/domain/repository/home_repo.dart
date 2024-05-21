import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductModel.dart';

abstract class  HomeRepo{
  Future<Either<Failure,BrandModel>>getBrands();
  Future<Either<Failure,CategoryModel>>getCategories();
  Future<Either<Failure,ProductModel>>getProducts();
  Future<Either<Failure,ProductCartModel>>addProductToCart(String productId);
  Future<Either<Failure,CartModel>>getCart();
}