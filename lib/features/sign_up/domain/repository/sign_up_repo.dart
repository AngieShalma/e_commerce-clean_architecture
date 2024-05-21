import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpResponseModel.dart';

abstract class SignUpRepo{
 Future<Either<Failure,SignUpResponse>>signUp(SignUpRequestModel requestModel);
}