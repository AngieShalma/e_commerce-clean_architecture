import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CartModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repository/home_repo.dart';

@injectable
class GetCartUseCase{
  HomeRepo repo;
  GetCartUseCase (this.repo);
  Future<Either<Failure, CartModel>> call()=>repo.getCart();

}