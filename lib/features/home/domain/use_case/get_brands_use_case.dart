import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/repository/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/BrandModel.dart';
@injectable
class GetBrandsUseCase{
  HomeRepo repo;
  GetBrandsUseCase(this.repo);
  Future<Either<Failure, BrandModel>> call()=>repo.getBrands();
}