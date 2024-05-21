import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/api/api_manager.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/home/data/data_source/home_ds.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductModel.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/repository/home_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeRepo )
class HomeRepoImpl implements HomeRepo{
  HomeDs homeDs;
  ApiManager apiManager;
  HomeRepoImpl(this.homeDs,this.apiManager);
  @override
  Future<Either<Failure, BrandModel>> getBrands() async{
    try{
       var result =await homeDs.getBrands();
       return Right(result);
    }catch(e){
      print(e.toString());
      return Left(RemoteFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, CategoryModel>> getCategories() async{
    try{
      var result =await homeDs.getCategories();
      return Right(result);
    }catch(e){
      print(e.toString());
      return Left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProducts() async{
 try{
   var result=await homeDs.getProducts();
   return Right(result);
 }catch(e){
   print(e.toString());

   return Left(RemoteFailure(e.toString()));
 }
  }

  @override
  Future<Either<Failure, ProductCartModel>> addProductToCart(String productId) async{
    try{
      var result=await homeDs.addProductToCart(productId);


      return Right(result);
    }catch(e){
      print(e.toString());

      return Left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async{
    try{
  var result=await homeDs.getCart();
  return Right(result);
    } catch(e){
      print(e.toString());
   return Left(RemoteFailure(e.toString()));
    }

  }

}