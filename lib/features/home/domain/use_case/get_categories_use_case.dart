import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/repository/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/BrandModel.dart';
@injectable
class GetCategoriesUseCase{
  HomeRepo repo;
  GetCategoriesUseCase(this.repo);
  Future<Either<Failure, CategoryModel>> call()=>repo.getCategories();
}