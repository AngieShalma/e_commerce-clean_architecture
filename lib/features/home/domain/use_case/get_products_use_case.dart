
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/features/home/data/data_source/home_ds_impl.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/repository/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/ProductModel.dart';

@injectable
class GetProductsUseCase{
HomeRepo repo;
GetProductsUseCase(this.repo);
Future<Either<Failure, ProductModel>> call()=>repo.getProducts();

}