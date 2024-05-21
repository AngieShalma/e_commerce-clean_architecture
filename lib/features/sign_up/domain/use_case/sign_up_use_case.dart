import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpResponseModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/domain/repository/sign_up_repo.dart';

class SignUpUseCase {
  SignUpRepo repo;

  SignUpUseCase(this.repo);

  Future<Either<Failure, SignUpResponse>> call(
          SignUpRequestModel requestModel) =>
      repo.signUp(requestModel);
}
