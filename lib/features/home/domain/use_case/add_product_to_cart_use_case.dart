import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductCartModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repository/home_repo.dart';

@injectable
class AddProductToCartUseCase{
  HomeRepo repo;
  AddProductToCartUseCase (this.repo);
  Future<Either<Failure, ProductCartModel>> call({required String productId})=>repo.addProductToCart(productId);

}